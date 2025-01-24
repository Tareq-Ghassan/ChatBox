import 'dart:io';

String fixture({
  required AppFeature featureName,
  required String fileName,
  bool isError = false,
}) {
  final path =
      'test/${featureName == AppFeature.core ? '' : 'features/'}${featureName.name}/data/model/fixture/${isError ? 'error/' : ''}$fileName.json';
  return File(path).readAsStringSync();
}

enum AppFeature {
  preLogin,
  core,
  authentication,
}

extension AppFeatureExt on AppFeature {
  String get name {
    switch (this) {
      case AppFeature.preLogin:
        return 'pre_login';
      case AppFeature.core:
        return 'core';
      case AppFeature.authentication:
        return 'authentication';
    }
  }
}
