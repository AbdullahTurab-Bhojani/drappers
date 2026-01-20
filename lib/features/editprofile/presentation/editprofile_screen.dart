import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/local/domain/repositories/local_storage_repository.dart';
import '../../../core/theme/app_scalar.dart';
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
  final _countryCodeController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  File? _profileImage;
  String? _profileImageUrl;
  UserData? user;

  bool _isUploadingImage = false;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final fetchedUser = await ref.read(localDataProvider).getUser();
    if (fetchedUser != null) {
      user = fetchedUser;

      _fullNameController.text =
          (fetchedUser.firstName?.isNotEmpty == true &&
              fetchedUser.lastName?.isNotEmpty == true)
          ? "${fetchedUser.firstName} ${fetchedUser.lastName}"
          : fetchedUser.fullName ?? '';

      _emailController.text = fetchedUser.email ?? '';

      _profileImageUrl = fetchedUser.profileUrl?.isNotEmpty == true
          ? fetchedUser.profileUrl
          : 'https://i.pinimg.com/736x/15/0f/a8/150fa8800b0a0d5633abc1d1c4db3d87.jpg';

      if (fetchedUser.phoneNumber?.contains(" ") == true) {
        final parts = fetchedUser.phoneNumber!.split(" ");
        _countryCodeController.text = parts.first;
        _phoneNumberController.text = parts.sublist(1).join();
      } else {
        _countryCodeController.text = "+92";
        _phoneNumberController.text = fetchedUser.phoneNumber ?? '';
      }
    }
    setState(() {});
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _countryCodeController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
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
              onTap: () async {
                Navigator.pop(context);
                final XFile? file = await _picker.pickImage(
                  source: ImageSource.gallery,
                );
                if (file != null) {
                  _uploadImage(File(file.path));
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Camera"),
              onTap: () async {
                Navigator.pop(context);
                final XFile? file = await _picker.pickImage(
                  source: ImageSource.camera,
                );
                if (file != null) {
                  _uploadImage(File(file.path));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _uploadImage(File file) async {
    try {
      setState(() => _isUploadingImage = true);

      final userId = user?.id ?? "guest";
      final ref = FirebaseStorage.instance
          .ref()
          .child("profile_images")
          .child("$userId-${DateTime.now().millisecondsSinceEpoch}.jpg");

      final snapshot = await ref.putFile(file);
      final url = await snapshot.ref.getDownloadURL();

      setState(() {
        _profileImage = file;
        _profileImageUrl = url;
        _isUploadingImage = false;
      });
    } catch (e) {
      setState(() => _isUploadingImage = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<AppCustomColors>()!;
    final updateState = ref.watch(updateUserProviderProvider);

    return Scaffold(
      body: Stack(
        children: [
          /// BACKGROUND
          Positioned.fill(
            child: Image.asset(Assets.images.screensbg.path, fit: BoxFit.cover),
          ),

          /// MAIN UI
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

              const SizedBox(height: 40),
              GestureDetector(
                onTap: _pickImage,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : NetworkImage(_profileImageUrl!) as ImageProvider,
                      child: _isUploadingImage
                          ? const CircularProgressIndicator(color: Colors.white)
                          : null,
                    ),
                    Positioned(
                      bottom: -15,
                      right: 0,
                      left: 0,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: customColors.buttonColors.first,
                        child: Image.asset(
                          Assets.images.editprofilecameraicon.path,
                          width: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      NewTextField(
                        controller: _fullNameController,
                        labelText: "Full Name*",
                        fieldbg: AppColors.tfield,
                        hintText: "Enter your Full Name",
                      ),

                      const SizedBox(height: 15),
                      NewTextField(
                        hintText: "Enter your email",
                        controller: _emailController,
                        labelText: "Email",
                        readOnly: true,
                        fieldbg: AppColors.tfield,
                      ),
                      const SizedBox(height: 15),
                      NewTextField(
                        controller: _phoneNumberController,
                        labelText: "Phone Number",
                        readOnly: true,
                        hintText: "Enter your phone number",

                        fieldbg: AppColors.tfield,
                      ),
                      const SizedBox(height: 25),
                      AppButton(
                        onPressed: () async {
                          if (!updateState.isLoading) {
                            final name = _fullNameController.text.trim();
                            if (name.isEmpty) return;

                            final parts = name.split(" ");
                            final dto = UpdateUserDTO(
                              firstName: parts.first,
                              lastName: parts.length > 1
                                  ? parts.sublist(1).join(" ")
                                  : '',
                              profileUrl: _profileImageUrl!,
                            );

                            final res = await ref
                                .read(updateUserProviderProvider.notifier)
                                .onSubmit(dto: dto);

                            if (res != null && mounted) {
                              Navigator.pop(context, res);
                            }
                          }
                        },
                        title: "Save Changes",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          if (updateState.isLoading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: Center(
                child: LoadingWidget(
                  width: 60,
                  height: 60,
                  color: AppColors.buttoncolor[0],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
