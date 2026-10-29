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
      ),
      body: Column(
        children: [
          Divider(),
          Center( child: Text('Disponible Tasks')),
          Divider(),
          Expanded(
            child: ReorderableListView.builder(
              itemCount: items.length,
              onReorderItem: (int oldIndex, int newIndex){
                setState(() {
                  
                  final item = items.removeAt(oldIndex);
                  items.insert(newIndex, item);
                });
              } ,
              itemBuilder: (BuildContext context, int index){
                final item = items[index];

                return Dismissible(
                  
                  key: ValueKey<int>(item),

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

                  onDismissed: (DismissDirection direction){
                    final seleccionat = item;
                      items.remove(item);
                        setState(() {
                          if(direction == DismissDirection.endToStart){
                            itemsDone.add(seleccionat);
                          }
                        });
                  },

                  child: ListTile(
                    title : Text(
                      'Item ${items[index] +1}'
                    ),
                    trailing: Icon(Icons.drag_handle), 
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

                  //bloqueja la direccio de esquerra a dreta
                  direction: DismissDirection.startToEnd,
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
                    trailing: Icon(Icons.cancel),
                    leading: Icon(Icons.check_circle_outline),
                    
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