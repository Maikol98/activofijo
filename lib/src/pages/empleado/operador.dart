import 'package:flutter/material.dart';
import 'package:softwareproject/src/models/operador_model.dart';
import 'package:softwareproject/src/providers/empleado_provider.dart';


class OperadorPage extends StatelessWidget{

  final empleado= new EmpleadoProvider();

  
  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: empleado.listarOperador(),
      builder: (context, AsyncSnapshot snapshot){
        if (snapshot.hasData){
          return _listado(snapshot.data);
        }else{
          return Container(
            height: 400.00,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }


  Widget _listado(List<Operador> operador){
    return ListView.builder(
      itemCount: operador.length,
      itemBuilder: (context, index){
        return Card(
          elevation: 20.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: ListTile(
            leading : Icon(Icons.person, size: 45.0),
            title: Row(
              children: <Widget>[
              Text(operador[index].nombre),
              SizedBox(width:5.0),
              Text(operador[index].apellido),
              ],
            ),
            subtitle: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Codigo: ' + operador[index].codOperador.toString()),
                Text('Telf: ' + operador[index].telefono.toString()),
                Text('Gmail: ' + operador[index].gmail.toString()),
              ],
            ),
          ),
        );
      },
    );
  }
}