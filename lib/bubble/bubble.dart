import 'package:demobubble/bubble/bubble_animation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Bubble {
  double diameter;
  double radius;
  Offset offset;
  bool isRoot = false;
  Bubble target;
  int degree;
  bool isSelect = false;
  String title;
  BubbleAnimation animation;

  Bubble(double diameter,
      {Offset offset, this.isRoot = false, this.target, this.degree, this.title,this.animation}) {
    this.diameter = diameter;
    this.radius = diameter / 2;
    if (offset != null) this.offset = _realOffset(offset);

    if (isRoot) this.offset = _realOffset(Offset(offset.dx / 2, offset.dy / 2));
    if (target != null) {
      this.offset = degreeToPoint(target, this, degree);
    }
  }

  Offset _realOffset(Offset offset) {
    return Offset(offset.dx - radius, offset.dy - radius);
  }

  Offset degreeToPoint(Bubble target, Bubble current, degree) {
    degree = (-degree) - 180;
    double radius = target.radius + current.radius + 1;
    double x = (target.offset.dx + (target.radius - current.radius)) +
        math.cos((degree - 90) * (math.pi / 180)) * radius;
    double y = (target.offset.dy + (target.radius - current.radius)) +
        math.sin((degree - 90) * (math.pi / 180)) * radius;
    return Offset(x, y);
  }

  Bubble clone()
  {
    return Bubble(diameter,offset: offset,isRoot:isRoot,target: target,degree: degree, title: title,animation: animation);
  }
}
