import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fskeleton/app/common/common_screen.dart';
import 'package:fskeleton/app/localizations/ui_text.dart';
import 'package:fskeleton/app/navigation/router.dart';
import 'package:fskeleton/app/ui/buttons/my_primary_button.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';
import 'package:fskeleton/core.dart';
import 'package:go_router/go_router.dart';

class SuccessScreen extends ConsumerStatefulWidget {
  const SuccessScreen({
    super.key,
  });

  @override
  ConsumerState<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends ConsumerState<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: CommonScreen(
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Material(
                        shape: const CircleBorder(),
                        color: MyColors.yellowButton.withOpacity(0.2),
                        child: const SizedBox(width: 240, height: 240),
                      ),
                      Positioned(
                        left: -20,
                        bottom: -40,
                        child: Image.asset(
                          'assets/images/yellow_box.png',
                          width: 250,
                          height: 250,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    context.localizations.successfullySubmitted,
                    style: MyText.baseSemiBold,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.localizations.successfullySubmittedDescription,
                    textAlign: TextAlign.center,
                    style: MyText.sm.copyWith(color: MyColors.neutral80),
                  ),
                  const SizedBox(height: 20),
                  MyPrimaryButton(
                    label: Text(
                      context.localizations.returnToMainMenu,
                      style: MyText.smSemiBold.copyWith(color: MyColors.white),
                    ),
                    onPressed: () {
                      context
                        ..pop()
                        ..pop(true);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
