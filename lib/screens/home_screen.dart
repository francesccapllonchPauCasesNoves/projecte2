//He realitzat un statefull widget ja que aquest wiget anira cambiant perque va desplagant informacio actualitzada

import 'package:flutter/material.dart';
import 'package:projecte2/models/persona.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
Persona persona = new Persona();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('DevProfile M3')
        ),
        body: Container(
          color: Colors.amber,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              child: Column(
                children: [
                  Text('Full name: '+ persona.getName()),
                  Divider(),
                  Text('Email addres: '+ persona.getEmail()),
                  Divider(),
                  Text('Date of birth: '+ persona.getDate()),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).pushNamed('/personal');
                      }, child: Text('Personal Page')),
                      
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).pushNamed('/widget');
                      }, 
                      child: Text('Widget Page'))
                        ]
                  ),
                ],
              ),
            ),         
          ),
        ),
      );
  }
}