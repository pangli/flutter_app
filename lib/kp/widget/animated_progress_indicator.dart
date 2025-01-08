import 'package:flutter/material.dart';

class AnimatedProgressIndicator extends StatefulWidget {
  final double value;
  final Function animationCompleted;

  const AnimatedProgressIndicator(
      {super.key, required this.value, required this.animationCompleted});

  @override
  State<StatefulWidget> createState() {
    return _AnimatedProgressIndicatorState();
  }
}

class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _curveAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    final colorTween = TweenSequence([
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.grey[350], end: Colors.grey[400]),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.blue[200], end: Colors.blue[300]),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.blue[300], end: Colors.blue),
        weight: 1,
      ),
    ]);
    _colorAnimation = _controller.drive(colorTween);
    _curveAnimation = _controller.drive(CurveTween(curve: Curves.easeIn));
    _curveAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.animationCompleted;
      }
    });
  }

  @override
  void didUpdateWidget(covariant AnimatedProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.animateTo(widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Padding(
          padding: EdgeInsets.only(left: 0, top: 4, right: 0),
          child: LinearProgressIndicator(
              value: _curveAnimation.value,
              valueColor: _colorAnimation,
              minHeight: 40,
              backgroundColor: _colorAnimation.value?.withValues(alpha: 0.4),
              borderRadius: BorderRadius.all(Radius.circular(40))
              // borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              )),
    );
  }
}
