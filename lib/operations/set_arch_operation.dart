import 'package:easy_flutter/operations/operation.dart';
import 'package:easy_flutter/services/interface/directory_service.dart';
import 'package:easy_flutter/services/interface/file_service.dart';
import 'package:easy_flutter/template/template_main.dart';
import 'package:easy_flutter/template/template_my_app.dart';

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
  final List<String> _directoryPaths = <String>[
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

  final List<String> _filePaths = <String>[
    'lib/app/app.dart',
    'lib/main.dart',
  ];

  final Map<String, String> _contents = <String, String>{
    'lib/main.dart': TemplateMain().format,
    'lib/app/app.dart': TemplateMyApp().format,
  };

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
      await _writeContents();
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

  Future<void> _writeContents() async {
    try {
      await _fileService.writeContentsToMultipleFile(_contents);
    } catch (e) {
      print('Error writing contents to files: $e');
      rethrow;
    }
  }
}
