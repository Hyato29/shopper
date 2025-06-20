import 'package:flutter/material.dart';

class AnimatedVisibility extends StatefulWidget {
  const AnimatedVisibility({
    super.key,
    required this.isVisible,
    this.axis = Axis.horizontal,
    this.axisAlignment = -1,
    required this.child,
  });

  final bool isVisible;

  final Axis axis;

  final double axisAlignment;

  final Widget child;

  @override
  State<AnimatedVisibility> createState() => _AnimatedVisibilityState();
}

class _AnimatedVisibilityState extends State<AnimatedVisibility>
    with TickerProviderStateMixin {
  late final _controller = AnimationController(
    value: widget.isVisible ? 1 : 0,
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  late final _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AnimatedVisibility oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isVisible != widget.isVisible) {
      if (widget.isVisible) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SizeTransition(
        sizeFactor: _animation,
        axis: widget.axis,
        axisAlignment: widget.axisAlignment,
        child: widget.child,
      ),
    );
  }
}
