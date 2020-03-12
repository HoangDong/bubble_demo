import 'package:demobubble/bubble/bubble.dart';
import 'package:demobubble/bubble/bubble_animation.dart';
import 'package:demobubble/bubble/bubble_board_view.dart';
import 'package:demobubble/data_utils.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int step=0;
  List<Bubble> listBubble = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints){
       var view =new BubbleBoardView(constraints.biggest,listBubble,clickListener: (bubble){
         print(bubble.title);
       },);
        return Column(
          children: <Widget>[
            Expanded(child: view),
            Container(
              width: double.infinity,
              color: Colors.green,
              child: MaterialButton(height: 70,
                onPressed: () {
                Offset offset = Offset(constraints.biggest.width, constraints.biggest.height);
                  step+=1;
                setState(() {
                  if(step==1)
                    listBubble = DataUtils.getList1(offset);
                  else if(step ==2)
                    listBubble = DataUtils.getList2(offset);
                  else if(step ==3)
                    listBubble = DataUtils.getList3(offset);
                  else if(step ==4)
                    listBubble = DataUtils.getList4(offset);
                  else
                    {
                      listBubble =[];
                      step= 0;
                    }
                });
                },
                child: Text("Next", style: TextStyle(color: Colors.black,fontSize: 22),),),
            )
          ],
        );
      }),
    );
  }

}
