import 'package:flutter/material.dart';
import 'package:softwareproject/src/models/tranferencia_model.dart';
import 'package:softwareproject/src/providers/tranferencia_provider.dart';
import 'package:softwareproject/src/widgets/menu.dart';

class TranferenciaPage extends StatelessWidget {
  //Accesorio donde se encuentra la peticion http
  TranferenciaPage({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    //Obtener la peticio http
    final tranferenciaProvider = new TranferenciaProvider();

    return Scaffold(
      appBar: AppBar(
        title: Text('Tranferencia'),
      ),
      drawer: MenuWidget(),
      body: FutureBuilder(
        future: tranferenciaProvider.getTranferencia(),
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

      floatingActionButton:FloatingActionButton(
        child: Icon( Icons.add ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'tranferencia/create');
        }
      )
    );
    
  }


  Widget _card1(Tranferencia tranferencia,BuildContext context){
    
    //Container
    var data = tranferencia;


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
            title: Text("Numero Traferencia: " + data.nroTranferencia.toString()),
            subtitle: Text("Custorio Origen: " + data.nombrec1 + '\n' + "Responsable: " + data.nombrer),
          ),
          //Ordenar en una fila
          Row(
            children: <Widget>[
              Expanded(
                child: Text(data.fechaTranferencia, textAlign: TextAlign.center, textScaleFactor: 0.9,),
              ),
            
            
          ],


          ),
        ],
      ),
    );


  }
}