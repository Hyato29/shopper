import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/common/common_controller.dart';
import 'package:fskeleton/app/data/auth/auth_repository.dart';
import 'package:fskeleton/app/data/auth/model/login_response.dart';

import 'package:fskeleton/core.dart';

part 'login_screen_controller.freezed.dart';

class LoginScreenController extends StateNotifier<LoginScreenUiState> {
  LoginScreenController(
    this._authRepository,
    this._commonController,
  ) : super(const LoginScreenUiState());

  final AuthRepository _authRepository;
  final CommonController _commonController;

  static final provider = StateNotifierProvider.autoDispose<
      LoginScreenController, LoginScreenUiState>(
    (ref) {
      return LoginScreenController(
        ref.watch(AuthRepository.provider),
        ref.watch(CommonController.provider.notifier),
      );
    },
  );

  Future<void> onScreenLoaded() async {}

  void onEmailChanged(String value) {
    state = state.copyWith(email: value);
    _checkButtonEnable();
  }

  void onPasswordChanged(String value) {
    state = state.copyWith(password: value);
    _checkButtonEnable();
  }

  Future<void> onLoginPressed({required VoidCallback onSuccess}) async {
    _commonController.showLoading(isLoading: true);
    final result = await AsyncValue.guard(
      () => _authRepository.login(
        email: state.email,
        password: state.password,
      ),
    );
    _commonController.showLoading(isLoading: false);
    if (!mounted) return;
    if (result is AsyncData) {
      state = state.copyWith(loginResponse: result);
      onSuccess();
    } else {
      _commonController.handleCommonError(result, null);
    }
  }

  void setRememberMe({required bool flag}) {
    state = state.copyWith(rememberMe: flag);
  }

  bool _isValidEmail() {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(state.email);
  }

  void _checkButtonEnable() {
    final enabled =
        state.email.isNotEmpty && state.password.isNotEmpty && _isValidEmail();

    state = state.copyWith(buttonEnable: enabled);
  }
}

@freezed
class LoginScreenUiState with _$LoginScreenUiState {
  const factory LoginScreenUiState({
    @Default(null) bool? isLoggedIn,
    @Default('') String email,
    @Default('') String password,
    @Default(AsyncValue.loading())
    AsyncValue<LoginResourceResponse> loginResponse,
    @Default(false) bool rememberMe,
    @Default(false) bool buttonEnable,
  }) = _LoginScreenUiState;
}
