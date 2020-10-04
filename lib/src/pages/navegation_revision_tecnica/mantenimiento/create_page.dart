import 'package:flutter/material.dart';
import 'package:softwareproject/src/models/revision_tecnica_model.dart';
import 'package:softwareproject/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:softwareproject/src/providers/mantenimiento_provider.dart';
import 'package:softwareproject/src/widgets/menu.dart';

class CreateMantenimientoPage extends StatefulWidget {
  @override
  _CreateTranferenciaState createState() => _CreateTranferenciaState();
}

class _CreateTranferenciaState extends State<CreateMantenimientoPage> {
  
  String _problema = '';
  String _solucion = '';
  String _fechaInicio = '';
  String _fechaFin = '';
  String _horaInicio = '';
  String _horaFin = '';
  String _duracion = '';
  String _costo = '';


  TextEditingController _inputFieldDateBeginController = new TextEditingController();
  TextEditingController _inputFieldDateEndController = new TextEditingController();

  final bajaProvider = new MantenimientoProvider();  

  @override
  Widget build(BuildContext context) {

    final Revision revision = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Revaluo'),
      ),
      drawer: MenuWidget(),
      body: ListView(
        //Crear padding
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        //Input
        children: <Widget>[
          
          //Problema
          _inputProblema(),
          Divider(),

          //Solucion
          _inputSolucion(),
          Divider(),

          //Fecha Inicio
          _inputFechaInicio(context),
          Divider(),

          //Fecha Fin
          _inputFechaFin(context),
          Divider(),

          //Hora Inicio
          _inputHoraInicio(),
          Divider(),

          //Hora Inicio
          _inputHoraFin(),
          Divider(),

          //Duracion
          _inputDuracion(),
          Divider(),

          //Costo
          _inputCosto(),
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
                'problema'        : _problema,
                'solucion'        : _solucion,
                'fechaInicio'     : _fechaInicio,
                'fechaFin'        : _fechaFin,
                'horaInicio'      : _horaInicio,
                'horaFin'         : _horaFin,
                'duracion'        : _duracion,
                'costo'           : _costo,
                'idRevision'      : revision.nroRevision.toString(),
                'idUsuario'       : prefs.codigoUsuario.toString(),
              };
              
              (await bajaProvider.postDatos(datos) == 1) ? 
                          // Llamar al providers, para poder guardar los datos a la DB
                          Navigator.pushReplacementNamed(context, 'revisionTecnica') : print('Error');
                           

            },
          ),
        ],
      ),
    );
  }

    //Problema
  Widget _inputProblema() {
    return TextField(
      //Decoracion del input
      decoration: InputDecoration(
          //Agregar Borde
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Descripcion del Problema',
          labelText: 'Descripcion del Problema',
          ),
      //Obtener valor del texto a la variable _nombre, valor es el valor que tiene el texto
      onChanged: (valor) => setState(() {
            _problema = valor;
      }));
  }
    //Solucion
  Widget _inputSolucion() {
    return TextField(
      //Decoracion del input
      decoration: InputDecoration(
          //Agregar Borde
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Descripcion de la Solucion',
          labelText: 'Descripcion de la Solucion',
          ),
      //Obtener valor del texto a la variable _nombre, valor es el valor que tiene el texto
      onChanged: (valor) => setState(() {
            _solucion = valor;
      }));
  }
    //HoraInicio
  Widget _inputHoraInicio() {
    return TextField(
      //Decoracion del input
      decoration: InputDecoration(
          //Agregar Borde
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'hh:mm:ss',
          labelText: 'Hora de Inicio',
          ),
      //Obtener valor del texto a la variable _nombre, valor es el valor que tiene el texto
      onChanged: (valor) => setState(() {
            _horaInicio = valor;
      }));
  }
    //Hola Fin
  Widget _inputHoraFin() {
    return TextField(
      //Decoracion del input
      decoration: InputDecoration(
          //Agregar Borde
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'hh:mm:ss',
          labelText: 'Hora Fin',
          ),
      //Obtener valor del texto a la variable _nombre, valor es el valor que tiene el texto
      onChanged: (valor) => setState(() {
            _horaFin = valor;
      }));
  }
    //Duracion
  Widget _inputDuracion() {
    return TextField(
      //Decoracion del input
      decoration: InputDecoration(
          //Agregar Borde
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Duracion',
          labelText: 'Duracion',
          ),
      //Obtener valor del texto a la variable _nombre, valor es el valor que tiene el texto
      onChanged: (valor) => setState(() {
            _duracion = valor;
      }));
  }
    //Costo
  Widget _inputCosto() {
    return TextField(
      //Decoracion del input
      decoration: InputDecoration(
          //Agregar Borde
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Costo',
          labelText: 'Costo',
          ),
      //Obtener valor del texto a la variable _nombre, valor es el valor que tiene el texto
      onChanged: (valor) => setState(() {
            _costo = valor;
      }));
  }



  //Fecha Inicio
    Widget _inputFechaInicio(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateBeginController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Fecha Inicio',
          labelText: 'Fecha Inicio',
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
        _fechaInicio = picked.toString();
        _inputFieldDateBeginController.text = _fechaInicio;
      });
    }
  }


   //Fecha Fin
    Widget _inputFechaFin(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateEndController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Fecha Inicio',
          labelText: 'Fecha Inicio',
          suffixIcon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDateEnd(context);
      },
    );
  }
  void _selectDateEnd(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2019),
        lastDate: new DateTime(2025),
        
        locale: Locale('es')
    );
    if (picked != null) {
      setState(() {
        _fechaFin = picked.toString();
        _inputFieldDateEndController.text = _fechaFin;
      });
    }
  }

}