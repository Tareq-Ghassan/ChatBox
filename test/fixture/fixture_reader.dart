import 'dart:io';

String fixture({required String featureName, required String fileName}) =>
    File('test/fixture/$featureName/$fileName.json').readAsStringSync();
