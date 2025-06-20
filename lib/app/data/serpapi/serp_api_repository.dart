import 'dart:async';

import 'package:fskeleton/app/config/env_loader.dart';
import 'package:fskeleton/app/data/my_search_preferences/my_shared_preferences.dart';
import 'package:fskeleton/app/data/my_search_preferences/saved_search.dart';
import 'package:fskeleton/app/data/serpapi/model/shopping_response.dart';
import 'package:fskeleton/core.dart';

class SerpApiRepository {
  SerpApiRepository(this._httpClient, this._sharedPreferences);

  static final provider = Provider((ref) {
    return SerpApiRepository(
      ref.watch(HttpClient.serpApiProvider),
      ref.watch(MySharedPreferences.provider),
    );
  });

  final HttpClient _httpClient;

  final MySharedPreferences _sharedPreferences;

  Future<ShoppingResponse> searchSerpDogGoogleShopping({
    required String keyword,
    int start = 0,
  }) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        path: '/shopping',
        queryParameters: {
          'q': keyword,
          'gl': 'id',
          'api_key': EnvLoader.get('SERP_API_KEY'),
          'start': start,
        },
      );

      return ShoppingResponse.fromJson(response);
    } on HttpStatusCodeException catch (_) {
      rethrow;
    }
  }

  Future<void> saveLastSearchData({
    required String image,
    required String keyword,
    required List<ShoppingResult> data,
  }) async {
    final searchedData = SavedSearch(
      image: image,
      keyword: keyword,
      data: data,
      createdAt: DateTime.now(),
    );
    await _sharedPreferences.saveLastSearchData(searchedData);
  }

  Future<List<SavedSearch>> getSavedSearchData() async {
    final data = await _sharedPreferences.getLastSearchData();
    return data;
  }

  Future<bool> checkEnableKeywordSave(String keyword) async {
    final currentSearches = await getSavedSearchData();
    final SavedSearch? exists = currentSearches.firstWhereOrNull(
      (e) => e.keyword.toLowerCase() == keyword.toLowerCase(),
    );

    return exists == null;
  }

  Future<void> deleteAllLastSearchData() async {
    await _sharedPreferences.deleteAllData();
  }
}
