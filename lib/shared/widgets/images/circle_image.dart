part of '../../../drappers.dart';

class CircleImageWidget extends StatelessWidget {
  final String url;
  final double radius;
  final BoxFit? fit;

  const CircleImageWidget({
    super.key,
    this.radius = 10,
    required this.url,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),

      child: CachedNetworkImage(
        imageUrl: url,
        width: radius * 2,
        height: radius * 2,
        fit: fit ?? BoxFit.contain,
        imageBuilder:
            (context, imageProvider) =>
                Image(image: imageProvider, fit: fit ?? BoxFit.contain),
        progressIndicatorBuilder: (context, url, progress) => LoadingWidget(),
        errorWidget:
            (context, url, error) => Assets.icons.userPlaceholder.image(
              scale: 4,
              width: radius * 2,
              height: radius * 2,
              fit: fit ?? BoxFit.contain,
            ),
      ),
    );
  }
}

class CircleFileImageWidget extends StatelessWidget {
  final Uint8List? image;
  final double radius;
  final BoxFit? fit;

  const CircleFileImageWidget({
    super.key,
    this.radius = 10,
    this.image,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),

      child: CircleAvatar(
        radius: radius,
        child:
            image != null
                ? Image(image: MemoryImage(image!), fit: BoxFit.cover)
                : Assets.icons.userPlaceholder.image(
                  scale: 4,
                  width: radius * 2,
                  height: radius * 2,
                  fit: fit ?? BoxFit.contain,
                ),
      ),
    );
  }
}
