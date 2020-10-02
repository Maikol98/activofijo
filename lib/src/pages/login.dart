

import 'package:flutter/material.dart';
import 'package:softwareproject/src/providers/activoFijo_provider.dart';

class LoginPage extends StatefulWidget {
  
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _ocultarContra = true;
  IconData _iconoContra = Icons.lock_outline;
  TextEditingController _user = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  ActivoFijoProvider activoFijoProvider = new ActivoFijoProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.blueAccent[100],
          ),
          _loginCreate(),
        ],
      ),
    );
  }

  Widget _loginCreate(){
    return  Container(
      padding: EdgeInsets.only(left: 10.0,right: 10.0),
      margin: EdgeInsets.symmetric(horizontal: 60.0, vertical: 180.0),
      child: ListView(
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
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15.0),
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
      color: Colors.green,
      elevation: 12.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Text('INGRESAR'),
        Icon(Icons.keyboard_arrow_right, size: 50.0,)
        ],
      ),
      onPressed: () {
        Navigator.pushNamed(context, 'home');
        //activoFijoProvider.login(_user.text, _password.text);
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