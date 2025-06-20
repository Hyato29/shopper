import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fskeleton/app/common/common_screen.dart';
import 'package:fskeleton/app/localizations/ui_text.dart';
import 'package:fskeleton/app/ui/buttons/my_primary_button.dart';
import 'package:fskeleton/app/ui/my_text_field.dart';
import 'package:fskeleton/app/ui/tablet_detector.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';
import 'package:fskeleton/core.dart';
import 'package:fskeleton/feature/login/login_screen_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({
    super.key,
    required this.onSuccessLogin,
  });

  final VoidCallback onSuccessLogin;

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _controller = LoginScreenController.provider;
  FocusNode usernameTextFieldFocusNode = FocusNode();
  FocusNode passwordTextFieldFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(_controller.notifier).onScreenLoaded();
    });
  }

  @override
  void dispose() {
    usernameTextFieldFocusNode.dispose();
    passwordTextFieldFocusNode.dispose();
    if (context.mounted) ref.invalidate(_controller);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      child: Scaffold(
        backgroundColor: MyColors.bodyBackground,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: TabletDetector.isTablet(MediaQuery.of(context))
                    ? MediaQuery.of(context).size.width * 0.6
                    : MediaQuery.of(context).size.width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Column(
                    children: [
                      _logo(),
                      const SizedBox(height: 32),
                      _content(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // body: _lens(),
      ),
    );
  }

  Widget _logo() {
    return Image.asset(
      'assets/images/logo_liquid.png',
    );
  }

  Widget _content() {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.white,
        border: Border.all(color: MyColors.neutral50),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child:
                  Text(context.localizations.enter, style: MyText.xlSemiBold),
            ),
            _usernameField(),
            const SizedBox(height: 12),
            _passwordField(),
            const SizedBox(height: 16),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Consumer(
      builder: (context, ref, child) {
        final email = ref.watch(
          _controller.select((state) => state.email),
        );

        return MyTextField(
          focusNode: usernameTextFieldFocusNode,
          label: context.localizations.userId,
          text: email,
          placeholder: context.localizations.userId,
          trailingIconMode: TrailingIconMode.clear,
          onChanged: ref.read(_controller.notifier).onEmailChanged,
        );
      },
    );
  }

  Widget _passwordField() {
    return Consumer(
      builder: (context, ref, child) {
        final password = ref.watch(
          _controller.select((state) => state.password),
        );

        return MyTextField(
          focusNode: passwordTextFieldFocusNode,
          label: context.localizations.password,
          text: password,
          placeholder: context.localizations.password,
          keyboardType: TextInputType.text,
          trailingIconMode: TrailingIconMode.password,
          maxLines: 1,
          onChanged: ref.read(_controller.notifier).onPasswordChanged,
        );
      },
    );
  }

  Widget _loginButton() {
    return Consumer(
      builder: (context, ref, child) {
        final isEnable = ref.watch(
          _controller.select((value) => value.buttonEnable),
        );

        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: MyPrimaryButton(
            trailing: Text(context.localizations.enter),
            onPressed: isEnable
                ? () {
                    _requestUnfocus();
                    ref
                        .read(_controller.notifier)
                        .onLoginPressed(onSuccess: widget.onSuccessLogin);
                  }
                : null,
          ),
        );
      },
    );
  }

  void _requestUnfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
