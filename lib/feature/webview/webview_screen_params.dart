import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/data/my_search_preferences/saved_search.dart';

part 'webview_screen_params.freezed.dart';

@freezed
class WebViewScreenParams with _$WebViewScreenParams {
  const factory WebViewScreenParams({
    required String fileUrl,
    required String image,
    @Default(null) SavedSearch? savedSearch,
  }) = _WebViewScreenParams;
}
