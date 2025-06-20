import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvLoader {
  static Future<void> load({String file = '.env'}) async {
    await dotenv.load(fileName: file);
  }

  static String get(String key, {String fallback = ''}) {
    return dotenv.get(key, fallback: fallback);
  }
}
