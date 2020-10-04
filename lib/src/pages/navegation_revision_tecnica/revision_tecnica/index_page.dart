import 'package:flutter/material.dart';
import 'package:softwareproject/src/models/revision_tecnica_model.dart';
import 'package:softwareproject/src/providers/revision_tecnica_provider.dart';

class RevisionTecnicaPage extends StatelessWidget {
  //Accesorio donde se encuentra la peticion http

  @override
  Widget build(BuildContext context) {

    //Obtener la peticio http
    final mantenimientoProviders = new RevisionProvider();

    

    return FutureBuilder(
      future: mantenimientoProviders.getRevision(),
      //snapshot optiene la respuesta del http
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        //print(snapshot.data);
       
        if (snapshot.hasData){
            return Scaffold(
              body: ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context,int index){
                  return Container(
                      //Hijo de hijos
                      child: Column(children: <Widget>[
                        _card1(snapshot.data[index],context),
                        SizedBox(height: 30.0),
                      ],),
                  );
                  
                }
                
              ),
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
    ); 
    
    
    
    
  }


  
  Widget _card1(Revision data,BuildContext context){
    
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
            subtitle: Text("Codigo" + data.codBien + '\n'
                          + "Nombre Bien: " + data.nombreBien + '\n' 
                          + "Custodio: " + data.nombreCustodio + '\n'
                          + "Operador: " + data.nombreOperador + '\n'),
          ),
          //Ordenar en una fila
          Row(
            children: <Widget>[
              Expanded(
                child: Text(data.fechaHora, textAlign: TextAlign.center, textScaleFactor: 0.9,),
              ),
            
            
          ],


          ),
        ],
      ),
    );


  }

}