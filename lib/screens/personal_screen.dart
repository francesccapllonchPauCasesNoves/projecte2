import 'package:flutter/material.dart';
import 'package:projecte2/models/persona.dart';

class PersonalScreen extends StatefulWidget {
  PersonalScreen({Key? key}) : super(key: key);

  @override
  _PersonalScreenState createState() => _PersonalScreenState();
  
}

class _PersonalScreenState extends State<PersonalScreen> {
  late Persona persona;
  late TextEditingController _nameController;
  late TextEditingController _lastController;
  late TextEditingController _emailController;
  late TextEditingController _dateController;
  late TextEditingController _passwordController;

  bool _isInitalized = false;

  
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    if(!_isInitalized){
      persona = ModalRoute.of(context)!.settings.arguments as Persona;
      _nameController = TextEditingController(text: persona.getName());
      _lastController = TextEditingController(text: persona.getLast());
      _emailController = TextEditingController(text: persona.getEmail());
      _dateController = TextEditingController(text: persona.getDate());
      _passwordController = TextEditingController(text: persona.getPassword());

      _isInitalized = true;
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_lastController.text+' - Edit Profile'),
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

              if(_nameController.text.isNotEmpty && 
              _lastController.text.isNotEmpty && 
              _emailController.text.isNotEmpty && 
              _passwordController.text.isNotEmpty
              ){

                final Persona personaModificada = Persona(
                  _nameController.text, 
                  _lastController.text, 
                  _emailController.text, 
                  _passwordController.text,
                  persona.getRawDate()
                  );

                Navigator.pop(context, personaModificada);              
              }else{
                print('Error, camp or camps empty '); 
              }
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
      controller: _nameController,
      decoration: InputDecoration(
        labelText: 'Name: ',
        helperText: 'Your actual name is: '+_nameController.text,
      ),
      onChanged: (value) => _nameController.text = value,
    );

  }

  _editLast(){
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      controller: _lastController,
      decoration: InputDecoration(
        labelText: 'Last Names: ',
        helperText: 'Your actual last names are: '+_lastController.text 
      ),
      onChanged: (value) => _lastController.text = value,
    );

  }

  _editEmail(){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.sentences,
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email: ',
        helperText: 'Your actual email is: '+_emailController.text
      ),
      onChanged: (value) => _emailController.text = value
    );

  }

  _editDate(){
    return TextField(
      keyboardType: TextInputType.datetime,
      textCapitalization: TextCapitalization.sentences,
      controller: _dateController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Date: ',
        helperText: 'Your actual date is: '+_dateController.text 
      ),
      onChanged: (value) => _dateController.text = value,
    );

  }

  _viewPassword(){
    return TextField(
      obscureText: true,
      textCapitalization: TextCapitalization.sentences,
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: 'Password: ',
        helperText: 'Your actual password is: '+_passwordController.text
      ),
      onChanged: (value) => _passwordController.text = value
    );
  }
}