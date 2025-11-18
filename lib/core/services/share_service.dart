import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
part 'share_service.g.dart';

@riverpod
class ShareService extends _$ShareService {
  @override
  SharePlus build() => SharePlus.instance;

  void onShare(String url) {
    state.share(ShareParams(text: 'Check out the course $url'));
  }

  void onLaunchUrl(String url) async {
    debugPrint("onLaunchUrl $url");
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        debugPrint("Cannot launch URL: $url");
        throw "Could not launch $url";
      }
    } catch (e) {
      debugPrint("Error launching URL $url: $e");
      throw "Could not launch $url: $e";
    }
  }
}
