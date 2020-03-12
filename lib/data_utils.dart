import 'package:demobubble/bubble/bubble.dart';
import 'package:demobubble/bubble/bubble_animation.dart';
import 'package:flutter/material.dart';

class DataUtils{

 static List<Bubble> getList1(Offset parent)
  {
    List<Bubble> result = [];
    var bRoot = Bubble(127, offset: parent, isRoot: true,title: "情報",animation: BubbleAnimation(interval: Interval(0.3,0.75,curve: Curves.bounceOut)));
    var b1 = Bubble(144, target: bRoot,degree: 71,title: "5G",animation: BubbleAnimation(interval: Interval(0.7,1.0,curve: Curves.bounceOut)));
    var b2 = Bubble(119, target: bRoot,degree: 304,title: "ドローン",animation: BubbleAnimation(interval: Interval(0.6,1.0,curve: Curves.bounceOut)));
    var b3 = Bubble(144, target: bRoot,degree: 243,title: "AI",animation: BubbleAnimation(interval: Interval(0.0,0.7,curve: Curves.bounceOut)));
    var b4 = Bubble(144, target: bRoot,degree: 135,title: "フィンテック",animation: BubbleAnimation(interval: Interval(0.4,0.8,curve: Curves.bounceOut)));
    var b5 = Bubble(115, target: b4,degree: 246,title: "宇宙",animation: BubbleAnimation(interval: Interval(0.5,0.85,curve: Curves.bounceOut)));

    result.add(bRoot);
    result.add(b1);
    result.add(b2);
    result.add(b3);
    result.add(b4);
    result.add(b5);
    return result;

  }

 static List<Bubble> getList2(Offset parent)
  {
    List<Bubble> result = [];
    BubbleAnimation animation =  BubbleAnimation(duration:Duration(milliseconds: 600),typeAnimation: BubbleTypeAnimation.Transfer_Top);
    var bRoot = Bubble(127, offset: parent, isRoot: true,title: "外食",animation: animation);
    var b1 = Bubble(144, target: bRoot,degree: 71,title: "旅行",animation: animation);
    var b2 = Bubble(119, target: bRoot,degree: 304,title: "スポーツ",animation: animation);
    var b3 = Bubble(144, target: bRoot,degree: 243,title: "アニメ",animation: animation);
    var b4 = Bubble(144, target: bRoot,degree: 135,title: "ショッピング",animation: animation);
    var b5 = Bubble(115, target: b4,degree: 246,title: "スポーツ",animation: animation);

    result.add(bRoot);
    result.add(b1);
    result.add(b2);
    result.add(b3);
    result.add(b4);
    result.add(b5);
    return result;
  }

 static List<Bubble> getList3(Offset parent)
  {
    List<Bubble> result = [];
    BubbleAnimation animation =  BubbleAnimation(typeAnimation: BubbleTypeAnimation.None);
    var bRoot = Bubble(127, offset: parent, isRoot: true,title: "債券",animation: animation);
    var b1 = Bubble(144, target: bRoot,degree: 71,title: "IPO",animation: animation);
    var b2 = Bubble(119, target: bRoot,degree: 304,title: "株主優待",animation: animation);
    var b3 = Bubble(144, target: bRoot,degree: 243,title: "大手企業",animation: animation);
    var b4 = Bubble(144, target: bRoot,degree: 135,title: "ベンチャー",animation: animation);
    var b5 = Bubble(115, target: b4,degree: 246,title: "配当金",animation: animation);
    var b6 = Bubble(147, target: bRoot,degree: 6,title: "分配金",animation: animation);
    var b7 = Bubble(144, target: b5,degree: 225,title: "中小企業",animation: animation);
    var b8 = Bubble(144, target: b4,degree: 160,title: "海外企業",animation: animation);

    result.add(bRoot);
    result.add(b1);
    result.add(b2);
    result.add(b3);
    result.add(b4);
    result.add(b5);
    result.add(b6);
    result.add(b7);
    result.add(b8);
    return result;
  }

 static List<Bubble> getList4(Offset parent)
  {
    List<Bubble> result = [];
    var bRoot = Bubble(127, offset: parent, isRoot: true,title: "税金",animation: BubbleAnimation(typeAnimation: BubbleTypeAnimation.None));
    var b1 = Bubble(144, target: bRoot,degree: 71,title: "生命保険",animation:BubbleAnimation(typeAnimation: BubbleTypeAnimation.None));
    var b2 = Bubble(144, target: bRoot,degree: 243,title: "年金",animation: BubbleAnimation(typeAnimation: BubbleTypeAnimation.None));
    var b3 = Bubble(144, target: bRoot,degree: 135,title: "事業承継",animation: BubbleAnimation(typeAnimation: BubbleTypeAnimation.None));
    var b4 = Bubble(115, target: b3,degree: 246,title: "相続",animation: BubbleAnimation(typeAnimation: BubbleTypeAnimation.None));

    result.add(bRoot);
    result.add(b1);
    result.add(b2);
    result.add(b3);
    result.add(b4);
    return result;

  }
}