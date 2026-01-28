// ignore_for_file: deprecated_member_use, avoid_print, use_build_context_synchronously

import 'dart:io';
import 'dart:typed_data';
import 'package:country_picker/country_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../core/api_client/dio_custom_service.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/local/domain/repositories/local_storage_repository.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../shared/widgets/phonecountrytextfield.dart';
import '../../../shared/widgets/textfield_new.dart';
import '../../authentication/data/dto/user_update_dto/user_update.dart';
import '../../user/domain/models/user_model.dart';
import '../provider/edit_provider.dart';

class EditprofileScreen extends ConsumerStatefulWidget {
  const EditprofileScreen({super.key});

  @override
  ConsumerState<EditprofileScreen> createState() => _EditprofileScreenState();
}

class _EditprofileScreenState extends ConsumerState<EditprofileScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  Country selectedCountry = Country.parse('US');

  UserData? user;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final fetchedUser = await ref.read(localDataProvider).getUser();
    if (fetchedUser == null) return;

    user = fetchedUser;
    _fullNameController.text =
        (fetchedUser.firstName?.isNotEmpty == true &&
            fetchedUser.lastName?.isNotEmpty == true)
        ? "${fetchedUser.firstName} ${fetchedUser.lastName}"
        : fetchedUser.fullName ?? '';

    _emailController.text = fetchedUser.email ?? '';
    _phoneNumberController.text = fetchedUser.phoneNumber ?? '';
    _profileImageUrl = fetchedUser.profileUrl?.isNotEmpty == true
        ? fetchedUser.profileUrl
        : 'https://i.pinimg.com/736x/15/0f/a8/150fa8800b0a0d5633abc1d1c4db3d87.jpg';

    _phoneNumberController.text = fetchedUser.phoneNumber ?? "";

    setState(() {});
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  Future<void> _handleImageSelection(ImageSource source) async {
    Navigator.pop(context);

    final XFile? file = await _picker.pickImage(
      source: source,
      imageQuality: 80,
      maxWidth: 800,
      maxHeight: 800,
    );

    if (file != null) {
      setState(() {
        _profileImage = File(file.path);
        _isUploadingImage = true;
      });

      try {
        final bytes = await file.readAsBytes();
        final fileName =
            'profile_${DateTime.now().millisecondsSinceEpoch}.${file.path.split('.').last}';
        final uploadResult = await _uploadToS3(fileName, bytes);

        if (uploadResult != null && uploadResult.isNotEmpty) {
          setState(() {
            _profileImageUrl = uploadResult;
            _isUploadingImage = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: PoppinsText(
                context,
                'Profile image uploaded successfully!',
              ),
              backgroundColor: AppColors.white,
            ),
          );
        } else {
          throw Exception('Upload failed');
        }
      } catch (e) {
        setState(() {
          _isUploadingImage = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: PoppinsText(context, 'Failed to upload image: $e'),
            backgroundColor: AppColors.redF81149,
          ),
        );
      }
    }
  }

  Future<String?> _uploadToS3(String fileName, Uint8List bytes) async {
    try {
      final signedUrlResponse = await _getSignedUrl(fileName);
      if (signedUrlResponse == null || !signedUrlResponse['isSuccess']) {
        throw Exception('Failed to get signed URL');
      }
      final uploadUrl = signedUrlResponse['data']['uploadUrl'] as String;
      final uploadResult = await _uploadDirectToS3(uploadUrl, bytes);
      if (uploadResult) {
        return signedUrlResponse['data']['fileUrl'] as String;
      } else {
        throw Exception('Failed to upload to S3');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> _getSignedUrl(String fileName) async {
    try {
      final response = await dio.get(
        'https://drapper.neksoft.com/webapi-drapper/s3-upload',
        queryParameters: {'fileName': fileName},
      );
      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } catch (e) {
      print('Error getting signed URL: $e');
      return null;
    }
  }

  Future<bool> _uploadDirectToS3(String uploadUrl, Uint8List bytes) async {
    try {
      final response = await dio.put(
        uploadUrl,
        data: Stream.fromIterable(bytes.map((e) => [e])),
        options: Options(
          headers: {
            'Content-Type': 'image/png',
            'Content-Length': bytes.length,
          },
        ),
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Error uploading to S3: $e');
      return false;
    }
  }

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text("Gallery"),
              onTap: () => _handleImageSelection(ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Camera"),
              onTap: () => _handleImageSelection(ImageSource.camera),
            ),
          ],
        ),
      ),
    );
  }

  bool _isUploadingImage = false;
  File? _profileImage;
  String? _profileImageUrl;
  Future<void> _saveChanges() async {
    final updateState = ref.read(updateUserProviderProvider);

    if (updateState.isLoading) return;

    final name = _fullNameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: PoppinsText(context, "Full Name cannot be empty")),
      );
      return;
    }

    final parts = name.split(" ");
    final profileUrl = _profileImageUrl ?? user?.profileUrl ?? '';
    final phoneNumber = (user != null && user!.type == 'google')
        ? '+${selectedCountry.phoneCode}${_phoneNumberController.text.trim()}'
        : user?.phoneNumber ?? '';
    final dto = UpdateUserDTO(
      firstName: parts.first,
      lastName: parts.length > 1 ? parts.sublist(1).join(" ") : '',
      profileUrl: profileUrl,
      phoneNumber: phoneNumber,
    );

    final res = await ref
        .read(updateUserProviderProvider.notifier)
        .onSubmit(dto: dto);

    if (res != null && mounted) {
      await ref.read(localDataProvider).saveUser(res);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: PoppinsText(context, 'Profile updated successfully!'),
          backgroundColor: AppColors.white,
        ),
      );
      Navigator.pop(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppCustomColors>()!;
    final updateState = ref.watch(updateUserProviderProvider);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.screensbg.path, fit: BoxFit.cover),
          ),
          Column(
            children: [
              AppMainBar(
                leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    "assets/images/backicon.png",
                    width: 20,
                    height: 20,
                  ),
                ),
                title: "Edit Profile",
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: _pickImage,
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(),
                      child: ClipOval(
                        child: _isUploadingImage
                            ? Center(
                                child: LoadingWidget(
                                  color: AppColors.buttoncolor.first,
                                ),
                              )
                            : _profileImage != null
                            ? Image.file(
                                _profileImage!,
                                fit: BoxFit.cover,
                                width: 120,
                                height: 120,
                              )
                            : _profileImageUrl != null
                            ? Image.network(
                                _profileImageUrl!,
                                fit: BoxFit.cover,
                                width: 120,
                                height: 120,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.buttoncolor.first,
                                          value:
                                              loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[200],
                                    child: Icon(
                                      Icons.person,
                                      size: 60,
                                      color: Colors.grey[400],
                                    ),
                                  );
                                },
                              )
                            : Container(
                                color: Colors.grey[200],
                                child: Icon(
                                  Icons.person,
                                  size: 60,
                                  color: Colors.grey[400],
                                ),
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: -12,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: colors.buttonColors.first,
                        child: Icon(
                          Icons.camera_alt,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              PoppinsText(
                context,
                user != null
                    ? (user!.firstName != null &&
                              user!.firstName!.isNotEmpty &&
                              user!.lastName != null &&
                              user!.lastName!.isNotEmpty
                          ? "${user!.firstName!} ${user!.lastName!}"
                          : user!.fullName!)
                    : "Guest User",
                fontSize: PoppinsFontSizeVariant.size22,
                fontWeight: PoppinsFontWeightVariant.medium,
                color: colors.textColor,
              ),

              const SizedBox(height: 25),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      NewTextField(
                        controller: _fullNameController,
                        labelText: "Full Name*",
                        hintText: "Enter your full name",
                        fieldbg: AppColors.tfield,
                      ),
                      const SizedBox(height: 15),
                      NewTextField(
                        hintText: 'Enter your email',
                        controller: _emailController,
                        labelText: "Email*",
                        readOnly: true,
                        fieldbg: AppColors.tfield,
                      ),
                      const SizedBox(height: 15),
                      if (user != null && user!.type == null)
                        NewTextField(
                          hintText: 'Enter your phone number',
                          controller: _phoneNumberController,
                          labelText: "Phone Number*",
                          readOnly: true,
                          fieldbg: AppColors.tfield,
                        ),
                      if (user != null && user!.type == 'google')
                        PhoneOtpField(
                          otpController: otpController,
                          onSendCode: () {},
                          labelText: "Phone Number*",
                          fieldbg: AppColors.tfield,
                          phoneController: _phoneNumberController,
                          countryCode: selectedCountry,
                          onCountryChanged: (country) {
                            setState(() => selectedCountry = country);
                          },
                        ),
                      const SizedBox(height: 30),
                      AppButton(
                        isLoading: updateState.isLoading,
                        title: "Save Changes",
                        onPressed: _saveChanges,
                      ),
                      SizedBox(height: AppScaler.scaleHeight(context, 15)),
                      AppButton(
                        border: true,
                        borderWidth: 2,
                        borderColor: Colors.white,
                        buttonGradient: [
                          Colors.transparent,
                          Colors.transparent,
                        ],
                        title: "Discard Changes",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
