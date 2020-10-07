

import 'package:flutter/material.dart';
import 'package:softwareproject/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:softwareproject/src/providers/activoFijo_provider.dart';

class LoginPage extends StatefulWidget {
  
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final prefs = new PreferenciasUsuario();
  bool _ocultarContra = true;
  IconData _iconoContra = Icons.lock_outline;
  TextEditingController _user = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  ActivoFijoProvider activoFijoProvider = new ActivoFijoProvider();

  @override
  Widget build(BuildContext context) {
    _user.text = prefs.correo ;
    return Scaffold(
      body: Container(
        color: Colors.blueAccent[100],
        child: _loginCreate(),
      ),
      
    );
  }

  Widget _loginCreate(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: ListView(
        padding: EdgeInsets.only(top: 80.0),
        children: <Widget>[
          _imagenPerfil(),
          SizedBox(height: 20.0),
          _inputCorreo(),
          SizedBox(height: 10.0),
          _inputPassword(),
          SizedBox(height: 10.0),
          _opciones(),
          SizedBox(height: 10.0),
          _crearButton(),
        ],
      ),
    );
  }

  Widget _inputCorreo(){
    return TextField(
      controller: _user,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.mail_outline),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        labelText: 'Email',
        hintText: 'alguien@gmail.com'
      ),
    );
  }

  Widget _inputPassword(){
    return TextField(
      controller: _password,
      obscureText: _ocultarContra,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(_iconoContra),
          onPressed: () {
            if (_ocultarContra) {
              _iconoContra = Icons.lock_open;
              _ocultarContra = !_ocultarContra;
            }else{
              _iconoContra = Icons.lock_outline;
              _ocultarContra = !_ocultarContra;
            }
            setState(() {});
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        labelText: 'Password', 
      ),
    );
  }

  Widget _imagenPerfil(){
    return CircleAvatar(
      radius: 50.0,
      backgroundColor: Colors.blueGrey[100],
      child: Icon(Icons.person, size: 70.0, color: Colors.black,),
    );
  }

  Widget _crearButton(){
    return RaisedButton(
      shape: ContinuousRectangleBorder(
        side: BorderSide(width: 1.0),
        borderRadius: BorderRadius.circular(20.0) 
      ),
      color: Colors.green[400],
      elevation: 12.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Text('INGRESAR'),
        Icon(Icons.keyboard_arrow_right, size: 50.0,)
        ],
      ),
      onPressed: () async{
        if( await activoFijoProvider.login(_user.text, _password.text) == 1 ){
          Navigator.pushNamed(context, 'home');
        }
      },
    );
 }

  Widget _opciones(){
    return Column(
      children: <Widget>[
        FlatButton(
          splashColor: Colors.white10,
          child: Text('¿Olvidaste la contraseña?',
            style: TextStyle(
              decoration: TextDecoration.underline
            ),
          ),
          onPressed: () {
            
          },
        ),
      ],
    );
  }
}