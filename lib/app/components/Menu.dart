
import 'package:controle_estacionamento/app/screens/home_screen.dart';
import 'package:controle_estacionamento/app/screens/register_screen.dart';
import 'package:flutter/material.dart';


Widget Menu(BuildContext context){
  return Drawer(
      child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              margin: EdgeInsets.only(bottom: 10.0),
              currentAccountPicture: Container(
                // decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                    // image: DecorationImage(
                    //     fit: BoxFit.fill,
                    //
                    //     // image:
                    //     // NetworkImage("https://www.pngall.com/wp-content/uploads/5/Profile-PNG-File.png"))),
              ),
              accountName: new Container(
                  child: Text(
                    'Cleiton',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  )),
              accountEmail: new Container(
                  child: Text(
                    'cleiton@cleiton.com',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            ListTile(
              title: Text("Inicio"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),);
              },
            ),
            ListTile(
              title: Text("Cadastrar"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),);
              },
            ),
          ]
      )
  );
}