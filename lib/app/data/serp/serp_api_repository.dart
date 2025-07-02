// lib/app/data/wms/identify_api_repository.dart

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fskeleton/app/data/wms/model/wms_identify/identify_product_response.dart';
import 'package:fskeleton/core.dart';

class SerpApiRepository {
  SerpApiRepository(this._httpClient);

  // Provider ini akan menggunakan konfigurasi dari SERP_API
  static final provider = Provider((ref) {
    return SerpApiRepository(ref.watch(HttpClient.serpApiProvider));
  });

  final HttpClient _httpClient;

  Future<IdentifyProductResponse> identifyProductFromFile({
    required File imageFile,
  }) async {
    try {
      String fileName = imageFile.path.split('/').last;
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          imageFile.path,
          filename: fileName,
        ),
      });

      // Endpoint ini akan memanggil server identifikasi Anda
      final response = await _httpClient.post<Map<String, dynamic>>(
        path: '/api/v1/identify-product',
        body: formData,
      );
      return IdentifyProductResponse.fromJson(response);
    } on HttpStatusCodeException catch (_) {
      rethrow;
    }
  }
}
