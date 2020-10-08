import 'package:flutter/material.dart';
import 'package:softwareproject/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:softwareproject/src/providers/usuario_provider.dart';
import 'package:softwareproject/src/widgets/menu.dart';

class UsuarioCreate extends StatefulWidget {

  @override
  _UsuarioCreateState createState() => _UsuarioCreateState();
}

class _UsuarioCreateState extends State<UsuarioCreate> {

  final prefs = new PreferenciasUsuario();

  UsuarioProvider usuarioProvider = new UsuarioProvider();

  bool _ocultarContra = true;
  int _value = 1;
  IconData _iconoContra = Icons.lock_outline;
  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Crear Usuario'),
      ),
      drawer: MenuWidget(),
      body: formulario()
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
        _roles(),
        SizedBox(height: 10.0),
        _buton(),
      ],
    );
  }

  Widget _roles(){
    return DropdownButton(
      isExpanded: true,
      value: _value,
      items: [
        DropdownMenuItem(
          child: Text('SuperAdmin'),
          value: 1,
        ),
        DropdownMenuItem(
          child: Text('Responsable'),
          value: 2,
        ),
        DropdownMenuItem(
          child: Text('Custodio'),
          value: 3,
        ),
        DropdownMenuItem(
          child: Text('Operador'),
          value: 4,
        ),
      ],
      onChanged: (value) {
        setState(() {
          _value =value;
        });
      },
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
          Icon(Icons.save, size: 45.0, color: Colors.white),
          Text('REGISTRAR',style: TextStyle(color: Colors.white),)
        ],
      ),
      onPressed: (){
        final cod = prefs.codigoUsuario;
        Map<String, dynamic> datos = {
          'name' : _name.text,
          'email': _email.text,
          'password' : _password.text,
          'rol' : _value.toString(),
          'CodigoUsuario' : cod.toString()
        };
        usuarioProvider.crearusuario(datos);
        Navigator.pushNamed(context, 'usuario');
        print(datos);
      },
    );
  }
}