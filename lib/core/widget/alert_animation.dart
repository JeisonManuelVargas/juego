import 'package:flutter/cupertino.dart';


class AlertAnimation extends StatelessWidget {
  const AlertAnimation({
    super.key,
    this.afterFinished,
    required this.child,
    this.startNow = true,
    this.duration = const Duration(milliseconds: 2000),
  });

  final Widget child;
  final bool startNow;
  final Duration duration;
  final Function()? afterFinished;

  @override
  Widget build(BuildContext context) {
    return startNow ? TweenAnimationBuilder<double>(
      child: child,
      duration: duration,
      onEnd: afterFinished,
      tween: Tween(begin: 0, end: 1),
      builder: (context, value, childBuild) => Opacity(opacity: (value - 1) * -1, child: childBuild),
    )
        : Opacity(opacity: 0, child: Container());
  }
}
