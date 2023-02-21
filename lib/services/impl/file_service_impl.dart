import 'dart:io';

import 'package:easy_flutter/services/interface/file_service.dart';

class FileServiceImpl implements FileService {
  @override
  Future<void> createFile(String path) async {
    final file = File(path);
    if (!file.existsSync()) {
      await file.create(recursive: true).catchError((error) {
        throw 'Error creating file at path: $path, error: $error';
      });
    }
  }

  @override
  Future<void> writeContent(String path, String content) async {
    final file = File(path);
    if (file.existsSync()) {
      await file.writeAsString(content).catchError((error) {
        throw 'Error writing content to file at path: $path, error: $error';
      });
    } else {
      throw 'File not found at path: $path';
    }
  }

  @override
  Future<void> createFiles(List<String> paths) async {
    final futures = paths.map((path) => createFile(path).catchError((error) {
          throw 'Error creating file at path: $path, error: $error';
        }));
    await Future.wait(futures).catchError((error) {
      throw 'Error creating files: $error';
    });
  }

  @override
  Future<void> removeFile(String path) async {
    final file = File(path);
    if (file.existsSync()) {
      await file.delete().catchError((error) {
        throw 'Error removing file at path: $path, error: $error';
      });
    } else {
      throw 'File not found at path: $path';
    }
  }

  @override
  Future<void> removeFiles(List<String> paths) async {
    final futures = paths.map((path) => removeFile(path).catchError((error) {
          throw 'Error removing file at path: $path, error: $error';
        }));
    await Future.wait(futures).catchError((error) {
      throw 'Error removing files: $error';
    });
  }

  @override
  Future<File> getFile(String path) async {
    final file = File(path);
    if (file.existsSync()) {
      return file;
    } else {
      throw 'File not found at path: $path';
    }
  }
}
