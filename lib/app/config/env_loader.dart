import 'package:flutter_dotenv/flutter_dotenv.dart';

// ignore: avoid_classes_with_only_static_members
class EnvLoader {
  static Future<void> load({String file = '.env'}) async {
    await dotenv.load(fileName: file);
  }

  static String get(String key, {String fallback = ''}) {
    return dotenv.get(key, fallback: fallback);
  }
}
