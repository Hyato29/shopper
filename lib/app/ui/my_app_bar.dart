import 'package:flutter/material.dart';
import 'package:fskeleton/app/ui/buttons/my_icon_button.dart';

const _toolbarHeight = 64.0;

const appBarDivider = PreferredSize(
  preferredSize: Size.fromHeight(1),
  child: Divider(),
);

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    this.leading,
    this.title,
    this.trailing,
    this.centeredTitle,
    this.titleSpacing,
    this.bottom = const [appBarDivider],
    this.useCloseButton = false,
    this.backgroundColor,
    this.bottomOpacity = 1.0,
  });

  final Widget? leading;

  final Widget? title;

  final List<Widget>? trailing;

  final bool? centeredTitle;

  final double? titleSpacing;

  final List<PreferredSizeWidget> bottom;

  final bool useCloseButton;

  final Color? backgroundColor;

  final double bottomOpacity;

  @override
  Size get preferredSize =>
      Size.fromHeight(_toolbarHeight + _bottomColumn().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: _toolbarHeight,
      leadingWidth: _toolbarHeight,
      leading: Center(child: _leading(context)),
      title: title,
      titleSpacing: titleSpacing,
      actions: trailing,
      centerTitle: centeredTitle,
      bottom: _bottomColumn(),
      backgroundColor: backgroundColor,
      bottomOpacity: bottomOpacity,
    );
  }

  Widget? _leading(BuildContext context) {
    if (leading != null) {
      return leading;
    }

    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    if (parentRoute?.impliesAppBarDismissal == true) {
      return _backButton(context);
    }

    return null;
  }

  Widget _backButton(BuildContext context) {
    return MyIconButton(
      key: const ValueKey('back_button'),
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(useCloseButton ? Icons.close : Icons.chevron_left),
    );
  }

  PreferredSizeWidget _bottomColumn() {
    return PreferredSizeColumn(children: bottom);
  }
}

class PreferredSizeColumn extends StatelessWidget
    implements PreferredSizeWidget {
  const PreferredSizeColumn({super.key, required this.children});

  final List<PreferredSizeWidget> children;

  @override
  Size get preferredSize {
    final double height;
    if (children.isEmpty) {
      height = 0;
    } else {
      height = children
          .map((child) => child.preferredSize.height)
          .reduce((value, element) => value + element);
    }

    return Size.fromHeight(height);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }
}
