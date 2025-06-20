import 'package:flutter_riverpod/flutter_riverpod.dart';

class NetworkConfig {
  const NetworkConfig({
    required this.apiScheme,
    required this.apiHost,
    required this.apiPort,
  });

  static final serpApiProvider = Provider<NetworkConfig>(
    (ref) {
      throw UnimplementedError(
        'NetworkConfig is not provided in the main function',
      );
    },
  );

  static final wmsApiProvider = Provider<NetworkConfig>(
    (ref) {
      throw UnimplementedError(
        'NetworkConfig is not provided in the main function',
      );
    },
  );

  final String apiScheme;

  final String apiHost;

  final String apiPort;
}
