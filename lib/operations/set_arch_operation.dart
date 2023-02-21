import 'package:easy_flutter/operations/operation.dart';
import 'package:easy_flutter/services/interface/directory_service.dart';
import 'package:easy_flutter/services/interface/file_service.dart';

///
/// This Architecture Follows Clean Architecture and MVVM
///
// lib/
// ├─ app/
// │  ├─ core/
// │  ├─ data/
// │  │  ├─ datasource/
// │  │  ├─ model/
// │  │  ├─ repository_impl/
// │  ├─ domain/
// │  │  ├─ entity/
// │  │  ├─ repository/
// │  │  ├─ use_case/
// │  ├─ presentation/
// │  ├─ app.dart
// ├─ main.dart
///

class SetArchOperation implements Operation {
  final List<String> _directoryPaths = [
    'lib/app/',
    'lib/app/core/',
    'lib/app/data/',
    'lib/app/data/datasource/',
    'lib/app/data/model/',
    'lib/app/data/repository_impl/',
    'lib/app/domain/',
    'lib/app/domain/entity/',
    'lib/app/domain/repository/',
    'lib/app/domain/use_case/',
    'lib/app/presentation/',
  ];

  final List<String> _filePaths = [
    'lib/app/app.dart',
  ];

  final FileService _fileService;
  final DirectoryService _directoryService;

  SetArchOperation({
    required FileService fileService,
    required DirectoryService directoryService,
  })  : _fileService = fileService,
        _directoryService = directoryService;

  @override
  Future<void> execute() async {
    try {
      await _createDirectories();
      await _createFiles();
    } catch (e) {
      print('Error creating directory structure: $e');
      rethrow;
    }
  }

  Future<void> _createDirectories() async {
    final futures = _directoryPaths.map(
        (path) => _directoryService.createDirectory(path).catchError((error) {
              throw 'Error creating directory at path: $path, error: $error';
            }));
    await Future.wait(futures).catchError((error) {
      throw 'Error creating directories: $error';
    });
  }

  Future<void> _createFiles() async {
    final futures = _filePaths.map((path) => _fileService
        .createFile(path)
        .catchError((error) =>
            throw 'Error creating file at path: $path, error: $error'));

    await Future.wait(futures).catchError((error) {
      throw 'Error creating files: $error';
    });
  }
}
