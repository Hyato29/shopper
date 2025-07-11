
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fskeleton/app/data/serp/model/identify_product_response.dart';
import 'package:fskeleton/core.dart';

class SerpApiRepository {
  SerpApiRepository(this._httpClient);

  static final provider = Provider((ref) {
    return SerpApiRepository(ref.watch(HttpClient.serpApiProvider));
  });

  final HttpClient _httpClient;

  Future<IdentifyProductResponse> identifyProductFromFile({
    required File imageFile,
  }) async {
    try {
      final String fileName = imageFile.path.split('/').last;
      final FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          imageFile.path,
          filename: fileName,
        ),
      });

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
