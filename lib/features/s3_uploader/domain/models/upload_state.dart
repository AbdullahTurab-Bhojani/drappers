class UploadState {
  final bool isUploading;
  final bool isSuccess;
  final bool isError;
  final String? mediaUrl;
  final String? errorMessage;

  const UploadState({
    this.isUploading = false,
    this.isSuccess = false,
    this.isError = false,
    this.mediaUrl,
    this.errorMessage,
  });

  UploadState copyWith({
    bool? isUploading,
    bool? isSuccess,
    bool? isError,
    String? mediaUrl,
    String? errorMessage,
  }) {
    return UploadState(
      isUploading: isUploading ?? this.isUploading,
      isSuccess: isSuccess ?? this.isSuccess,
      isError: isError ?? this.isError,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
