import 'package:flutter/material.dart';
import 'package:softwareproject/src/models/bitacora_model.dart';
import 'package:softwareproject/src/providers/bitacora_provider.dart';
import 'package:softwareproject/src/widgets/menu.dart';

class BitacoraPage extends StatelessWidget {
  //Accesorio donde se encuentra la peticion http
  BitacoraPage({Key key}) : super(key: key);
  final bitacoraProvider = new BitacoraProvider();
  
  @override
  Widget build(BuildContext context) {
    
    //Obtener la peticio http
    final bitacoraProviders = new BitacoraProvider();

    

    return Scaffold(
      appBar: AppBar(
        title: Text('Bitacora'),
      ),
      drawer: MenuWidget(),

      body: FutureBuilder(
      future: bitacoraProviders.getBitacora(),
      //snapshot optiene la respuesta del http
        builder: (BuildContext context, AsyncSnapshot<List> snapshot){
          //print(snapshot.data);
        
          if (snapshot.hasData){
            return ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context,int index){
                return Container(
                    //Hijo de hijos
                    child: Column(children: <Widget>[
                      _card1(snapshot.data[index],context),
                      SizedBox(height: 10.0),
                    ],),
                );
              }
            );
          }else{
              return Container(
                height: 400.0,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
          }

        }
      ),
    );
    
    
    

    
  }


  Widget _card1(Bitacora bitacora,BuildContext context){
    
    //Container
    var bitacora2 = bitacora;


    return Card(
      //Que tan alta estara la tarjeta en realicion a la sobre que va a proyectar
      //Sombra
      elevation: 3.0,
      //Agregar bordes
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

      //Columna
      child: Column(
        children: <Widget>[
          //Titulo parte superior
          ListTile(
            title: Text(bitacora2.name),
            subtitle: Text(bitacora2.accion),
          ),
          //Ordenar en una fila
          Row(
            children: <Widget>[
              Expanded(
                child: Text(bitacora2.fechaAccion, textAlign: TextAlign.center, textScaleFactor: 0.9,),
              ),
            
            
          ],


          ),
        ],
      ),
    );


  }
}