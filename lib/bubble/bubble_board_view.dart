import 'package:demobubble/bubble/bubble.dart';
import 'package:demobubble/bubble/bubble_view.dart';
import 'package:flutter/cupertino.dart';

typedef onBubbleItemClick = void Function(Bubble bubble);

class BubbleBoardView extends StatelessWidget {

  List<Bubble> bubbles = [];
  Size size;
  onBubbleItemClick clickListener;

  BubbleBoardView(this.size,this.bubbles,{this.clickListener});


  @override
  Widget build(BuildContext context) {
      return bubbles.isNotEmpty?Stack(children: getChildView(bubbles)):Center(child: Text("Empty Data"),);
  }

  List<Widget> getChildView(List<Bubble> bubble)
  {
    List<Widget> result = [];
    for(var child in bubble)
      {
        result.add(Positioned(
          left: child.offset.dx,
          bottom: child.offset.dy,
          child: BubbleView(child,size,clickListener),
        ));
      }
    return result;
  }

}
