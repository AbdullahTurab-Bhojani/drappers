part of '../../drappers.dart';

extension Uint8ListImageExtensions on Uint8List {
  /// Checks if the image has the exact resolution (width x height).
  bool hasResolution(int targetWidth, int targetHeight) {
    final decoded = img.decodeImage(this);
    if (decoded == null) return false;
    final value =
        decoded.width == targetWidth && decoded.height == targetHeight;
    debugPrint("hasResolution $value");
    return value;
  }

  /// Checks if the image has the specified aspect ratio (e.g., 3/2 for 12:8).
  /// Optionally accepts a [tolerance] (default: 0.01) for float precision.
  bool hasAspectRatio(double targetRatio, {double tolerance = 0.01}) {
    final decoded = img.decodeImage(this);
    if (decoded == null) return false;

    final actualRatio = decoded.width / decoded.height;
    final value = (actualRatio - targetRatio).abs() < tolerance;
    debugPrint("hasAspectRatio $value");
    return value;
  }
}

extension IntExtension on int {
  String getFileSizeString() {
    int bytes = this;
    const suffixes = ["b", "kb", "mb", "gb", "tb"];
    if (bytes == 0) return '0${suffixes[0]}';
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(1)) + suffixes[i];
  }
}

extension NumberFormatter on num {
  String toShortString() {
    if (this >= 1000000) {
      return "${(this / 1000000).toStringAsFixed(this % 1000000 == 0 ? 0 : 1)}M";
    } else if (this >= 1000) {
      return "${(this / 1000).toStringAsFixed(this % 1000 == 0 ? 0 : 1)}k";
    } else {
      return toStringAsFixed(0);
    }
  }

  String get ordinal {
    if (this % 100 >= 11 && this % 100 <= 13) {
      return '${this}th';
    }
    switch (this % 10) {
      case 1:
        return '${this}st';
      case 2:
        return '${this}nd';
      case 3:
        return '${this}rd';
      default:
        return '${this}th';
    }
  }
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}


enum DeviceType { mobile, tab, web }

extension ContextExtension on BuildContext {
  DeviceType get deviceType {
    var width = MediaQuery.of(this).size.width;
    if (width <= 500) {
      return DeviceType.mobile;
    } else if (width > 500 && width <= 1270) {
      return DeviceType.tab;
    } else {
      return DeviceType.web;
    }
  }

  bool get isMobile => deviceType == DeviceType.mobile;

  bool get isTab => deviceType == DeviceType.tab;

  bool get isWeb => deviceType == DeviceType.web;
}
