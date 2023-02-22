import 'dart:io';

abstract class FileService {
  Future<void> createFile(String path);

  Future<void> writeContent(String path, String content);

  Future<void> writeContentsToMultipleFile(Map<String, String> contentsByPath);

  Future<void> createFiles(List<String> paths);

  Future<void> removeFile(String path);

  Future<void> removeFiles(List<String> paths);

  Future<File> getFile(String path);
}
