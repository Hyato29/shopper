import 'package:flutter/material.dart';
import 'package:fskeleton/app/app.dart';
import 'package:fskeleton/app/config/env_loader.dart';
import 'package:fskeleton/core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EnvLoader.load(file: '.env.dev');

  final wmsApiConfig = NetworkConfig(
    apiScheme: EnvLoader.get('WMS_API_SCHEME'),
    apiHost: EnvLoader.get('WMS_API_HOST'),
    apiPort: EnvLoader.get('WMS_API_PORT'),
  );

  runApp(
    ProviderScope(
      observers: const [],
      overrides: [
        NetworkConfig.wmsApiProvider.overrideWithValue(wmsApiConfig),
      ],
      child: const App(),
    ),
  );
}
