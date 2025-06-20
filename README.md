# input barang

A new Flutter project.

## Getting Started

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