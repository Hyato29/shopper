import 'dart:convert';

import 'package:fskeleton/app/data/my_search_preferences/saved_search.dart';
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

  final _lastSearchDataKey = 'lsd';

  Future<void> saveLastSearchData(SavedSearch model) async {
    final sharedPref = await SharedPreferences.getInstance();
    final data = sharedPref.getString(_lastSearchDataKey);
    if (data == null) {
      final List<Map<String, dynamic>> searches = [model.toJson()];
      await sharedPref.setString(_lastSearchDataKey, json.encode(searches));
    } else {
      final currentSearches = await getLastSearchData();
      final newSearches = [...currentSearches, model];
      await sharedPref.setString(_lastSearchDataKey, json.encode(newSearches));
    }
  }

  Future<List<SavedSearch>> getLastSearchData() async {
    final sharedPref = await SharedPreferences.getInstance();
    final data = sharedPref.getString(_lastSearchDataKey);
    if (data == null) {
      return [];
    }
    final List<dynamic> searches = jsonDecode(data) as List<dynamic>;
    final eek = searches
        .map((e) => SavedSearch.fromJson(e as Map<String, dynamic>))
        .toList();

    return eek;
  }

  Future<void> deleteAllData() async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.clear();
  }
}
