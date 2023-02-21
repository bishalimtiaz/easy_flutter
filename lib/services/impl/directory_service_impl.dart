import 'dart:io';

import 'package:easy_flutter/services/interface/directory_service.dart';

class DirectoryServiceImpl implements DirectoryService {
  @override
  Future<void> createDirectory(String path) async {
    final dir = Directory(path);
    if (!await dir.exists()) {
      await dir.create(recursive: true).catchError((error) {
        throw 'Error creating directory at path: $path, error: $error';
      });
    }
  }

  @override
  Future<void> createDirectories(List<String> paths) async {
    final futures =
        paths.map((path) => createDirectory(path).catchError((error) {
              throw 'Error creating directory at path: $path, error: $error';
            }));
    await Future.wait(futures).catchError((error) {
      throw 'Error creating directories: $error';
    });
  }

  @override
  Future<void> removeDirectory(String path) async {
    final dir = Directory(path);
    if (await dir.exists()) {
      await dir.delete(recursive: true).catchError((error) {
        throw 'Error removing directory at path: $path, error: $error';
      });
    }
  }

  @override
  Future<void> removeDirectories(List<String> paths) async {
    final futures =
        paths.map((path) => removeDirectory(path).catchError((error) {
              throw 'Error removing directory at path: $path, error: $error';
            }));
    await Future.wait(futures).catchError((error) {
      throw 'Error removing directories: $error';
    });
  }

  @override
  Future<Directory> getDirectory(String path) async {
    final directory = Directory(path);
    if (directory.existsSync()) {
      return directory;
    } else {
      throw 'Directory not found at path: $path';
    }
  }
}
