import 'package:flutter/material.dart';
import 'package:softwareproject/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:softwareproject/src/providers/activoFijo_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ActivoFijoProvider activoFijoProvider = new ActivoFijoProvider();
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Software'),
      ),
      body: Center(child: Text('hola mundo')),
      drawer: menu()
    );
  }


  // MENU
  Widget menu(){
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.only(top:30),
            child: Column(
              children:<Widget>[
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.blueGrey[100],
                  child: Icon(Icons.person, size: 60.0, color: Colors.black,)
                ),
                SizedBox(height: 10),
                Text(prefs.nombre)
              ], 
            ),
            decoration: BoxDecoration(
              color: Colors.blue
            ),
          ),
          ListTile(
            title: Text('DEPRESION'),
            onTap: () {
            },
          ),
          ListTile(
            title: Text('BIEN'),
            onTap: () {
            },
          ),
          ListTile(
            title: Text('TRANSFERENCIA'),
            onTap: () {
                
            },
          ),
          ListTile(
            title: Text('EMPLEADOS'),
            onTap: () {
                
            },
          ),
          ListTile(
            title: Text('INGRESO'),
            onTap: () {
                
            },
          ),
          ListTile(
            title: Text('REVISION TECNICA'),
            onTap: () {
                
            },
          ),
          ListTile(
            title: Text('BITACORA'),
            onTap: () {
                
            },
          ),
          ListTile(
            title: Text('USUARIO'),
            onTap: () {
                
            },
          ),
          ListTile(
            title: Text('SALIR'),
            onTap: () {
                
            },
          ),
        ],
      ),
    );
  }


}