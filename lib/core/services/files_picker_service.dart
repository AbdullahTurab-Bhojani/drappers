part of '../../drappers.dart';

typedef PFile = PlatformFile;
typedef PFiles = List<PlatformFile>;

@immutable
class FilePickerService {
  const FilePickerService._();
  static const docTypes = <String>['pdf', 'docx', 'doc', 'txt', 'pptx', 'ppt'];
  static Future<List<PFile>?> pickerFiles({
    List<String> allowedExtensions = docTypes,
    bool allowMultiple = true,
  }) async {
    final result = await FilePicker.platform.pickFiles(
      allowedExtensions: allowedExtensions,
      type: FileType.custom,
      allowMultiple: allowMultiple,
    );
    return result?.files;
  }

 static Future<File> uint8ListToFIle(Uint8List imageInUnit8List) async {
    final tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/image.png').create();
    file.writeAsBytesSync(imageInUnit8List);
    return file;
  }

}
