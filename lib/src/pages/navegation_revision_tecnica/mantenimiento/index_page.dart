import 'package:flutter/material.dart';
import 'package:softwareproject/src/models/revision_tecnica_mantenimiento_page.dart';
import 'package:softwareproject/src/providers/revision_tecnica_mantenimiento_provider.dart';

class MantenimientoPage extends StatelessWidget {
  //Accesorio donde se encuentra la peticion http

  @override
  Widget build(BuildContext context) {

    //Obtener la peticio http
    final mantenimientoProviders = new RevisionMantenimientoProvider();

    

    return FutureBuilder(
      future: mantenimientoProviders.getRevisionMantenimiento(),
      //snapshot optiene la respuesta del http
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        
       
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


  
  Widget _card1(RevisionMantenimiento data,BuildContext context){
    
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
                          + "Operador: " + data.nombreOperador + '\n'
                          + "Fecha: " + data.fechaHora),
          ),
          //Ordenar en una fila
          new FlatButton.icon(
            icon: const Icon(Icons.attach_money, size: 12.0, color: Colors.green),
            label: const Text('Revaluo',style: TextStyle(fontSize: 13.0)),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'revaluoRManteni/create', arguments: data);
            }
          )
        ],
      ),
    );


  }

}