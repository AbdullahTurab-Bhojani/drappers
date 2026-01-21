class S3UploadResponse {
  final bool isSuccess;
  final S3UploadData data;
  final String message;

  S3UploadResponse({
    required this.isSuccess,
    required this.data,
    required this.message,
  });

  factory S3UploadResponse.fromJson(Map<String, dynamic> json) {
    return S3UploadResponse(
      isSuccess: json['isSuccess'] ?? false,
      data: S3UploadData.fromJson(json['data']),
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'isSuccess': isSuccess,
    'data': data.toJson(),
    'message': message,
  };
}

class S3UploadData {
  final String fileUrl;
  final String uploadUrl;

  S3UploadData({required this.fileUrl, required this.uploadUrl});

  factory S3UploadData.fromJson(Map<String, dynamic> json) {
    return S3UploadData(
      fileUrl: json['fileUrl'] ?? '',
      uploadUrl: json['uploadUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {'fileUrl': fileUrl, 'uploadUrl': uploadUrl};
}
