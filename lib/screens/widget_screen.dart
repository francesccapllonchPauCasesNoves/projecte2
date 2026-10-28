import 'package:flutter/material.dart';

class WidgetScreen extends StatefulWidget {
  WidgetScreen({Key? key}) : super(key: key);

  @override
  _WidgetScreenState createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  List<int> items = List<int>.generate(6,(int index)=> index);
  List<int> itemsDone = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Screen'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Divider(),
          Center( child: Text('Disponible Tasks')),
          Divider(),
          Expanded(
            child: ListView.builder(
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
                    final seleccionat = items[index];
                    if(direction == DismissDirection.endToStart){
                      setState(() {
                        itemsDone.add(seleccionat);
                        items.removeAt(index);
                      });
                    }
                  },
                  child: ListTile(
                    title : Text(
                      'Item ${items[index] +1}'
                    ),
                    
                  ),
                  
                );
              }
            ),
          ),
          Divider(),
          Center( child: Text('Done Tasks')),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: itemsDone.length,
              itemBuilder: (BuildContext context, int index){
                return Dismissible(
                  background: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20.0), 
                    color: Colors.red,
                    child: Icon(Icons.cancel)
                  ),
                  
                  key: ValueKey<int>(itemsDone[index]),
                  onDismissed: (DismissDirection direction){
                    final seleccionat = itemsDone[index];
                    if(direction == DismissDirection.startToEnd){
                      setState(() {
                        items.add(seleccionat);
                        itemsDone.removeAt(index);
                      });
                    }
                  },
                  child: ListTile(
                    title : Text(
                      'Item ${itemsDone[index] +1}'
                    ),
                    
                  ),
                  
                );
              }
            ),
          ),
        ]
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