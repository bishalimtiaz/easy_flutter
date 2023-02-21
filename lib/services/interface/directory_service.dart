import 'dart:io';

abstract class DirectoryService {
  Future<void> createDirectory(String path);

  Future<void> createDirectories(List<String> paths);

  Future<void> removeDirectory(String path);

  Future<void> removeDirectories(List<String> paths);

  Future<Directory> getDirectory(String path);
}
