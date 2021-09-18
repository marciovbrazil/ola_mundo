import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ola_mundo/app_controller.dart';

class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset('assets/images/autor.jpg')
              ),
              accountName: Text('Marcio Vieira'), 
              accountEmail: Text('mlovieir@gmail.com'),
              ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Início'),
              subtitle: Text('Subtitulo do Inicio'),
              onTap: () {
                print('Inicio');
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              subtitle: Text('Sair do Applicativo'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            )

          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Página Principal $counter'),
        actions: [CustomSwitch(),]),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contador $counter'),
            Container(height: 10),
            CustomSwitch(),
            Container(height: 50),            
            Text('Testando'),
            Container(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50, 
                  width: 50, 
                  color: Colors.black,
                ),
                Container(
                  height: 50, 
                  width: 50, 
                  color: Colors.black,
                ),
                Container(
                  height: 50, 
                  width: 50, 
                  color: Colors.black,
                ),
              ]),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
             onPressed: (){setState(() {
                counter++;
              });}
          ),
    );
  }

}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(value: AppController.instance.isDarkThemme, 
        onChanged: (value) {
          AppController.instance.changeTheme();
        });
  }
}