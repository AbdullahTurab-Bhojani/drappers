// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../drappers.dart';
import '../providers/upload_provider.dart';

class UploadImageScreen extends ConsumerWidget {
  UploadImageScreen({super.key});

  final ImagePicker _picker = ImagePicker();

  Future<void> pickAndUpload(
    BuildContext context,
    WidgetRef ref,
    ImageSource source,
  ) async {
    final XFile? picked = await _picker.pickImage(
      source: source,
      imageQuality: 80,
    );
    if (picked != null) {
      File file = File(picked.path);
      await ref.read(s3UploadRepositoryProvider).uploadToS3(file.path, file);
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(s3UploadRepositoryProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            bool result = await requestStoragePermission(isCamera: false);

            if (result) {
              pickAndUpload(context, ref, ImageSource.gallery);
            } else {
              _showPermissionDialog(context, isCamera: true);
            }
          },

          child: Container(
            height: 55,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.buttoncolor.first,

              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.photo_library, color: Colors.white),
                const SizedBox(width: 10),
                PoppinsText(
                  context,
                  "Pick from Gallery",
                  fontSize: PoppinsFontSizeVariant.size14,
                  fontWeight: PoppinsFontWeightVariant.regular,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            bool result = await requestStoragePermission(isCamera: true);

            if (result) {
              pickAndUpload(context, ref, ImageSource.camera);
            } else {
              _showPermissionDialog(context, isCamera: true);
            }
          },

          child: Container(
            height: 55,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.buttoncolor.first,
              border: Border.all(color: AppColors.buttoncolor.first),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.camera_alt, color: Colors.white),
                const SizedBox(width: 10),

                PoppinsText(
                  context,
                  "Pick from Camera",
                  fontSize: PoppinsFontSizeVariant.size14,
                  fontWeight: PoppinsFontWeightVariant.regular,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Future<bool> requestStoragePermission({bool isCamera = false}) async {
  PermissionStatus status = isCamera
      ? await Permission.camera.request()
      : await Permission.photos.request();
  if (status.isDenied || status.isPermanentlyDenied) {
    openAppSettings();
  }

  return true;
}

void _showPermissionDialog(BuildContext context, {required bool isCamera}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: PoppinsText(context, 'Permission required'),
      content: PoppinsText(
        context,
        'Please enable ${isCamera ? 'camera' : 'photo'} access in the app settings to use this feature.',
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: PoppinsText(context, 'Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            openAppSettings();
          },
          child: PoppinsText(context, 'Open Settings'),
        ),
      ],
    ),
  );
}
