import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/ui/loading_overlay.dart';
import 'package:fskeleton/core.dart';

part 'common_controller.freezed.dart';

class CommonController extends StateNotifier<CommonScreenUiState> {
  CommonController() : super(const CommonScreenUiState());

  static final provider =
      StateNotifierProvider.autoDispose<CommonController, CommonScreenUiState>(
    (ref) {
      return CommonController();
    },
  );

  void showLoading({required bool isLoading}) {
    state = state.copyWith(
      overlayUiState: isLoading
          ? LoadingOverlayUiState.loading
          : LoadingOverlayUiState.hidden,
    );
  }

  void handleCommonError(Object error, Function()? errorAction) {
    state = state.copyWith(error: error, errorAction: errorAction);
  }

  void resetErrorAction() {
    state = state.copyWith(errorAction: null);
  }
}

@freezed
class CommonScreenUiState with _$CommonScreenUiState {
  const factory CommonScreenUiState({
    @Default(LoadingOverlayUiState.hidden) LoadingOverlayUiState overlayUiState,
    Object? error,
    Function()? errorAction,
  }) = _CommonScreenUiState;
}
