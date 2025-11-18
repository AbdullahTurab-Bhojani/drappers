part of '../../../drappers.dart';

enum SvgImageType { asset, network }

class SvgImages extends StatelessWidget {
  final String image;
  final SvgImageType type;

  const SvgImages({
    super.key,
    required this.image,
    this.type = SvgImageType.asset,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case SvgImageType.asset:
        {
          return SvgPicture.asset(image, package: 'panorama_design_system');
        }
      case SvgImageType.network:
        {
          return SvgPicture.network(image);
        }
    }
  }
}
