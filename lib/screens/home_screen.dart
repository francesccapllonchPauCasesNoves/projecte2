//He realitzat un statefull widget ja que aquest wiget anira cambiant perque va desplagant informacio actualitzada

import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  
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
                Text('Full name: '+ 'Persona.nom'),
                Text('Email addres: '+ 'Persona.email'),
                Text('Date of birth: '+ 'Persona.birth'),
                ElevatedButton(onPressed: (){

                }, child: Text('Personal Page')),
                ElevatedButton(onPressed: (){}, child: Text('Widget Page'))
              ],
            ),
          ),         
        ),
      );
  }
}