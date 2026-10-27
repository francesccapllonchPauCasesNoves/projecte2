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
        body: Center(
          child: Container(
            color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Full name: '+ persona.getName()),
                Text('Email addres: '+ persona.getEmail()),
                Text('Date of birth: '+ persona.getDate()),
                
                ElevatedButton(onPressed: (){
                  Navigator.of(context).pushNamed('/personal');
                }, child: Text('Personal Page')),
                
                ElevatedButton(onPressed: (){
                  Navigator.of(context).pushNamed('/widget');
                }, 
                child: Text('Widget Page'))
              ],
            ),
          ),         
        ),
      );
  }
}