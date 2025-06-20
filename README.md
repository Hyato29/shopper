# input barang

A new Flutter project.

## Getting Started

Set environment arguments
```
--dart-define=SERP_API_SCHEME=https
--dart-define=SERP_API_HOST=api.serpdog.io
--dart-define=SERP_API_PORT=
--dart-define=SERP_API_KEY=66ded3eba9a14bed788ad228
--dart-define=AWS_BUCKET_NAME=aplikasi-input-barang
--dart-define=AWS_ACCESS_KEY_ROOT=AKIAQLVQQ5PKLKVTZBWZ
--dart-define=AWS_SECRET_KEY_ROOT=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
--dart-define=AWS_REGION=ap-southeast-3
```

Resolved packages
```
flutter pub get
```

Generate new freezed models
```
flutter pub run build_runner build --delete-conflicting-outputs
```

Don't forget to always use formatting, from root directory
```
dart format .
```

And analyze current codes
```
dart format -o none --set-exit-if-changed .; flutter analyze
```

Run release
```
flutter run --release \
--dart-define=WMS_API_SCHEME=https \
--dart-define=WMS_API_HOST=wms-server.digitalindustryagency.com \
--dart-define=SERP_API_SCHEME=https \
--dart-define=SERP_API_HOST=api.serpdog.io \
--dart-define=SERP_API_PORT= \
--dart-define=SERP_API_KEY=66ded3eba9a14bed788ad228 \
--dart-define=AWS_BUCKET_NAME=aplikasi-input-barang \
--dart-define=AWS_ACCESS_KEY_ROOT=AKIAQLVQQ5PKLKVTZBWZ \
--dart-define=AWS_SECRET_KEY_ROOT=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 \
--dart-define=AWS_REGION=ap-southeast-3
```

Build apk release
```
flutter build apk -t lib/main.dart \
--dart-define=WMS_API_SCHEME=https \
--dart-define=WMS_API_HOST=server.wms-liquid8.online \
--dart-define=SERP_API_SCHEME=https \
--dart-define=SERP_API_HOST=api.serpdog.io \
--dart-define=SERP_API_PORT= \
--dart-define=SERP_API_KEY=66ded3eba9a14bed788ad228 \
--dart-define=AWS_BUCKET_NAME=aplikasi-input-barang \
--dart-define=AWS_ACCESS_KEY_ROOT=AKIAQLVQQ5PKLKVTZBWZ \
--dart-define=AWS_SECRET_KEY_ROOT=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 \
--dart-define=AWS_REGION=ap-southeast-3 \
--release --obfuscate --split-debug-info=./debug-info
```