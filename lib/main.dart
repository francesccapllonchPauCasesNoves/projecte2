//He triat un statelesswidget perque es el predefinit a la pagina Myapp
import 'package:flutter/material.dart';
import 'package:projecte2/screens/home_screen.dart';
import 'package:projecte2/screens/personal_screen.dart';
import 'package:projecte2/screens/widget_screen.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomeScreen(),
        '/personal':(context) => PersonalScreen(),
        '/widget': (context) => WidgetScreen()
        
      },
      initialRoute: '/',
    );
  }
}