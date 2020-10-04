import 'package:flutter/material.dart';
import 'package:softwareproject/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:softwareproject/src/providers/tranferencia_provider.dart';
import 'package:softwareproject/src/widgets/menu.dart';

class CreateTranferenciaPage extends StatefulWidget {
  @override
  _CreateTranferenciaState createState() => _CreateTranferenciaState();
}

class _CreateTranferenciaState extends State<CreateTranferenciaPage> {
 

  String _custodioOrigen = '';
  String _custodioDestino = '';
  String _nroTranferencia = '';
  String _responsable = '';
  String _bien = '';
  String _fecha = '';

  TextEditingController _inputFieldDateController = new TextEditingController();


  final tranferenciaProvider = new TranferenciaProvider();  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Tranferencia'),
      ),
      drawer: MenuWidget(),
      body: ListView(
        //Crear padding
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        //Input
        children: <Widget>[
          
          //Numero Tranferencia
          _inputNumeroTraferencia(),
          Divider(),
          
          //Fecha
          _crearFecha(context),
          Divider(),

          //Custodio origen
          getCustodioOrigenDropdown(),
          Divider(),
          
          //Custodio destino
          getCustodioDestinoDropdown(),
          Divider(),

          //Responsable
          getResponsableDropdown(),
          Divider(),

          //Bien
          getBienDropdown(),
          Divider(),

          //Boton
          RaisedButton(
            disabledColor: Colors.amber,
            child: Text("Guardar", style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),),
            splashColor: Colors.amber,
            color: Colors.blueAccent,
            onPressed: () async {
              //Sacar el nombre del Usuario
              final prefs = new PreferenciasUsuario();
              //Falta agregar las validaciones
              Map<String,String> datos = {
                'custodioOrigen'    : _custodioOrigen,
                'custodioDestino'   : _custodioDestino,
                'nroTranferencia'   : _nroTranferencia,
                'responsable'       : _responsable,
                'bien'              : _bien,
                'fecha'             : _fecha,
                'idUsuario'         : prefs.codigoUsuario.toString()
              };

              (await tranferenciaProvider.postDatos(datos) == 1) ? 
                          Navigator.pushReplacementNamed(context, 'tranferencia') : print('Error');
                           

            },
          ),
        ],
      ),
    );
  }


  //Numero Tranferencia
  Widget _inputNumeroTraferencia() {
    return TextField(
      keyboardType: TextInputType.number,
      //Decoracion del input
      decoration: InputDecoration(
          //Agregar Borde
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Nro de Transferencia',
          labelText: 'Nro de Transferencia',
          ),
      //Obtener valor del texto a la variable _nombre, valor es el valor que tiene el texto
      onChanged: (valor) => setState(() {
            _nroTranferencia = valor;
      }));
  }

  //Fecha
  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Fecha',
          labelText: 'Fecha',
          suffixIcon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }
  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2019),
        lastDate: new DateTime(2025),
        
        locale: Locale('es')
    );
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  //Custodio Origen
  Widget getCustodioOrigenDropdown(){
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
                    value: _custodioOrigen,
                    items: _agregarDatosCustodio(snapshot.data),
                    //Actualizar el Dropdown y poner el texto seleccionado
                    onChanged: (opt) {
                      setState(() {
                        _custodioOrigen = opt;
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

    //Custodio Destino
  Widget getCustodioDestinoDropdown(){
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
                    value: _custodioDestino,
                    items: _agregarDatosCustodio(snapshot.data),
                    //Actualizar el Dropdown y poner el texto seleccionado
                    onChanged: (opt) {
                      setState(() {
                        _custodioDestino = opt;
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
  
  //Datos de Custodio
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

  //Responsable
  Widget getResponsableDropdown(){
    return FutureBuilder(
      future: tranferenciaProvider.getResponsable(),
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
                    value: _responsable,
                    items: _agregarDatosResponsable(snapshot.data),
                    //Actualizar el Dropdown y poner el texto seleccionado
                    onChanged: (opt) {
                      setState(() {
                        _responsable = opt;
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
  List<DropdownMenuItem<String>> _agregarDatosResponsable(data) {
    List<DropdownMenuItem<String>> lista = new List();
    
    lista.add(DropdownMenuItem(
      child: Text('Seleccione un responsable'),
      value: '',
    ));

    data.forEach((dato) {
      lista.add(DropdownMenuItem(
        child: Text(dato.nombre),
        value: dato.codResponsable.toString(),
      ));
    });

    return lista;
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


}
