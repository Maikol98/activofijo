import 'package:flutter/material.dart';
import 'package:softwareproject/src/models/custodio.mode.dart';
import 'package:softwareproject/src/providers/tranferencia_provider.dart';
import 'package:softwareproject/src/widgets/menu.dart';

class CreateTranferenciaPage extends StatefulWidget {
  @override
  _CreateTranferenciaState createState() => _CreateTranferenciaState();
}

class _CreateTranferenciaState extends State<CreateTranferenciaPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';

  String _opcionSeleccionada = 'Volar';

  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];


  //Permite manejar una relaccion con el texto en este caso Fecha para cambiar sus propiedades como el valor
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input de texto'),
      ),
      drawer: MenuWidget(),
      body: ListView(
        //Crear padding
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        //Input
        children: <Widget>[
          //Agregar nuevo Input
          _crearInput(),
          Divider(),
          //Agregar un inputEmal
          _crearEmail(),
          Divider(),
          //Agregar un inputEmal
          _crearPassword(),
          Divider(),
          //Agregar un inputEmal
          _crearFecha(context),
          Divider(),
          //Agregar un Dropdown
          _crearDropdown(),
          Divider(),
          //Agregar un Label con el valor del Input
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      //Automaticamente para que agrege los datos, el valor por defecto es false
      // autofocus: true,
      //Para agregar mayusculas automaticamente, etc.
      textCapitalization: TextCapitalization.sentences,
      //Decoracion del input
      decoration: InputDecoration(
          //Agregar Borde
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //Agregar letra, inferior derecha contador
          counter: Text('Letra ${_nombre.length}'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Solo es el nombre',
          //Icono derecha
          suffixIcon: Icon(Icons.accessibility),
          //Icono Izquierda
          icon: Icon(Icons.account_circle)),
      //Obtener valor del texto a la variable _nombre, valor es el valor que tiene el texto
      onChanged: (valor) {
        //Redibujar
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        //Expandir al maximo
        Expanded(
          child: DropdownButton(
            //Valor es la opcion seleccionada
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            //Actualizar el Dropdown y poner el texto seleccionado
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          ),
        )
      ],
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }

  Widget _crearEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        //Decoracion del input
        decoration: InputDecoration(
            //Agregar Borde
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Email',
            labelText: 'Email',
            //Icono derecha
            suffixIcon: Icon(Icons.alternate_email),
            //Icono Izquierda
            icon: Icon(Icons.email)),
        //Obtener valor del texto a la variable _nombre, valor es el valor que tiene el texto
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  Widget _crearPassword() {
    return TextField(
        //Ocultar lo que se escribe, Contraseña
        obscureText: true,
        //Decoracion del input
        decoration: InputDecoration(
            //Agregar Borde
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Password',
            labelText: 'Password',
            //Icono derecha
            suffixIcon: Icon(Icons.lock_open),
            //Icono Izquierda
            icon: Icon(Icons.lock)),
        //Obtener valor del texto a la variable _nombre, valor es el valor que tiene el texto
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      //Decir que este input CrearFecha esta relaccionada con InputFieldDateController
      controller: _inputFieldDateController,
      //Decoracion del input
      decoration: InputDecoration(
          //Agregar Borde
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha de Nacimiento',
          labelText: 'Fecha de Nacimiento',
          //Icono derecha
          suffixIcon: Icon(Icons.perm_contact_calendar),
          //Icono Izquierda
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        //Ocultar el focus, cuando uno presiona click, no aparezca escribir
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    //Agregar fecha
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        //Cambiar el lenguaje a Español
        locale: Locale('es'));
    //Agregar el valor a la variable
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        //Agregar el valor de la variable Fecha al controllador _inputFieldController
        _inputFieldDateController.text = _fecha;
      });
    }
  }
}
