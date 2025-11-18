part of '../../../drappers.dart';

class CachedImageWidget extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final double? borderRadius;
  final BoxFit? fit;
  final BoxShape? shape;
  final bool? isProfile;
  final Color? iconColor;
  final Function()? onTap;

  const CachedImageWidget({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.borderRadius,
    this.fit,
    this.shape,
    this.isProfile,
    this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final placeholder =
        (isProfile == true)
            ? Assets.icons.userPlaceholder.image(
              width: width ?? 40,
              height: height ?? 40,
              fit: fit ?? BoxFit.cover,
              scale: 4,
            )
            : Assets.images.guestCourseCardImage.image(
              width: width ?? 40,
              height: height ?? 40,
              fit: fit ?? BoxFit.cover,
              scale: 4,
            );

    final borderRadiusValue =
        shape == BoxShape.circle
            ? BorderRadius.circular(100)
            : BorderRadius.circular(borderRadius ?? 0);

    if (url.isEmpty) {
      return ClipRRect(borderRadius: borderRadiusValue, child: placeholder);
    }

    return SizedBox(
      width: width ?? 40,
      height: height ?? 40,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: borderRadiusValue,
            child:
                kIsWeb
                    ? Image.network(
                      url,
                      width: width ?? 40,
                      height: height ?? 40,
                      fit: fit ?? BoxFit.cover,
                      webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                      color: iconColor,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return LoadingWidget();
                      },
                      errorBuilder: (context, error, stackTrace) => placeholder,
                    )
                    : CachedNetworkImage(
                      imageUrl: url,
                      width: width ?? 40,
                      height: height ?? 40,
                      fit: fit ?? BoxFit.cover,
                      color: iconColor,
                      imageBuilder:
                          (context, imageProvider) => Image(
                            image: imageProvider,
                            fit: fit ?? BoxFit.cover,
                            color: iconColor,
                          ),
                      placeholder: (context, url) => LoadingWidget(),
                      errorWidget: (context, url, error) => placeholder,
                    ),
          ),
          if (onTap != null)
            InkWell(
              onTap: () {
                if (onTap != null) {
                  onTap?.call();
                }
              },
              child: Container(
                width: width ?? 40,
                height: height ?? 40,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
