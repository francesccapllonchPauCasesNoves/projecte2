import 'package:flutter/material.dart';

class WidgetScreen extends StatefulWidget {
  WidgetScreen({Key? key}) : super(key: key);

  @override
  _WidgetScreenState createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  List<int> items = List<int>.generate(6,(int index)=> index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Screen'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index){
                return Dismissible(
                  background: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20.0), 
                    color: Colors.red,
                    child: Icon(Icons.delete)
                  ),
                  secondaryBackground: Container(
                    color:Colors.green, 
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20.0), 
                    child: Icon(
                      Icons.check,
                      color: Colors.white
                    )
                  ),
                  key: ValueKey<int>(items[index]),
                  onDismissed: (DismissDirection direction){
                    setState(() {
                      items.removeAt(index);
                    });
                  },
                  child: ListTile(
                    title : Text(
                      'Item ${items[index] +1}'
                    ),
                    
                  ),
                  
                );
              }
            ),
    );
  }
}

Widget dissmissableExample(){
  List<int> items = List<int>.generate(5,(int index) => index);
  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (BuildContext context, int index){
      return Dismissible(
        background: Container(color: Colors.red),
        key: ValueKey<int>(items[index]),
        onDismissed: (DismissDirection direction){
        },
        child: ListTile(
          title: Text('Exemple1'),
        ),
      );
    },
  );
}