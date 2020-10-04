import 'package:flutter/material.dart';
import 'package:softwareproject/src/models/revision_tecnica_model.dart';
import 'package:softwareproject/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:softwareproject/src/providers/revaluo_provider.dart';
import 'package:softwareproject/src/widgets/menu.dart';

class CreateRevaluoRevisionPage extends StatefulWidget {
  @override
  _CreateTranferenciaState createState() => _CreateTranferenciaState();
}

class _CreateTranferenciaState extends State<CreateRevaluoRevisionPage> {
  
  String _monto = '';
  String _estado = '';
  String _descripcion = '';

  final bajaProvider = new RevaluoProvider();  

  @override
  Widget build(BuildContext context) {

    final Revision revision = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Revaluo'),
      ),
      drawer: MenuWidget(),
      body: ListView(
        //Crear padding
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        //Input
        children: <Widget>[
          
          //Estado
          _inputEstado(),
          Divider(),

          //Monto
          _inputMonto(),
          Divider(),

          //Numero Descripcion
          _inputDescripcion(),
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
                'monto'           : _monto,
                'estado'          : _estado,
                'descripcion'     : _descripcion,
                'idRevision'      : revision.nroRevision.toString(),
                'idUsuario'       : prefs.codigoUsuario.toString(),
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

    //Monto
  Widget _inputMonto() {
    return TextField(
      //Decoracion del input
      decoration: InputDecoration(
          //Agregar Borde
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Monto',
          labelText: 'Monto',
          ),
      //Obtener valor del texto a la variable _nombre, valor es el valor que tiene el texto
      onChanged: (valor) => setState(() {
            _monto = valor;
      }));
  }

  //Estado
  Widget _inputEstado() {
    return TextField(
      //Decoracion del input
      decoration: InputDecoration(
          //Agregar Borde
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Estado',
          labelText: 'Estado',
          ),
      //Obtener valor del texto a la variable _nombre, valor es el valor que tiene el texto
      onChanged: (valor) => setState(() {
            _estado = valor;
      }));
  }

  //Descripcion
  Widget _inputDescripcion() {
    return TextField(
      //Decoracion del input
      decoration: InputDecoration(
          //Agregar Borde
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Descripcion',
          labelText: 'Descripcion',
          ),
      //Obtener valor del texto a la variable _nombre, valor es el valor que tiene el texto
      onChanged: (valor) => setState(() {
            _descripcion = valor;
      }));
  }
}
