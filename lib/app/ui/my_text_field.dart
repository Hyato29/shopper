import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fskeleton/app/ui/animated_visibility.dart';
import 'package:fskeleton/app/ui/buttons/my_icon_button.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';

enum TrailingIconMode {
  password,
  clear,
}

class MyTextField extends StatefulWidget {
  const MyTextField({
    super.key,
    this.text,
    this.label,
    this.secondaryLabel,
    this.placeholder,
    this.supportText,
    this.error,
    this.leading,
    this.trailing,
    this.onPressed,
    this.focusNode,
    this.keyboardType,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = false,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled = true,
    this.trailingIconMode,
    this.showCounter = false,
    this.onInfoPressed,
    this.prefixText,
    this.containerPadding,
    this.controller,
  }) : assert(trailingIconMode == null || trailing == null);

  final String? text;

  final String? label;

  final String? secondaryLabel;

  final String? placeholder;

  final String? supportText;

  /// null: No error border, no error message
  /// empty: With error border, no error message
  /// non-empty: With error border, with error message
  final String? error;

  final Widget? leading;

  final Widget? trailing;

  final VoidCallback? onPressed;

  final FocusNode? focusNode;

  final TextInputType? keyboardType;

  final TextInputAction? textInputAction;

  final TextCapitalization textCapitalization;

  final TextStyle? style;

  final bool autofocus;

  final bool autocorrect;

  final bool enableSuggestions;

  final int? maxLines;

  final int? minLines;

  final int? maxLength;

  final ValueChanged<String>? onChanged;

  final ValueChanged<String>? onSubmitted;

  final List<TextInputFormatter>? inputFormatters;

  final bool enabled;

  final TrailingIconMode? trailingIconMode;

  final bool showCounter;

  final VoidCallback? onInfoPressed;

  final String? prefixText;

  final EdgeInsets? containerPadding;

  final TextEditingController? controller;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  TextEditingController? _controller;

  TextEditingController get _effectiveController {
    return widget.controller ??
        (_controller ??= TextEditingController(text: widget.text));
  }

  FocusNode? _focusNode;

  FocusNode get _effectiveFocusNode {
    return widget.focusNode ?? (_focusNode ??= FocusNode());
  }

  late var _obscureText = widget.trailingIconMode == TrailingIconMode.password;

  late var _showClearText = widget.text?.isNotEmpty == true;

  Color get _borderColor {
    if (!widget.enabled) {
      return MyColors.neutral60;
    } else if (widget.error != null) {
      return MyColors.danger500;
    } else if (_effectiveFocusNode.hasFocus) {
      return MyColors.primary500;
    } else {
      return MyColors.neutral70;
    }
  }

  Color get _labelColor {
    if (_effectiveFocusNode.hasFocus) {
      return MyColors.primary500;
    } else {
      return MyColors.black;
    }
  }

  Color get _backgroundColor {
    if (!widget.enabled) {
      return MyColors.neutral30;
    } else {
      return MyColors.neutral10;
    }
  }

  Color get _iconColor {
    if (!widget.enabled) {
      return MyColors.neutral80;
    } else {
      return MyColors.black;
    }
  }

  Color get _textColor {
    if (!widget.enabled) {
      return MyColors.neutral70;
    } else {
      return MyColors.black;
    }
  }

  @override
  void initState() {
    super.initState();
    _effectiveFocusNode.addListener(_handleFocusChanged);
    _updateClearIconListener();
    _effectiveController.addListener(() {
      setState(() {
        // Update character count
      });
    });
  }

