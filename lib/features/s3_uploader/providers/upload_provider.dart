import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../domain/models/media_model.dart';
import '../domain/repository/upload_repository.dart';

// Dio Provider
final dioProvider = Provider<Dio>((ref) {
  return Dio()
    ..options.connectTimeout = const Duration(seconds: 30)
    ..options.receiveTimeout = const Duration(seconds: 30)
    ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
});

// Repository Provider
final s3UploadRepositoryProvider = Provider<S3UploadRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return S3UploadRepository(dio);
});

// State for tracking upload process
class UploadState {
  final File? selectedFile;
  final bool isUploading;
  final S3UploadResponse? response;
  final String? error;
  final double uploadProgress;

  UploadState({
    this.selectedFile,
    this.isUploading = false,
    this.response,
    this.error,
    this.uploadProgress = 0.0,
  });

  UploadState copyWith({
    File? selectedFile,
    bool? isUploading,
    S3UploadResponse? response,
    String? error,
    double? uploadProgress,
  }) {
    return UploadState(
      selectedFile: selectedFile ?? this.selectedFile,
      isUploading: isUploading ?? this.isUploading,
      response: response ?? this.response,
      error: error ?? this.error,
      uploadProgress: uploadProgress ?? this.uploadProgress,
    );
  }
}

// State Notifier for managing upload state
class UploadNotifier extends StateNotifier<UploadState> {
  final Ref ref;
  final S3UploadRepository _repository;

  UploadNotifier(this.ref)
    : _repository = ref.read(s3UploadRepositoryProvider),
      super(UploadState());

  // Select file
  void selectFile(File file) {
    state = state.copyWith(selectedFile: file, error: null);
  }

  // Clear selected file
  void clearFile() {
    state = state.copyWith(selectedFile: null, error: null);
  }

  // Upload file to S3
  Future<void> uploadFile() async {
    if (state.selectedFile == null) {
      state = state.copyWith(error: 'Please select a file first');
      return;
    }

    try {
      // Start uploading
      state = state.copyWith(
        isUploading: true,
        error: null,
        uploadProgress: 0.0,
      );

      // Step 1: Get signed URL
      final fileName = state.selectedFile!.path.split('/').last;
      final signedUrlResponse = await _repository.getSignedUrl(fileName);

      if (!signedUrlResponse.isSuccess) {
        throw Exception(signedUrlResponse.message);
      }

      // Step 2: Upload to S3
      await _repository.uploadToS3(
        signedUrlResponse.data.uploadUrl,
        state.selectedFile!,
      );

      // Update progress
      state = state.copyWith(uploadProgress: 1.0);

      // Update state with response
      state = state.copyWith(response: signedUrlResponse, isUploading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isUploading: false);
    }
  }

  // Send fileUrl to update API
  Future<void> sendToUpdateApi({Map<String, dynamic>? additionalData}) async {
    if (state.response == null) {
      state = state.copyWith(error: 'No uploaded file found');
      return;
    }

    try {
      state = state.copyWith(isUploading: true, error: null);

      await _repository.sendToUpdateApi(
        state.response!.data.fileUrl,
        additionalData: additionalData,
      );

      state = state.copyWith(isUploading: false);
    } catch (e) {
      state = state.copyWith(error: 'Failed to update: $e', isUploading: false);
    }
  }

  // Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }

  // Reset state
  void reset() {
    state = UploadState();
  }
}

// Upload State Provider
final uploadProvider = StateNotifierProvider<UploadNotifier, UploadState>(
  (ref) => UploadNotifier(ref),
);
