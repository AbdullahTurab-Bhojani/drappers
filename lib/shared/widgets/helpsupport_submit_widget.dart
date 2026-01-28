// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/api_client/dio_custom_service.dart';
import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';
import 'dart:typed_data';
import '../../features/help&support/provider/helpandsupport_provider.dart';
import '../../features/setting&preferences/data/dto/support_dto.dart';
import '../../gen/assets.gen.dart';
import 'textfield_new.dart';

class HelpsupportSubmitWidget extends ConsumerStatefulWidget {
  const HelpsupportSubmitWidget({super.key});

  @override
  ConsumerState<HelpsupportSubmitWidget> createState() =>
      _HelpsupportSubmitWidgetState();
}

class _HelpsupportSubmitWidgetState
    extends ConsumerState<HelpsupportSubmitWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _describeController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<File> _screenshotImages = [];
  List<String> _uploadedImageUrls = [];
  bool _isUploading = false;

  Future<void> _handleImageSelection(ImageSource source) async {
    Navigator.pop(context);

    List<XFile> files = [];

    if (source == ImageSource.gallery) {
      final picked = await _picker.pickMultiImage(
        imageQuality: 80,
        maxWidth: 800,
        maxHeight: 800,
      );
      files = picked;
    } else {
      final XFile? file = await _picker.pickImage(
        source: source,
        imageQuality: 80,
        maxWidth: 800,
        maxHeight: 800,
      );
      if (file != null) files.add(file);
    }
    if (files.isEmpty) return;

    if (!mounted) return;
    setState(() => _isUploading = true);

    try {
      for (var file in files) {
        final bytes = await file.readAsBytes();
        final fileName =
            'screenshot_${DateTime.now().millisecondsSinceEpoch}.${file.path.split('.').last}';

        final uploadResult = await _uploadToS3(fileName, bytes);

        if (uploadResult != null && uploadResult.isNotEmpty) {
          setState(() {
            _screenshotImages.add(File(file.path));
            _uploadedImageUrls.add(uploadResult);
          });
        } else {
          throw Exception('Upload failed');
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to upload images'),
          backgroundColor: AppColors.redF81149,
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isUploading = false);
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    final state = ref.watch(helpAndSupportProviderProvider);

    ref.listen(helpAndSupportProviderProvider, (previous, next) {
      next.whenOrNull(
        success: (res) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(res.message)));
            Navigator.of(context).pop();
          });
        },
        error: (msg) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(msg!)));
          });
        },
      );
    });
    return Column(
      crossAxisAlignment: .start,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: AppScaler.scaleHeight(context, 20),
            left: AppScaler.scaleSize(context, 20),
          ),
          child: PoppinsText(
            context,
            "Submit a Ticket",
            fontSize: PoppinsFontSizeVariant.size22,
            fontWeight: PoppinsFontWeightVariant.medium,
            color: customColors.textColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: AppScaler.scaleSize(context, 20),
            right: AppScaler.scaleSize(context, 20),
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppScaler.scaleHeight(context, 10)),
                NewTextField(
                  fieldbg: AppColors.submitfield181818,
                  controller: _fullNameController,
                  labelText: "Full Name*",
                  hintText: "Enter your full name",
                  filledColor: customColors.bgcontainerlight,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Full Name required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppScaler.scaleHeight(context, 15)),
                NewTextField(
                  fieldbg: AppColors.submitfield181818,
                  controller: _emailController,
                  labelText: "Enter your Email Address or Phone*",
                  hintText: "Enter your email",
                  filledColor: customColors.bgcontainerlight,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Email or Phone required";
                    }
                    final emailRegex = RegExp(
                      r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                    );
                    final phoneRegex = RegExp(r"^\+?\d{10,15}$");

                    if (!emailRegex.hasMatch(value) &&
                        !phoneRegex.hasMatch(value)) {
                      return "Enter a valid email or phone number";
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppScaler.scaleHeight(context, 15)),
                NewTextField(
                  fieldbg: AppColors.submitfield181818,
                  controller: _subjectController,
                  labelText: "Subject*",
                  hintText: "Subject here",
                  filledColor: customColors.bgcontainerlight,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Subject required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppScaler.scaleHeight(context, 15)),
                IssueDescriptionField(
                  describeController: _describeController,
                  maxLength: 500,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Description required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppScaler.scaleHeight(context, 10)),
                PoppinsText(
                  context,
                  "Upload Screenshot (Optional)",
                  fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.regular,
                  color: customColors.textColor,
                ),
                SizedBox(height: AppScaler.scaleHeight(context, 15)),
                _screenshotImages.isNotEmpty
                    ? SizedBox()
                    : GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          width: double.infinity,
                          height: AppScaler.scaleHeight(context, 55),
                          padding: EdgeInsets.symmetric(
                            horizontal: AppScaler.scaleSize(context, 12),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.submitfield181818,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                Assets.images.screenshoticon.path,
                                height: AppScaler.scaleHeight(context, 24),
                                width: AppScaler.scaleSize(context, 24),
                              ),
                              SizedBox(width: AppScaler.scaleSize(context, 24)),
                              PoppinsText(
                                context,
                                "Add Screenshot",
                                fontSize: PoppinsFontSizeVariant.size16,
                                fontWeight: PoppinsFontWeightVariant.regular,
                                color: customColors.textColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                SizedBox(height: AppScaler.scaleHeight(context, 15)),
                if (_isUploading)
                  Column(
                    children: [
                      LoadingWidget(color: AppColors.buttoncolor.first),
                    ],
                  )
                else if (_screenshotImages.isNotEmpty)
                  SizedBox(
                    height: AppScaler.scaleHeight(context, 80),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _screenshotImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  _screenshotImages[index],
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              if (!_isUploading)
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _screenshotImages.removeAt(index);

                                        if (index < _uploadedImageUrls.length) {
                                          _uploadedImageUrls.removeAt(index);
                                        }
                                      });
                                    },
                                    child: const CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.red,
                                      child: Icon(
                                        Icons.close,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                SizedBox(height: AppScaler.scaleHeight(context, 30)),
                AppButton(
                  isLoading: state.isLoading,
                  buttonSize: Size(
                    double.infinity,
                    AppScaler.scaleHeight(context, 40),
                  ),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final dto = SupportRequestDto(
                        fullName: _fullNameController.text.trim(),
                        subject: _subjectController.text.trim(),
                        email: _emailController.text.trim(),
                        message: _describeController.text.trim(),
                        imageUrl: _uploadedImageUrls.isNotEmpty
                            ? _uploadedImageUrls[0]
                            : "",
                      );

                      try {
                        await ref
                            .read(helpAndSupportProviderProvider.notifier)
                            .onSubmit(dto: dto);
                      } catch (_) {}
                    }
                  },
                  title: "Submit Ticket",
                ),
                SizedBox(height: AppScaler.scaleHeight(context, 20)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class IssueDescriptionField extends StatefulWidget {
  final TextEditingController describeController;
  final int maxLength;
  final String? Function(String?)? validator;

  const IssueDescriptionField({
    super.key,
    required this.describeController,
    this.maxLength = 500,
    this.validator,
  });

  @override
  State<IssueDescriptionField> createState() => _IssueDescriptionFieldState();
}

class _IssueDescriptionFieldState extends State<IssueDescriptionField> {
  int _currentLength = 0;

  @override
  void initState() {
    super.initState();
    _currentLength = widget.describeController.text.length;
    widget.describeController.addListener(() {
      setState(() {
        _currentLength = widget.describeController.text.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NewTextField(
          fieldbg: AppColors.submitfield181818,
          maxLines: 3,
          controller: widget.describeController,
          labelText: "Describe your issue*",
          hintText: "Describe your issue in detail...",
          filledColor: customColors.bgcontainerlight,
          maxLength: widget.maxLength,
          validator: widget.validator,
        ),
        SizedBox(height: AppScaler.scaleHeight(context, 10)),
        PoppinsText(
          context,
          "$_currentLength/${widget.maxLength} Characters",
          fontSize: PoppinsFontSizeVariant.size12,
          fontWeight: PoppinsFontWeightVariant.regular,
          color: customColors.greyColor,
        ),
      ],
    );
  }
}
