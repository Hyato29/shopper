import 'package:fskeleton/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DuplicateSavedSearchException extends Error {}

class MySharedPreferences {
  MySharedPreferences();

  static final provider = Provider<MySharedPreferences>(
    (ref) {
      return MySharedPreferences();
    },
  );

  Future<void> deleteAllData() async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.clear();
  }
}
