import 'package:flutter/material.dart';

class RiseEffect extends StatefulWidget {
  final Widget child;
  final double riseOffset;
  final int startAfterinMilliSec;
  const RiseEffect({
    super.key,
    this.riseOffset = 0.1,
    required this.child,
    this.startAfterinMilliSec = 0,
  });

  @override
  State<RiseEffect> createState() => _RiseEffectState();
}

class _RiseEffectState extends State<RiseEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    final tweenOffset = Tween<Offset>(
        begin: Offset(0, widget.riseOffset), end: const Offset(0, 0));
    _offsetAnimation = CurvedAnimation(
            parent: _animationController, curve: Curves.fastLinearToSlowEaseIn)
        .drive(tweenOffset);

    final tweenOpacity = Tween<double>(begin: 0, end: 1);
    _opacityAnimation = CurvedAnimation(
            parent: _animationController, curve: Curves.fastLinearToSlowEaseIn)
        .drive(tweenOpacity);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Duration(milliseconds: widget.startAfterinMilliSec));
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: SlideTransition(
        position: _offsetAnimation,
        child: widget.child,
      ),
    );
  }
}