  @override
  void didUpdateWidget(covariant MyTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text != oldWidget.text &&
        widget.text != _effectiveController.text) {
      _effectiveController.text = widget.text ?? '';
    }
    if (oldWidget.trailingIconMode != widget.trailingIconMode) {
      _updateClearIconListener();
    }
  }

  @override
  void dispose() {
    if (_focusNode != null) {
      _focusNode?.dispose();
    }
    if (_controller != null) {
      _controller?.dispose();
    }
    super.dispose();
  }

  void _handleFocusChanged() {
    setState(() {
      // Rebuild the widget on focus change to update border
    });
  }

  void _updateClearIconListener() {
    _effectiveController.removeListener(_handleClearIcon);
    if (widget.trailingIconMode == TrailingIconMode.clear) {
      _effectiveController.addListener(_handleClearIcon);
    }
  }

  void _handleClearIcon() {
    if (_showClearText && _effectiveController.text.isEmpty) {
      setState(() => _showClearText = false);
    } else if (!_showClearText && _effectiveController.text.isNotEmpty) {
      setState(() => _showClearText = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context).merge(
      IconThemeData(color: _iconColor),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null || widget.secondaryLabel != null) ...[
          _label(),
          const SizedBox(height: 4),
        ],
        _container(iconTheme),
        AnimatedVisibility(
          isVisible: widget.error?.isNotEmpty == true ||
              widget.supportText != null ||
              (widget.maxLength != null && widget.showCounter),
          axis: Axis.vertical,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 4),
                    if (widget.error?.isNotEmpty == true) _error(),
                    if (widget.supportText != null) _support(),
                  ],
                ),
              ),
              if (widget.maxLength != null && widget.showCounter) _counter(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _counter() {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        '${_effectiveController.text.length}/${widget.maxLength}',
        style: MyText.xs.copyWith(color: MyColors.neutral80),
        textAlign: TextAlign.end,
      ),
    );
  }

  Widget _label() {
    return Row(
      children: [
        if (widget.label != null)
          Text(widget.label!, style: MyText.sm.copyWith(color: _labelColor)),
        if (widget.onInfoPressed != null)
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: InkWell(
              onTap: widget.onInfoPressed,
              child: const Icon(
                Icons.info_outline,
                color: MyColors.primary500,
              ),
            ),
          ),
        const Spacer(),
        if (widget.secondaryLabel != null)
          Text(widget.secondaryLabel!, style: MyText.xs),
      ],
    );
  }

  Widget _container(IconThemeData iconTheme) {
    return Material(
      clipBehavior: Clip.antiAlias,
      color: _backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: _borderColor),
      ),
      child: InkWell(
        onTap: widget.enabled ? widget.onPressed : null,
        child: Padding(
          padding: widget.containerPadding ?? const EdgeInsets.all(16),
          child: Row(
            children: [
              if (widget.leading != null)
                IconTheme(data: iconTheme, child: widget.leading!),
              if (widget.leading != null) const SizedBox(width: 8),
              Expanded(child: _textField()),
              if (_trailing() != null) const SizedBox(width: 8),
              if (_trailing() != null)
                IconTheme(data: iconTheme, child: _trailing()!),
            ],
          ),
        ),
      ),
    );
  }

  Widget _support() {
    return Text(widget.supportText!, style: MyText.xs);
  }

  Widget _error() {
    return Text(
      widget.error!,
      style: MyText.xs.copyWith(color: MyColors.danger500),
    );
  }

  TextField _textField() {
    return TextField(
      controller: _effectiveController,
      focusNode: _effectiveFocusNode,
      decoration: InputDecoration(
        border: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.zero,
        hintText: !_effectiveFocusNode.hasFocus || widget.prefixText == null
            ? widget.placeholder
            : null,
        hintStyle: MyText.base.copyWith(color: MyColors.neutral70),
        counterText: '',
        prefixText:
            _effectiveFocusNode.hasFocus || _effectiveController.text.isNotEmpty
                ? widget.prefixText
                : null,
        prefixStyle: MyText.base.copyWith(color: _textColor),
      ),
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization,
      style: MyText.base.copyWith(color: _textColor),
      readOnly: widget.onPressed != null || !widget.enabled,
      autofocus: widget.autofocus,
      obscureText: _obscureText,
      obscuringCharacter: '⬤',
      autocorrect: widget.autocorrect,
      enableSuggestions: widget.enableSuggestions,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      inputFormatters: widget.inputFormatters,
      enabled: widget.onPressed == null && widget.enabled,
      cursorWidth: 1,
      cursorColor: _textColor,
    );
  }

  Widget? _trailing() {
    if (widget.trailingIconMode == TrailingIconMode.password) {
      return _passwordTrailing();
    } else if (widget.trailingIconMode == TrailingIconMode.clear) {
      return _clearTrailing();
    }

    return widget.trailing;

    // return const SizedBox.shrink();
  }

  Widget _passwordTrailing() {
    return MyIconButton(
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
      iconSize: 24,
      icon: Icon(
        _obscureText ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
      ),
    );
  }

  Widget? _clearTrailing() {
    if (_showClearText) {
      return MyIconButton(
        onPressed: () {
          _effectiveController.text = '';
          widget.onChanged?.call(_effectiveController.text);
        },
        iconSize: 24,
        icon: const Icon(
          Icons.close,
          color: MyColors.neutral70,
        ),
      );
    } else {
      return null;
    }
  }
}
