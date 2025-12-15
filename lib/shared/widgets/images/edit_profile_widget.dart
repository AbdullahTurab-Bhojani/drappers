part of '../../../drappers.dart';

class EditProfileWidget extends StatefulWidget {
  final String imageUrl;
  final Function(File image)? onGetImage;
  final Function(Uint8List image)? onGetImageWeb;
  final double radius;
  final double iconRadius;
  const EditProfileWidget({
    super.key,
    required this.imageUrl,
    this.onGetImage,
    this.onGetImageWeb,
    this.radius = 55,
    this.iconRadius = 16,
  });

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  Uint8List? imageBytes;

  @override
  Widget build(BuildContext context) {
    bool isEmptyProfile = imageBytes == null && widget.imageUrl.isEmpty;

    return Center(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,

        onTap: () async {
          if (kIsWeb) {
            imageBytes = await ImagePickerHandler.pickImageFromGalleryWeb(
              context,
            );
            if (widget.onGetImageWeb != null && imageBytes != null) {
              widget.onGetImageWeb!(imageBytes!);
            }
          } else {
            ImagePickerHandler().showPicker(
              context: context,
              onGetImage: (p0) async {
                imageBytes = await p0?.readAsBytes();
                setState(() {});
                if (p0 != null) {
                  if (widget.onGetImage != null) {
                    widget.onGetImage!(File(p0.path));
                  }
                }
              },
            );
          }
        },
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: widget.radius * 2,
              width: widget.radius * 2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.fieldColor,
                border: Border.all(color: Colors.white, width: 4.7),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Center(
                  child: isEmptyProfile
                      ? Assets.icons.userPlaceholder.image(
                          width: widget.radius,
                          height: widget.radius,
                          fit: BoxFit.contain,
                          scale: 4,
                        )
                      : imageBytes != null
                      ? Image(
                          image: MemoryImage(imageBytes!),
                          fit: BoxFit.cover,
                          height: widget.radius * 2,
                          width: widget.radius * 2,
                        )
                      : CachedImageWidget(
                          url: widget.imageUrl,
                          fit: BoxFit.cover,
                          height: widget.radius * 2,
                          width: widget.radius * 2,
                          isProfile: true,
                        ),
                ),
              ),
            ),
            Positioned(
              bottom: context.isMobile ? 4 : 7,
              right: context.isMobile ? 4 : 7,
              child: CircleAvatar(
                radius: widget.iconRadius,
                backgroundColor: AppColors.primary,
                child: Assets.icons.edit.image(
                  width: widget.iconRadius + 2,
                  height: widget.iconRadius + 2,
                  fit: BoxFit.contain,
                  color: Colors.white,
                  scale: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
