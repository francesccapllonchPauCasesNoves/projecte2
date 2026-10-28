//He realitzat un statefull widget ja que aquest wiget anira cambiant perque va desplagant informacio actualitzada

import 'package:flutter/material.dart';
import 'package:projecte2/models/persona.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

Persona personaActual = Persona(
  'Raul', 
  'Tomillo Berja', 
  'rtb@gmail.com', 
  'password', 
  DateTime(2007,07,22));  
  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('DevProfile M3'),
          backgroundColor: Colors.indigoAccent,
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              child: Column(
                children: [
                  Text('Full name: '+ personaActual.getName()),
                  Divider(),
                  Text('Email addres: '+ personaActual.getEmail()),
                  Divider(),
                  Text('Date of birth: '+ personaActual.getDate()),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: ()async{
                        final personaEditada = await Navigator.of(context).pushNamed('/personal',arguments: personaActual);
                        if(personaEditada != null){
                          setState(() {
                            personaActual = personaEditada as Persona;
                          });
                        }
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