
import 'package:demobubble/bubble/bubble.dart';
import 'package:demobubble/bubble/bubble_animation.dart';
import 'package:demobubble/bubble/bubble_board_view.dart';
import 'package:flutter/material.dart';

class BubbleView extends StatefulWidget {
  Bubble bubble;
  Size sizeParent;
  onBubbleItemClick clickListener;

  BubbleView(this.bubble,this.sizeParent,this.clickListener);


  @override
  _BubbleViewState createState() => _BubbleViewState();
}

class _BubbleViewState extends State<BubbleView> with TickerProviderStateMixin {
  AnimationController _controlTap;
  AnimationController _controlInit;
  Animation<double> _animationTap;
  Animation<double> _animationBounceOut;
  Animation<double> _animationTransfer;

  Bubble oldBubble,currentBubble;
  bool isOutAnimation =false;


  @override
  void initState() {
    super.initState();
    currentBubble= widget.bubble.clone();
    _controlTap = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 120),
        value: 1.0,
        lowerBound: 0.9,
        upperBound: 1.0);
    _animationTap = CurvedAnimation(parent: _controlTap, curve: Curves.linear)
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _controlTap.forward();
        }
      });
    _handleAnimationInit();
  }

  @override
  void didUpdateWidget(BubbleView oldWidget) {
    super.didUpdateWidget(oldWidget);
    _handleUpdateData(oldWidget);
  }

  void _handleUpdateData(BubbleView oldWidget)
  {
    if(widget.bubble!=oldWidget.bubble && widget.bubble.animation!=null && widget.bubble.animation.typeAnimation != BubbleTypeAnimation.None)
    {
      isOutAnimation = true;
      currentBubble.animation.isDone = false;
      _controlInit = AnimationController(
        vsync: this,
        duration: widget.bubble.animation.duration,
        value: 0.0,);

      _animationTransfer = Tween<double>(
        begin: 0,
        end: -(widget.sizeParent.height-(currentBubble.offset.dy+currentBubble.diameter)+currentBubble.radius+15),
      ).animate(CurvedAnimation(parent: _controlInit,curve: Curves.decelerate))..addStatusListener((status) {
        if(status == AnimationStatus.completed)
        {
          isOutAnimation = false;
          currentBubble = widget.bubble;
          _handleAnimationInit();

        }
      });

      setState(() {
        _controlInit.forward();

      });
    }else
      {
        currentBubble = widget.bubble;
      }
  }

  @override
  Widget build(BuildContext context) {
    if (currentBubble.animation.isDone) {
      return _getScaleDefault();
    } else {
      if(isOutAnimation)
        {
          return AnimatedBuilder(
            animation: _controlInit,
            builder: (BuildContext context, Widget child) {
              return Transform.translate(offset:
              Offset(0,_animationTransfer.value),
                  child: _getScaleDefault());
            },

          );
        }
      switch(currentBubble.animation.typeAnimation)
      {

        case BubbleTypeAnimation.Scale_BounceOut:
          return ScaleTransition(
            scale: _animationBounceOut,
            child: _createChild(),
          );
          break;
        case BubbleTypeAnimation.Transfer_Top:
          return AnimatedBuilder(
            animation: _controlInit,
            builder: (BuildContext context, Widget child) {
              return Transform.translate(offset:
              Offset(0,_animationTransfer.value),
                  child: _getScaleDefault());
            },

          );
          break;
        case BubbleTypeAnimation.None:
          return _getScaleDefault();
          break;
      }
    }

    return _getScaleDefault();
  }

  ScaleTransition _getScaleDefault()
  {
    return ScaleTransition(
      scale: _animationTap,
      child: _createChild(),
    );
  }

  Widget _createChild() {
    return ClipOval(
      child: GestureDetector(
          onTap: () {
            setState(() {
              if (!_controlTap.isAnimating) {
                if(widget.clickListener!=null)
                  widget.clickListener(currentBubble);
                 currentBubble.isSelect = !currentBubble.isSelect;
                _controlTap.reverse();
              }
            });
          },
          child: Container(
            color: currentBubble.isSelect ? Colors.deepPurpleAccent : Color(0xff021C2F),
            // button color
            width: currentBubble.diameter,
            height: currentBubble.diameter,
            child: Center(
                child: Text(
                  currentBubble.title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          )),
    );
  }

  void _handleAnimationInit() {
    if (currentBubble.animation != null) {

      _controlInit = AnimationController(
          vsync: this,
          duration: currentBubble.animation.duration,
          value: 0.0,);

      _animationTransfer = Tween<double>(
        begin: currentBubble.offset.dy+currentBubble.diameter,
        end: 0,
      ).animate(CurvedAnimation(parent: _controlInit,curve: Curves.decelerate));

      if(currentBubble.animation.typeAnimation == BubbleTypeAnimation.Scale_BounceOut) {
        _animationBounceOut = CurvedAnimation(
            parent: _controlInit, curve: currentBubble.animation.interval)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                currentBubble.animation.isDone = true;
              });
            }
          });
      }
      setState(() {
          _controlInit.forward();
        });
    }
  }

  @override
  void dispose() {
    _controlTap.dispose();
    _controlInit.dispose();
    super.dispose();
  }

}
