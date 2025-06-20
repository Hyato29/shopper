import 'dart:async';

import 'package:flutter/material.dart';

const _ballCount = 3;
const _duration = Duration(milliseconds: 500);
const _delay = Duration(milliseconds: 250);
const _smallBallSize = 12.0;
const _bigBallSize = 20.0;

class CommonLoading extends StatefulWidget {
  const CommonLoading({
    super.key,
    this.ballColor = Colors.white,
  });

  final Color ballColor;

  @override
  State<CommonLoading> createState() => _CommonLoadingState();
}

class _CommonLoadingState extends State<CommonLoading>
    with TickerProviderStateMixin {
  late final _controllers = List.generate(_ballCount, (index) {
    return AnimationController(
      duration: _duration,
      vsync: this,
    );
  });

  late final _animations = _controllers.map(
    (controller) {
      return Tween(begin: 1.0, end: _bigBallSize / _smallBallSize)
          .animate(controller);
    },
  ).toList();

  final timers = <Timer>[];

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final timer in timers) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _startAnimation();
    });
  }

  void _startAnimation() {
    for (var i = 0; i < _controllers.length; i++) {
      final timer = Timer(_delay * i, () {
        _controllers[i].repeat(reverse: true);
      });
      timers.add(timer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(_ballCount, (index) {
          return [
            _ball(index),
            if (index < _ballCount - 1) const SizedBox(width: _smallBallSize),
          ];
        }).expand((element) => element),
      ],
    );
  }

  Widget _ball(int index) {
    return ScaleTransition(
      scale: _animations[index],
      child: Container(
        width: _smallBallSize,
        height: _smallBallSize,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: widget.ballColor,
        ),
      ),
    );
  }
}
