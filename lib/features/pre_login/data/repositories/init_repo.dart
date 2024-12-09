import 'package:chat/core/constant/app_constants.dart';
import 'package:chat/features/pre_login/data/model/init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// [InitRepository] a repository class for app Init
class InitRepository {

  /// [init] function to get the app Init
  Future<InitializeModel?> init() async {
    await dotenv.load();
    try {
      final response = await api.post(
        'init',
        'serverInit',
        data: {
          'appKey': dotenv.env['APP_KEY'],
          'appSecret': dotenv.env['APP_SECRET'],
        },
      );
      debugPrint(response.data.toString());
      if (response.statusCode == 200 && response.data != null) {
        debugPrint(response.data.toString());
        return InitializeModel.fromJson(response.data as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      debugPrint('Error getting configuration: $e');
      throw Exception('Failed to load configuration');
    }
  }
}
