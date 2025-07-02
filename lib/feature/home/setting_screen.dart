import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fskeleton/app/common/common_screen.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';
import 'package:fskeleton/feature/home/home_screen_controller.dart';
import 'package:fskeleton/app/navigation/router.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  final _controller = HomeScreenController.provider;

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: MyColors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: MyColors.black),
            onPressed: () => context.pop(),
          ),
          title: Text(
            'Pengaturan',
            style: MyText.baseSemiBold.copyWith(color: MyColors.black),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              ListTile(
                leading: const Text("Default Printer"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Text("Logout"),
                trailing: IconButton(
                  onPressed: () {
                    context.goNamed(AppRouter.loginRoute);
                    ref.read(_controller.notifier).onLogout();
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
