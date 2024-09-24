import 'dart:io';

import 'package:fp_util/fp_util.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StorageService {
  final supabase = Supabase.instance.client;

  /// Upload a file to Supabase Storage
  Future<void> uploadFile(File file, String bucketName, String path) async {
    try {
      await supabase.storage.from(bucketName).upload(path, file);

      Logger.s('File uploaded successfully!');
    } catch (error, stackTrace) {
      Logger.e(
        'Upload failed: ${error.toString()}',
        error: error,
        stackTrace: stackTrace,
      );
      throw Exception('Upload failed: ${error.toString()}');
    }
  }

  /// Get public URL for file (so anyone can view it)
  String getPublicUrl(String bucketName, String path) {
    final url = supabase.storage.from(bucketName).getPublicUrl(path);
    return url;
  }

  /// Delete a file
  Future<void> deleteFile(String bucketName, String path) async {
    try {
      await supabase.storage.from(bucketName).remove([path]);

      Logger.s('File deleted successfully!');
    } catch (error, stackTrace) {
      Logger.e(
        'File deletion failed: ${error.toString()}',
        error: error,
        stackTrace: stackTrace,
      );
      throw Exception('File deletion failed: ${error.toString()}');
    }
  }
}
