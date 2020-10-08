import 'package:flutter/material.dart';

import 'dart:math';

import 'package:softwareproject/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:softwareproject/src/providers/bien_provider.dart';
import 'package:softwareproject/src/widgets/menu.dart';

class CreateBienPage extends StatefulWidget {
  @override
  _CreateTranferenciaState createState() => _CreateTranferenciaState();
}

class _CreateTranferenciaState extends State<CreateBienPage> {
  
  String _codigo = '';
  String _nombre = '';
  String _fechaAdquisicion = '';
  String _valorCompra = '';
  String _estado = 'Seleccione un Estado';
  String _departamentoDestino = '';
  String _almacenOrigen = '';
  String _rubro = '';
  String _categoria = '';


  List<String> _listEstado = ['Seleccione un Estado','Nuevo', 'Usado'];

  TextEditingController _inputFieldDateBeginController = new TextEditingController();

  final bienProvider = new BienProvider();  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Bien'),
      ),
      drawer: MenuWidget(),
      body: ListView(
        //Crear padding
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        //Input
        children: <Widget>[
          
          //Codigo
          _crearCodigo(),
          Divider(),

          //Nombre
          _inputNombre(),
          Divider(),

          //Fecha Adquisicion
          _inputFechaAdquisicion(context),
          Divider(),

          //Valor Compra
          _inputValorCompra(),
          Divider(),

          //Estado
          _estadoDropdown(),
          Divider(),

          //Departamento Destino
          _getDepartamentoDropdown(),
          Divider(),

          //Almacen Origen
          _getAlmacenOrigenDropdown(),
          Divider(),

          //Rubro
          _getRubroDropdown(),
          Divider(),

          //Categoria
          _getCategoriaDropdown(),
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
              'codigo'               : _codigo,
              'nombre'               : _nombre,
              'fechaAdquisicion'     : _fechaAdquisicion,
              'valorCompra'          : _valorCompra,
              'estado'               : _estado,
              'departamentoDestino'  : _departamentoDestino,
              'almacenOrigen'        : _almacenOrigen,
              'rubro'                : _rubro,
              'categoria'            : _categoria,
              'idUsuario'            : prefs.codigoUsuario.toString(),
              };
              
              //print(datos);

              (await bienProvider.postDatos(datos) == 1) ? 
                          // Llamar al providers, para poder guardar los datos a la DB
                          Navigator.pushReplacementNamed(context, 'indexBien') : print('Error');
                           

            },
          ),
        ],
      ),
    );
  }


  //Nombre
  Widget _inputNombre() {
    return TextField(
      //Decoracion del input
      decoration: InputDecoration(
          //Agregar Borde
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Nombre',
          labelText: 'Nombre',
          ),
      //Obtener valor del texto a la variable _nombre, valor es el valor que tiene el texto
      onChanged: (valor) => setState(() {
            _nombre = valor;
      }));
  }
  
  //Valor Compra
  Widget _inputValorCompra() {
    return TextField(
      //Decoracion del input
      decoration: InputDecoration(
          //Agregar Borde
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Valor Compra',
          labelText: 'Valor Compra',
          ),
      //Obtener valor del texto a la variable _nombre, valor es el valor que tiene el texto
      onChanged: (valor) => setState(() {
            _valorCompra = valor;
      }));
  }

  //Fecha de Adquisicion
  Widget _inputFechaAdquisicion(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateBeginController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Fecha de Adquisicion',
          labelText: 'Fecha de Adquisicion',
          suffixIcon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDateBegin(context);
      },
    );
  }
  void _selectDateBegin(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2019),
        lastDate: new DateTime(2025),
        
        locale: Locale('es')
    );
    if (picked != null) {
      setState(() {
        _fechaAdquisicion = picked.toString();
        _inputFieldDateBeginController.text = _fechaAdquisicion;
      });
    }
  }

  //DropdownEstado
  List<DropdownMenuItem<String>> getOpcionesDropdown() {
  List<DropdownMenuItem<String>> lista = new List();

    _listEstado.forEach((estado) {
      lista.add(DropdownMenuItem(
        child: Text(estado),
        value: estado,
      ));
    });

    return lista;
  }
  Widget _estadoDropdown() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 10.0,
        ),
        //Expandir al maximo
        Expanded(
          child: DropdownButton(
            //Valor es la opcion seleccionada
            value: _estado,
            items: getOpcionesDropdown(),
            //Actualizar el Dropdown y poner el texto seleccionado
            onChanged: (opt) {
              setState(() {
                _estado = opt;
                _generarCodigo();
              });
            },
          ),
        )
      ],
    );
  }

  //DepartamentoDestino
  Widget _getDepartamentoDropdown(){
    return FutureBuilder(
      future: bienProvider.getDepartamento(),
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
                    value: _departamentoDestino,
                    items: _agregarDatosDepartamento(snapshot.data),
                    //Actualizar el Dropdown y poner el texto seleccionado
                    onChanged: (opt) {
                      setState(() {
                        _departamentoDestino = opt;
                        _generarCodigo();
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
  List<DropdownMenuItem<String>> _agregarDatosDepartamento(data) {
    List<DropdownMenuItem<String>> lista = new List();
    
    lista.add(DropdownMenuItem(
      child: Text('Seleccione un Departamento Destino'),
      value: '',
    ));

    data.forEach((dato) {
      lista.add(DropdownMenuItem(
        child: Text(dato.descripcion),
        value: dato.codDepartamento.toString(),
      ));
    });

    return lista;
  }

  //AlmacenOrigen
  Widget _getAlmacenOrigenDropdown(){
    return FutureBuilder(
      future: bienProvider.getAlmacen(),
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
                    value: _almacenOrigen,
                    items: _agregarAlacenOrigen(snapshot.data),
                    //Actualizar el Dropdown y poner el texto seleccionado
                    onChanged: (opt) {
                      setState(() {
                        _almacenOrigen = opt;
                        _generarCodigo();
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
  List<DropdownMenuItem<String>> _agregarAlacenOrigen(data) {
    List<DropdownMenuItem<String>> lista = new List();
    
    lista.add(DropdownMenuItem(
      child: Text('Seleccione un Almacen de Origen'),
      value: '',
    ));

    data.forEach((dato) {
      lista.add(DropdownMenuItem(
        child: Text(dato.direccion),
        value: dato.nroAlmacen.toString(),
      ));
    });

    return lista;
  }

  //Rubro
  Widget _getRubroDropdown(){
    return FutureBuilder(
      future: bienProvider.getRubro(),
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
                    value: _rubro,
                    items: _agregarRubro(snapshot.data),
                    //Actualizar el Dropdown y poner el texto seleccionado
                    onChanged: (opt) {
                      setState(() {
                        _rubro = opt;
                        _generarCodigo();
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
  List<DropdownMenuItem<String>> _agregarRubro(data) {
    List<DropdownMenuItem<String>> lista = new List();
    
    lista.add(DropdownMenuItem(
      child: Text('Seleccione un Rubro'),
      value: '',
    ));

    data.forEach((dato) {
      lista.add(DropdownMenuItem(
        child: Text(dato.descripcion),
        value: dato.codRubro.toString(),
      ));
    });

    return lista;
  }

  //Categoria
  Widget _getCategoriaDropdown(){
    return FutureBuilder(
      future: bienProvider.getCategoria(),
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
                    value: _categoria,
                    items: _agregarCategoria(snapshot.data),
                    //Actualizar el Dropdown y poner el texto seleccionado
                    onChanged: (opt) {
                      setState(() {
                        _categoria = opt;
                        _generarCodigo();
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
  List<DropdownMenuItem<String>> _agregarCategoria(data) {
    List<DropdownMenuItem<String>> lista = new List();
    
    lista.add(DropdownMenuItem(
      child: Text('Seleccione una Categoria'),
      value: '',
    ));

    data.forEach((dato) {
      lista.add(DropdownMenuItem(
        child: Text(dato.nombre),
        value: dato.codCategoria.toString(),
      ));
    });

    return lista;
  }

  Widget _crearCodigo() {
    return ListTile(
      title: Text('Codigo: $_codigo'),
    );
  }


  //Generar Codigo Bien
  void _generarCodigo(){
    String _cod = _departamentoDestino.toString() + _rubro.toString() + '-' + _categoria.toString();

    DateTime now = new DateTime.now();
    var rng = new Random();

    var cod = '-' + now.hashCode.toString() + rng.nextInt(9999).toString();
    var cod2 = cod.substring(cod.length-4,cod.length);

    var aux = "" + rng.nextDouble().toString();
    var aux2 = aux.substring(2,4);

    _codigo = _cod + "-" + cod2 + "-" + aux2;

    print(_codigo);
  }
}