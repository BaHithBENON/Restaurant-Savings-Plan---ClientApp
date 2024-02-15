// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';

import '../../utilities/config/color_config.dart';

class LightPoint extends StatefulWidget {
  double? size;
  Color? color;
  LightPoint({Key? key, this.size, this.color}) : super(key: key);

  @override
  State<LightPoint> createState() => _LightPointState();
}

class _LightPointState extends State<LightPoint> with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _animationController!.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LightPointAnimation(_animationController!,
        size: widget.size, color: widget.color);
  }
}

class LightPointAnimation extends AnimatedWidget {
  double? size;
  Color? color;
  LightPointAnimation(Animation<double> animation,
      {Key? key, this.size = 50.0, this.color})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final value = (listenable as Animation<double>).value;
    final newValue = lerpDouble(0.5, 1.0, value * 2)!;
    return Center(
      child: Stack(
        children: [
          Center(
            child: Container(
              height: size! * newValue,
              width: size! * newValue,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color != null
                    ? color!.withOpacity(.5)
                    : ColorConfig.primaryColor.withOpacity(.5),
              ),
            ),
          ),
          Center(
            child: Container(
              height: size! - 20,
              width: size! - 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color ?? ColorConfig.primaryColor,
                // gradient: ColorConfig.boxGradient(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
