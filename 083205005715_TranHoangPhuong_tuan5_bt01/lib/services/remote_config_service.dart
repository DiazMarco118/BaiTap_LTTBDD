import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  // Initialize Remote Config
  Future<void> initialize() async {
    try {
      // Set config settings
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval:
              Duration.zero, // No cache - fetch immediately (for testing)
        ),
      );

      // Set default values
      await _remoteConfig.setDefaults({
        'welcome_message': 'Welcome to our app!',
        'app_theme_color': '#0066FF',
        'show_premium_feature': false,
        'support_email': 'support@example.com',
        'maintenance_mode': false,
        'max_file_upload': 10,
        'banner_text': '',
      });

      // Fetch and activate
      await _remoteConfig.fetchAndActivate();

      if (kDebugMode) {
        print('Remote Config initialized successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error initializing Remote Config: $e');
      }
    }
  }

  // Get string value
  String getString(String key) {
    return _remoteConfig.getString(key);
  }

  // Get bool value
  bool getBool(String key) {
    return _remoteConfig.getBool(key);
  }

  // Get int value
  int getInt(String key) {
    return _remoteConfig.getInt(key);
  }

  // Get double value
  double getDouble(String key) {
    return _remoteConfig.getDouble(key);
  }

  // Manually fetch latest config
  Future<void> fetchConfig() async {
    try {
      await _remoteConfig.fetchAndActivate();
      if (kDebugMode) {
        print('Remote Config fetched successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching Remote Config: $e');
      }
    }
  }

  // Get all config values (for debugging)
  Map<String, dynamic> getAllValues() {
    return {
      'welcome_message': getString('welcome_message'),
      'app_theme_color': getString('app_theme_color'),
      'show_premium_feature': getBool('show_premium_feature'),
      'support_email': getString('support_email'),
      'maintenance_mode': getBool('maintenance_mode'),
      'max_file_upload': getInt('max_file_upload'),
      'banner_text': getString('banner_text'),
    };
  }
}
