
import 'package:flutter/material.dart';
import 'package:softwareproject/src/models/custodio_mode.dart';
import 'package:softwareproject/src/providers/empleado_provider.dart';


class CustodioPage extends StatelessWidget {

  final empleado = new EmpleadoProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: empleado.listarCustodio(),
      builder: (context, AsyncSnapshot<List<Custodio>> snapshot) {
        if (snapshot.hasData) {
          return _listado(snapshot.data);
        } else {
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

  Widget _listado(List<Custodio> custodio){
    return ListView.builder(
      itemCount: custodio.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 15.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0) 
          ),
          child: ListTile(
            leading: Icon(Icons.account_circle, size: 35.0),
            title: Row(
              children: <Widget>[
                Text(custodio[index].nombre),
                SizedBox(width: 5.0,),
                Text(custodio[index].apellido)
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Codigo: ' + custodio[index].codCustodio.toString()),
                Text('Telf: ' + custodio[index].telefono.toString()),
                Text('Activo')
              ],
            ),
          ),
        );
      },
    );
  }

}