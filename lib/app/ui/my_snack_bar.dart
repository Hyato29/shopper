import 'package:flutter/material.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';

class MySnackBarData {
  MySnackBarData({
    required this.message,
    this.info,
    this.action,
    this.type = MySnackBarType.regular,
    this.onAction,
    this.onClosed,
  });

  final String message;

  final String? info;

  final String? action;

  final MySnackBarType type;

  final VoidCallback? onAction;

  final void Function(SnackBarClosedReason reason)? onClosed;
}

enum MySnackBarType {
  regular(
    backgroundColor: MyColors.neutral100,
    actionColor: MyColors.primary300,
    infoLabelColor: MyColors.neutral60,
  ),
  success(
    backgroundColor: MyColors.success700,
    actionColor: MyColors.white,
    infoLabelColor: MyColors.secondaryGreen50,
  ),
  error(
    backgroundColor: MyColors.danger700,
    actionColor: MyColors.white,
    infoLabelColor: MyColors.danger50,
  );

  const MySnackBarType({
    required this.backgroundColor,
    required this.actionColor,
    required this.infoLabelColor,
  });

  final Color backgroundColor;

  final Color actionColor;

  final Color infoLabelColor;
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMySnackBar(
  BuildContext context,
  MySnackBarData data,
) {
  final controller = ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: data.type.backgroundColor,
      margin: const EdgeInsets.all(8),
      padding: _padding(data),
      behavior: SnackBarBehavior.floating,
      content: IconTheme(
        data: _iconTheme(context),
        child: Row(
          children: [
            Expanded(child: _content(data)),
            if (data.action != null) ...[
              const SizedBox(width: 16),
              _action(data),
            ],
          ],
        ),
      ),
    ),
  )..closed.then((reason) => data.onClosed?.call(reason));

  return controller;
}

IconThemeData _iconTheme(BuildContext context) {
  return IconTheme.of(context)
      .merge(const IconThemeData(color: MyColors.white, size: 24));
}

EdgeInsets _padding(MySnackBarData data) {
  return EdgeInsets.only(
    left: 16,
    top: 16,
    right: data.action != null ? 8 : 16,
    bottom: 16,
  );
}

Widget _icon(MySnackBarData data) {
  switch (data.type) {
    case MySnackBarType.regular:
      return const Icon(Icons.info_outline);
    case MySnackBarType.success:
      return const Icon(Icons.check_circle_outline);
    case MySnackBarType.error:
      return const Icon(Icons.error_outline);
  }
}

Widget _content(MySnackBarData data) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 3.0),
        child: _icon(data),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.message,
              style: MyText.baseSemiBold.copyWith(color: MyColors.white),
            ),
            if (data.info != null)
              Text(
                data.info!,
                style: MyText.sm.copyWith(color: data.type.infoLabelColor),
              ),
          ],
        ),
      ),
    ],
  );
}

Widget _action(MySnackBarData data) {
  return Builder(
    builder: (context) {
      return GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar(
            reason: SnackBarClosedReason.action,
          );
          data.onAction?.call();
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            data.action!,
            style: MyText.smSemiBold.copyWith(color: data.type.actionColor),
          ),
        ),
      );
    },
  );
}
