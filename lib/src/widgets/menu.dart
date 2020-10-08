import 'package:flutter/material.dart';
import 'package:softwareproject/src/preferencias_usuario/preferencias_usuario.dart';

class MenuWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    
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
              color: Theme.of(context).primaryColor
            ),
          ),
          ListTile(
            title: Text('DEPRECIACION'),
            onTap: () {
              Navigator.pushNamed(context, 'depreciacion');
            },
          ),
          ListTile(
            title: Text('BIEN'),
            onTap: () => Navigator.pushNamed(context, 'indexBien')
          ),
          ListTile(
            title: Text('TRANSFERENCIA'),
            onTap: () => Navigator.pushReplacementNamed(context, 'tranferencia')
          ),
          ListTile(
            title: Text('EMPLEADOS'),
            onTap: () => Navigator.pushNamed(context, 'listarEmpleado'),
          ),
          ListTile(
            title: Text('INGRESO'),
            onTap: () {
                 
            },
          ),
          ListTile(
            title: Text('REVISION TECNICA'),
            onTap: () => Navigator.pushReplacementNamed(context, 'revisionTecnica')
          ),
          ListTile(
            title: Text('BITACORA'),
            onTap: () => Navigator.pushReplacementNamed(context, 'bitacora')
          ),
          ListTile(
            title: Text('USUARIO'),
            onTap: () => Navigator.pushReplacementNamed(context, 'usuario')
          ),
          ListTile(
            title: Text('SALIR'),
            onTap: () {
                Navigator.pushNamed(context, 'login');
            },
          ),
        ],
      ),
    );
  }
}
