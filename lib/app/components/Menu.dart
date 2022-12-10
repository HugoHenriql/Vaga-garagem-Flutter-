import 'package:controle_estacionamento/app/screens/home_screen.dart';
import 'package:controle_estacionamento/app/screens/register_screen.dart';
import 'package:flutter/material.dart';

Widget Menu(BuildContext context) {
  return Drawer(
      child: ListView(children: <Widget>[
    UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: Colors.red),
      margin: EdgeInsets.only(bottom: 10.0),
      currentAccountPicture: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green,
          image: const DecorationImage(
            image: NetworkImage(
                'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      accountName: new Container(
          child: Text(
        'Hugo Henrique',//nothing Text
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      )),
      accountEmail: new Container(
          child: Text(
        'hugohenrique',
        style: TextStyle(color: Colors.white),
      )),
    ),
    ListTile(
      title: Text("Veículos no estacionamento"),
      leading: const Icon(Icons.car_rental),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      },
    ),
    ListTile(
      title: Text("Estacionar"),
      leading: const Icon(Icons.local_car_wash),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterPage()),
        );
      },
    ),
  ]));
}
