import 'package:flutter/material.dart';
import 'package:softwareproject/src/models/responsable_model.dart';
import 'package:softwareproject/src/providers/empleado_provider.dart';


class ResponsablePage extends StatelessWidget{

  final empleado= new EmpleadoProvider();

  
  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: empleado.listarResponsable(),
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


  Widget _listado(List<Responsable> responsable){
    return ListView.builder(
      itemCount: responsable.length,
      itemBuilder: (context, index){
        return Card(
          elevation: 20.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: ListTile(
            leading : Icon(Icons.account_balance, size: 45.0),
            title: Row(
              children: <Widget>[
                Text(responsable[index].nombre),
                SizedBox(width:5.0),
                Text(responsable[index].apellido),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Codigo: ' + responsable[index].codResponsable.toString()),
                Text('Telf: ' + responsable[index].telefono.toString()),
                ],
            ),
          ),
        );
      },
    );
  }
}