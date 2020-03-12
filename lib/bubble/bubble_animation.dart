import 'package:flutter/material.dart';

class BubbleAnimation{
  Duration duration;
  Interval interval;
  bool isDone = false;
  BubbleTypeAnimation typeAnimation;
  BubbleAnimation({this.duration = const Duration(milliseconds: 1000),this.interval,this.typeAnimation = BubbleTypeAnimation.Scale_BounceOut});
}

enum BubbleTypeAnimation {
  Scale_BounceOut, Transfer_Top,None
}