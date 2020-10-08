
import 'package:flutter/material.dart';
import 'package:softwareproject/src/models/bien_model.dart';
import 'package:softwareproject/src/providers/bien_provider.dart';
import 'package:softwareproject/src/widgets/menu.dart';

class IndexBienPage extends StatelessWidget {
  
  final BienProvider bienProvider = new BienProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienes'),
        centerTitle: true,
      ),
      drawer: MenuWidget(),
      body: _listado(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){}
      ),
    );
  }

  Widget _listado(){
    return FutureBuilder(
      future: bienProvider.bienIndex(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return _tarjetas(snapshot.data);
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


  Widget _tarjetas(List<Bien> bien){
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: bien.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 20.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0) 
          ),
          child: ListTile(
            trailing: Icon(Icons.assignment),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Codigo: ' + bien[index].codBien),
                Text('Nombre: ' + bien[index].nombre),
                Text('Valor Compra: ' + bien[index].valorCompra )
              ],
            ),
            subtitle: Text(
              bien[index].fechaAdquisicion, 
              textAlign: TextAlign.center,
            )
              
          )
        );
      },
    );
  }


}