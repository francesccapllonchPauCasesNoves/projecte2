//He realitzat un statefull widget ja que aquest wiget anira cambiant perque va desplagant 
//informacio actualitzada

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
        backgroundColor: Color.fromARGB(255, 234, 243, 252),
        appBar: AppBar(
          title: Text('DevProfile M3'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(           
            children: [
              SizedBox(),
              Container(
                child: Column(
                  children: [
                  Text('Full name: '+ personaActual.getName()),
                  Text('Email addres: '+ personaActual.getEmail()),
                  Text('Date of birth: '+ personaActual.getDate()),
                  ],
                ),
              ),
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
            ]
          ),
        ),
      );
  }
}