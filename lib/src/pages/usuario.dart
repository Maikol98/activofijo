import 'package:flutter/material.dart';
import 'package:softwareproject/src/models/usuarios.dart';
import 'package:softwareproject/src/providers/usuario_provider.dart';
import 'package:softwareproject/src/widgets/menu.dart';

class UsuarioPage extends StatelessWidget {
  
  final usuarioProvider = new UsuarioProvider();
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: Text('Usuario'),
      ),
      drawer: MenuWidget(),
      body: listado(),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, 'crearusuario');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget listado(){
    return FutureBuilder(
      future: usuarioProvider.usuarioIndex(),
      builder: (BuildContext context, AsyncSnapshot<List<Respuesta>> snapshot) {
        if (snapshot.hasData) {
            return _tarjetas(snapshot.data);
          }else{
            return Container(
              height: 400.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
      },
    );
  }

  Widget _tarjetas(List<Respuesta> usuarios){
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: usuarios.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 20.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.account_circle, size: 40.0,color: Theme.of(context).primaryColor,),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Nombre: ' + usuarios[index].name),
                    Text('Email: ' + usuarios[index].email)
                  ],
                ),
              ),
              Divider(thickness: 1.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.edit),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.pushNamed(context, 'editusuario');
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                            title: Text('¿Seguro que desea Realizar esta accion?'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text('Con esta accion eliminara al usuario del sistema'),
                              ],
                            ),
                            actions: <Widget>[
                              Row(
                                children: <Widget>[
                                  FlatButton(
                                    child: Text('Cancelar'),
                                    onPressed: ()=>Navigator.of(context).pop(),
                                  ),
                                  FlatButton(
                                    child: Text('Eliminar'),
                                    onPressed: () {
                                      usuarioProvider.deleteUsuario(usuarios[index].id);
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              )
                            ]
                          );
                        },
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

}