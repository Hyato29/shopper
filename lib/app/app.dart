import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fskeleton/app/localizations/app_localizations.dart';
import 'package:fskeleton/app/navigation/router.dart';
import 'package:fskeleton/app/ui/theme/app_theme.dart';
import 'package:fskeleton/core.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: ref.watch(AppRouter.provider).router,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: myTheme,
      builder: (context, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
            ),
            child: child ?? const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
