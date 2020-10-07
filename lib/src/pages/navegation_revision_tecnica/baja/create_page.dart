import 'package:flutter/material.dart';
import 'package:softwareproject/src/models/revision_tecnica_model.dart';
import 'package:softwareproject/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:softwareproject/src/providers/baja_provider.dart';
import 'package:softwareproject/src/widgets/menu.dart';

class CreateBajaPage extends StatefulWidget {
  @override
  _CreateTranferenciaState createState() => _CreateTranferenciaState();
}

class _CreateTranferenciaState extends State<CreateBajaPage> {
 

  String _descripcion = '';

  final bajaProvider = new BajaProvider();  

  @override
  Widget build(BuildContext context) {

    final Revision revision = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dar de Baja'),
      ),
      drawer: MenuWidget(),
      body: ListView(
        //Crear padding
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        //Input
        children: <Widget>[
          
          //Numero Tranferencia
          _inputNumeroTraferencia(),
          Divider(),
          
          //Boton para enviar la peticion
          RaisedButton(
            disabledColor: Colors.amber,
            child: Text("Guardar", style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),),
            splashColor: Colors.amber,
            color: Colors.blueAccent,
            onPressed: () async {

              //Sacar el nombre del Usuario
              final prefs = new PreferenciasUsuario();

              //Falta agregar las validaciones

              //Agregar los datos a un Map, para enviarlo mas rapido
              Map<String,String> datos = {
                'descripcion'       : _descripcion,
                'nroRevision'       : revision.nroRevision.toString(),
                'idUsuario'         : prefs.codigoUsuario.toString()
              };
              (await bajaProvider.postDatos(datos) == 1) ? 
                          // Llamar al providers, para poder guardar los datos a la DB
                          Navigator.pushReplacementNamed(context, 'revisionTecnica') : print('Error');
                           

            },
          ),
        ],
      ),
    );
  }


  //Descripcion
  Widget _inputNumeroTraferencia() {
    return TextField(
      //Decoracion del input
      decoration: InputDecoration(
          //Agregar Borde
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Descripcion del Problema',
          labelText: 'Descripcion del Problema',
          ),
      //Obtener valor del texto a la variable _nombre, valor es el valor que tiene el texto
      onChanged: (valor) => setState(() {
            _descripcion = valor;
      }));
  }
}
