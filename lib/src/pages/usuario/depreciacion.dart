import 'package:flutter/material.dart';
import 'package:softwareproject/src/models/Depresiacion.dart';
import 'package:softwareproject/src/providers/depreciacion_provider.dart';
import 'package:softwareproject/src/widgets/menu.dart';

class DepreciacionPage extends StatelessWidget {

  final DepreciacionProvider depreciacionProvider = new DepreciacionProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drepeciacion'),
        centerTitle: true,
      ),
      drawer: MenuWidget(),
      body:_listado()
    );
  }

  Widget _listado(){
    return FutureBuilder(
      future: depreciacionProvider.depreciacionIndex(),
      builder: (BuildContext context, AsyncSnapshot<List<Depreciacion>> snapshot){
        if (snapshot.hasData) {
          return _tarjetas(snapshot.data);
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
            ),
          );
        }
      }
    );
  }

  Widget _tarjetas(List<Depreciacion> depreciacion){
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: depreciacion.length,
      itemBuilder: (BuildContext context, int index){
        return Card(
          elevation: 20.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.account_balance_wallet),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(depreciacion[index].nombre),
                    Expanded( child: Container(),),
                    Text(depreciacion[index].depreciacion),
                  ],
                ),
                subtitle: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(depreciacion[index].codBien),
                        Expanded(child: Container()),
                        Text(depreciacion[index].descripcion),
                      ],
                    ),
                    Text(depreciacion[index].fechaAdquisicion),
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }

}