import 'package:flutter/material.dart';
import 'package:softwareproject/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:softwareproject/src/providers/usuario_provider.dart';
import 'package:softwareproject/src/widgets/menu.dart';

class UsuarioEdit extends StatefulWidget {

  @override
  _UsuarioEditState createState() => _UsuarioEditState();
}

class _UsuarioEditState extends State<UsuarioEdit> {

  bool _ocultarContra = true;
  IconData _iconoContra = Icons.lock_outline;
  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  final prefs = new PreferenciasUsuario();
  final usuarioProvider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Usuario'),
      ),
      drawer: MenuWidget(),
      body: formulario(),
    );
  }

  Widget formulario(){
    return ListView(
      padding: EdgeInsets.all(15.0),
      children: <Widget>[
        SizedBox(height: 15.0),
        Text('FORMULARIO',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        SizedBox(height: 15.0,),
        _inputNombre(),
        SizedBox(height: 10.0),
        _inputCorreo(),
        SizedBox(height: 10.0),
        _inputPassword(),
        SizedBox(height: 10.0),
        _buton(),
      ],
    );
  }


  Widget _inputNombre(){
    return TextField(
      controller: _name,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.perm_identity),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        labelText: 'Nombre'
      ),
    );
  }

   Widget _inputCorreo(){
    return TextField(
      controller: _email,
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

  Widget _buton(){
    return FlatButton(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.green[700],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('ACTUALIZAR  ',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            )
          ),
          Icon(Icons.edit,size: 45.0,color: Colors.white)
        ],
      ),
      onPressed: (){
        Map<String, dynamic> datos = {
          'name' : _name.text,
          'email': _email.text,
          'password' : _password.text,
          'CodigoUsuario' : prefs.codigoUsuario.toString()
        };
        //usuarioProvider.editUsuario(codigo, datos)
        Navigator.pushNamed(context, 'usuario');
        print(datos);
      },
    );
  }

}