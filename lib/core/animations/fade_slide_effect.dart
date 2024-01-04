import 'package:flutter/material.dart';

class FadeSlideEffect extends StatefulWidget {
  final Widget child;
  final Animation<double> animation;

  const FadeSlideEffect({
    super.key,
    required this.child,
    required this.animation,
  });

  @override
  State<FadeSlideEffect> createState() => _FadeSlideEffectState();
}

class _FadeSlideEffectState extends State<FadeSlideEffect> {
  final _tweenAnimation =
      Tween<Offset>(begin: const Offset(0.2, 0), end: const Offset(0, 0))
          .chain(CurveTween(curve: Curves.decelerate));

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: widget.animation,
      child: SlideTransition(
        position: widget.animation.drive(_tweenAnimation),
        child: widget.child,
      ),
    );
  }
}
