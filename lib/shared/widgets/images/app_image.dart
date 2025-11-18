part of '../../../drappers.dart';

class UtilsImages extends StatelessWidget {
  final String image;

  const UtilsImages({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    if (image.contains("http")) {
      return Image.network(image);
    } else {
      return Image.asset(image);
    }
  }
}
