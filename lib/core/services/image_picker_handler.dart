// ignore_for_file: use_build_context_synchronously

part of '../../drappers.dart';

class ImagePickerHandler {
  Future showPicker({
    required BuildContext context,
    required Function(XFile?) onGetImage,
  }) {
    return showModalBottomSheet(
      backgroundColor: Colors.white.withValues(alpha: 0),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,

                            onTap: () async {
                              // bool result = await requestStoragePermission(
                              //     isCamera: true);
                              //
                              // if (result) {
                              Navigator.of(context).pop();
                              imgFromCamera(context).then((value) {
                                if (value != null) onGetImage(value);
                              });
                              // } else {
                              //   _showPermissionDialog(
                              //     context,
                              //     isCamera: true,
                              //   );
                              // }
                            },
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: PoppinsText(
                                  'Take photo',
                                  fontSize: PoppinsFontSizeVariant.size12,
                                  fontWeight: PoppinsFontWeightVariant.regular,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),

                          const Divider(
                            color: Colors.grey,
                            height: 1,
                            thickness: 1,
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,

                            onTap: () async {
                              bool result = await requestStoragePermission(
                                isCamera: false,
                              );

                              if (result) {
                                Navigator.of(context).pop();
                                imgFromGallery(context).then((value) {
                                  if (value != null) onGetImage(value);
                                });
                              } else {
                                _showPermissionDialog(context, isCamera: false);
                              }
                            },
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: PoppinsText(
                                  'Gallery photo',
                                  fontSize: PoppinsFontSizeVariant.size12,
                                  fontWeight: PoppinsFontWeightVariant.regular,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,

                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: PoppinsText(
                          'Cancel',
                          fontSize: PoppinsFontSizeVariant.size12,
                          fontWeight: PoppinsFontWeightVariant.regular,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<XFile?> imgFromCamera(BuildContext context) async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image == null) {
      return null; // Handle null scenario
    }

    String? croppedFilePath = (await cropImage(image.path))?.path;

    if (croppedFilePath == null) {
      return null; // Handle null scenario
    }

    return _compressImage(croppedFilePath);
  }

  Future<XFile?> onOpenFrontCamera(BuildContext context) async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
    );

    if (image != null) {
      String? croppedFilePath = (await cropImage(image.path))?.path;

      if (croppedFilePath != null) {
        return _compressImage(croppedFilePath);
      }
    }

    return null;
  }

  static Future<Uint8List?> pickImageFromGalleryWeb(
    BuildContext context,
  ) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true, // so you get Uint8List
    );

    if (result != null && result.files.single.bytes != null) {
      return result.files.single.bytes;
    }
    return null;
  }

  Future<XFile?> imgFromGallery(BuildContext context) async {
    final picker = ImagePicker();

    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return null; // Handle null scenario
    }

    String? croppedFilePath = (await cropImage(image.path))?.path;

    if (croppedFilePath == null) {
      return null; // Handle null scenario
    }

    return _compressImage(croppedFilePath);
  }

  static Future<Uint8List?> getCroppedFilePathWeb({
    required BuildContext context,
    required File file,
  }) async {
    final croppedFile = await ImageCropper().cropImage(
      aspectRatio: CropAspectRatio(ratioX: 3, ratioY: 2),
      sourcePath: file.path,
      compressQuality: 100,
      uiSettings: [
        WebUiSettings(
          context: context,

          translations: WebTranslations(
            title: 'Upload Image',
            rotateLeftTooltip: 'Rotate Left',
            rotateRightTooltip: 'Rotate Right',
            cancelButton: 'Cancel',
            cropButton: 'Crop',
          ),
          // initialAspectRatio:1,
          cropBoxResizable: true,
          size: CropperSize(width: 500, height: 400),
          themeData: WebThemeData(),
        ),
      ],
    );
    return await croppedFile?.readAsBytes();
  }

  static Future<CroppedFile?> cropImage(String imagePath) async {
    return await ImageCropper().cropImage(
      sourcePath: imagePath,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Image cropper',
          toolbarColor: AppColors.darkText,
          toolbarWidgetColor: AppColors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
          hideBottomControls: true,
        ),
        IOSUiSettings(title: 'Image cropper', rotateButtonsHidden: true),
      ],
    );
  }

  Future<XFile?> _compressImage(String croppedFilePath) async {
    final dir = await getTemporaryDirectory();
    final targetPath = '${dir.absolute.path}/.jpg';

    final result = await FlutterImageCompress.compressAndGetFile(
      croppedFilePath,
      targetPath,
      minHeight: 1080,
      minWidth: 1080,
      quality: 50,
    );

    if (result == null) {
      return null; // Handle compression failure
    }

    return result;
  }

  Future<bool> requestStoragePermission({bool isCamera = false}) async {
    PermissionStatus status = isCamera
        ? await Permission.camera.request()
        : await Permission.photos.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      return false;
    }

    return true;
  }

  void _showPermissionDialog(BuildContext context, {required bool isCamera}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Permission required'),
        content: Text(
          'Please enable ${isCamera ? 'camera' : 'photo'} access in the app settings to use this feature.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
            child: Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  static Future<XFile?> vidFromCamera() async {
    final picker = ImagePicker();
    return await picker.pickVideo(source: ImageSource.camera);
  }

  static Future<XFile?> vidFromGallery() async {
    final picker = ImagePicker();
    return await picker.pickVideo(source: ImageSource.gallery);
  }

  static Future<PlatformFile?> fileFromGallery() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      return result.files.first;
    } else {
      return null; // User canceled the picker
    }
  }
}
