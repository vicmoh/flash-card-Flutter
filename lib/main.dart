import 'package:flutter/material.dart';
import 'dragable_object/drag_and_drop_list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: new MyHomePage(),
    );
  }//end widget
}//end myApp

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}//end class

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = [
    "test1",
    "test2",
    "test3test3test3test3test3test3test3test3test3test3"
    + "test3test3test3test3test3test3test3test3test3test3"
    + "test3test3test3test3test3test3test3test3test3test3"
    + "test3test3test3test3test3test3test3test3test3test3",
    "test4",
    "test5",
    "test6",
    "test7",
    "test8",
    "test9",
    "test10",
  ];

  Widget cardList(){
    //dragable list
    var dragableList = new DragAndDropList<String>(
      items,
      itemBuilder: (BuildContext context, item){
        return new SizedBox(
          child: Card(
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
            color: Colors.yellow[100],
            child: ListTile(
              title: new Container(
                child: new Text(item, textAlign: TextAlign.center,),
                margin: EdgeInsets.only(top: 15.0, bottom: 15.0, right: 10.0, left: 10.0),
              ),
            ),
          ),
        );
      }, 
      onDragFinish: (int oldIndex, int newIndex) {
        String data = items[oldIndex];
        items.removeAt(oldIndex);
        items.insert(newIndex, data);
      },
      canBeDraggedTo: (one, two) => true,
      dragElevation: 8.0,
    );

    return dragableList;
  }//end cardList

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("QuicKard"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[800],
      body: cardList(),
    );
  }
}//end class