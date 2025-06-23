import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fskeleton/app/app.dart';
import 'package:fskeleton/app/config/env_loader.dart';
import 'package:fskeleton/core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  await EnvLoader.load(file: '.env.dev');

  final serpApiNetworkConfig = NetworkConfig(
    apiScheme: EnvLoader.get('SERP_API_SCHEME'),
    apiHost: EnvLoader.get('SERP_API_HOST'),
    apiPort: EnvLoader.get('SERP_API_PORT'),
  );

  final wmsApiConfig = NetworkConfig(
    apiScheme: EnvLoader.get('WMS_API_SCHEME'),
    apiHost: EnvLoader.get('WMS_API_HOST'),
    apiPort: EnvLoader.get('WMS_API_PORT'),
  );

  runApp(
    ProviderScope(
      observers: const [],
      overrides: [
        NetworkConfig.serpApiProvider.overrideWithValue(serpApiNetworkConfig),
        NetworkConfig.wmsApiProvider.overrideWithValue(wmsApiConfig),
      ],
      child: const App(),
    ),
  );
}
