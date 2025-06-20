import 'package:flutter/material.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';

class MyCheckbox extends StatelessWidget {
  const MyCheckbox({
    super.key,
    this.enabled = true,
    required this.title,
    this.titleStyle,
    required this.value,
    required this.onChanged,
  });

  final bool enabled;
  final String title;
  final TextStyle? titleStyle;
  final bool value;

  // ignore: avoid_positional_boolean_parameters
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      enabled: enabled,
      side: BorderSide(
        color: enabled ? MyColors.primary500 : MyColors.neutral70,
      ),
      title: Transform.translate(
        offset: const Offset(-12, 0),
        child: Text(title, style: titleStyle ?? MyText.xs),
      ),
      contentPadding: EdgeInsets.zero,
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
      visualDensity: const VisualDensity(vertical: -4),
    );
  }
}
