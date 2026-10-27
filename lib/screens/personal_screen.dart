import 'package:flutter/material.dart';
import 'package:projecte2/models/persona.dart';

class PersonalScreen extends StatefulWidget {
  PersonalScreen({Key? key}) : super(key: key);

  @override
  _PersonalScreenState createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  late String _name;
  late String _last;
  late String _email;
  late DateTime _date;
  Persona p = new Persona();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(p.getFullName()+ ' - Edit Profile'),
      ), 
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        children: [
          _editName(),
          Divider(),
          _editLast(),
          Divider(),
          _editEmail(),
          Divider(),
          _editDate(),
          Divider(),
          _viewPassword(),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop(updatedPersona());
              }, child: Text('Save and return'))
            ],
          ),
        ],
      ),
    );
  }


   _editName(){
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Name: ',
        helperText: 'Your actual name is: '+p.getName()
      ),
      onChanged: (value) => _name = value,
    );

  }

  _editLast(){
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Last Names: ',
        helperText: 'Your actual last names are: '+p.getLast() 
      ),
      onChanged: (value) => _last = value,
    );

  }

  _editEmail(){
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Email: ',
        helperText: 'Your actual email is: '+p.getEmail() 
      ),
      onChanged: (value) => _email = value
    );

  }

  _editDate(){
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Date: ',
        helperText: 'Your actual date is: '+p.getDate() 
      ),
      onChanged: (value) => _date = value as DateTime
    );

  }

  _viewPassword(){
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Password: ',
        helperText: 'Your actual password is: '+p.getPassword() 
      ),
      onChanged: (value) => _email = value
    );
  }

  updatedPersona(){
    if(_name.isEmpty || _last.isEmpty || _email.isEmpty)
    p.setName(_name);
    p.setLast(_last);
    p.setEmail(_email);
    //p.setDate(_date);
  }
}