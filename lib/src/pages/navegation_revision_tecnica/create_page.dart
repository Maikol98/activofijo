import 'package:flutter/material.dart';
import 'package:softwareproject/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:softwareproject/src/providers/revision_tecnica_provider.dart';
import 'package:softwareproject/src/widgets/menu.dart';

class CreateRevisionTecnicaPage extends StatefulWidget {
  @override
  _CreateTranferenciaState createState() => _CreateTranferenciaState();
}

class _CreateTranferenciaState extends State<CreateRevisionTecnicaPage> {
 

  String _custodio = '';
  String _operador = '';
  String _bien = '';

  final tranferenciaProvider = new RevisionProvider();  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Revision Tecnica'),
      ),
      drawer: MenuWidget(),
      body: ListView(
        //Crear padding
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        //Input
        children: <Widget>[
          
          //Bien
          getBienDropdown(),
          Divider(),

          //Custodio
          getCustodioDropdown(),
          Divider(),

          //Operador
          getOperadorDropdown(),
          Divider(),

          //Boton para enviar la peticion
          RaisedButton(
            disabledColor: Colors.amber,
            child: Text("Guardar", style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),),
            splashColor: Colors.amber,
            color: Colors.blueAccent,
            onPressed: () async {

              //Sacar el nombre del Usuario
              final prefs = new PreferenciasUsuario();

              //Falta agregar las validaciones

              //Agregar los datos a un Map, para enviarlo mas rapido
              Map<String,String> datos = {
                'custodio'        : _custodio,
                'operador'        : _operador,
                'bien'            : _bien,
                'idUsuario'       : prefs.codigoUsuario.toString()
              };

              (await tranferenciaProvider.postDatos(datos) == 1) ? 
                          // Llamar al providers, para poder guardar los datos a la DB
                          Navigator.pushReplacementNamed(context, 'revisionTecnica') : print('Error');
                           

            },
          ),
        ],
      ),
    );
  }


  //Bien
  Widget getBienDropdown(){
    return FutureBuilder(
      future: tranferenciaProvider.getBien(),
      //snapshot optiene la respuesta del http
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        //print(snapshot.data);
       
        if (snapshot.hasData){
            return Row(
              
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                //Expandir al maximo
                Expanded(
                  child: DropdownButton(
                    
                    //Valor es la opcion seleccionada
                    value: _bien,
                    items: _agregarDatosBien(snapshot.data),
                    //Actualizar el Dropdown y poner el texto seleccionado
                    onChanged: (opt) {
                      setState(() {
                        _bien = opt;
                      });
                    },
                  ),
                )
              ],
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
  List<DropdownMenuItem<String>> _agregarDatosBien(data) {
    List<DropdownMenuItem<String>> lista = new List();
    
    lista.add(DropdownMenuItem(
      child: Text('Seleccione un bien'),
      value: '',
    ));

    data.forEach((dato) {
      lista.add(DropdownMenuItem(
        child: Text(dato.nombre),
        value: dato.codBien,
      ));
    });

    return lista;
  }

  //Operador
  Widget getOperadorDropdown(){
    return FutureBuilder(
      future: tranferenciaProvider.getOperador(),
      //snapshot optiene la respuesta del http
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        //print(snapshot.data);
       
        if (snapshot.hasData){
            return Row(
              
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                //Expandir al maximo
                Expanded(
                  child: DropdownButton(
                    
                    //Valor es la opcion seleccionada
                    value: _operador,
                    items: _agregarDatosOperador(snapshot.data),
                    //Actualizar el Dropdown y poner el texto seleccionado
                    onChanged: (opt) {
                      setState(() {
                        _operador = opt;
                      });
                    },
                  ),
                )
              ],
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
  List<DropdownMenuItem<String>> _agregarDatosOperador(data) {
    List<DropdownMenuItem<String>> lista = new List();
    
    lista.add(DropdownMenuItem(
      child: Text('Seleccione un operador'),
      value: '',
    ));

    data.forEach((dato) {
      lista.add(DropdownMenuItem(
        child: Text(dato.nombre),
        value: dato.codOperador.toString(),
      ));
    });

    return lista;
  }
  
  //Custodio
  Widget getCustodioDropdown(){
    return FutureBuilder(
      future: tranferenciaProvider.getCustodio(),
      //snapshot optiene la respuesta del http
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        //print(snapshot.data);
       
        if (snapshot.hasData){
            return Row(
              
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                //Expandir al maximo
                Expanded(
                  child: DropdownButton(
                    
                    //Valor es la opcion seleccionada
                    value: _custodio,
                    items: _agregarDatosCustodio(snapshot.data),
                    //Actualizar el Dropdown y poner el texto seleccionado
                    onChanged: (opt) {
                      setState(() {
                        _custodio = opt;
                      });
                    },
                  ),
                )
              ],
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
  List<DropdownMenuItem<String>> _agregarDatosCustodio(data) {
    List<DropdownMenuItem<String>> lista = new List();
    
    lista.add(DropdownMenuItem(
      child: Text('Seleccione un custodio'),
      value: '',
    ));

    data.forEach((dato) {
      lista.add(DropdownMenuItem(
        child: Text(dato.nombre),
        value: dato.codCustodio.toString(),
      ));
    });

    return lista;
  }

}
