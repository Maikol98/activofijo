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

    

    return FutureBuilder(
      future: bitacoraProviders.getBitacora(),
      //snapshot optiene la respuesta del http
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        //print(snapshot.data);
       
        if (snapshot.hasData){
            return Scaffold(
              
              appBar: AppBar(
                title: Text('Bitacora'),
              ),
              drawer: MenuWidget(),
              
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


  Widget _card1(Bitacora bitacora,BuildContext context){
    
    //Container
    var bitacora2 = bitacora;
    final card = Container(
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(10.0),
              //Hijo
              child: Column(
                children: <Widget>[
                  Text('Categoria: ' + bitacora2.name),
                  Text('Empresa: ' + bitacora2.email),
                  Text('Nombre: ' + bitacora2.accion),
                  Text('Precio: ' + bitacora2.fechaAccion),
                ],
              ),
              //child: Text('Nombre: ' + bitacora2.nombre),
              
          )
        ],
      ),
    );

    final decorationCard = Container(
        //Decoracion, propiedades del contenedor
        decoration: BoxDecoration(
            //Decoracion del contenedor
            //Color del container
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  //Color al shadow box
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  //Posicion de las sombras, con un plano cartesiano
                  offset: Offset(2.0, 10.0))
            ]),
        //Contenedor, ClipRRect = corta cuaquier cosa que se encuentre fuera del contenedor
        child: ClipRRect(
          child: card,
        ),

      );

    //ClickCard
    return GestureDetector(
      child: decorationCard,
      onTap: (){
        //Cambiar de pestaña y enviar como argumento los accesorios
        Navigator.pushNamed(context, 'accesorio', arguments: bitacora);
      },
    );

  }
}