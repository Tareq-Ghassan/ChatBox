import 'dart:io';

String fixture({
  required AppFeature featureName,
  required String fileName,
  bool isError = false,
}) =>
    File('test/features/${featureName.name}/data/model/fixture/${isError ? 'error/' : ''}$fileName.json')
        .readAsStringSync();

enum AppFeature {
  preLogin,
}

extension AppFeatureExt on AppFeature {
  String get name {
    switch (this) {
      case AppFeature.preLogin:
        return 'pre_login';
    }
  }
}
