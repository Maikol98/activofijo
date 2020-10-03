
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:softwareproject/src/models/usuario.dart';
import 'package:softwareproject/src/preferencias_usuario/preferencias_usuario.dart';




class ActivoFijoProvider{

  String _url = 'fierce-dawn-95981.herokuapp.com';
  final _prefs = new PreferenciasUsuario();
 
  Future<int> login(user, pass) async{
    final url = Uri.https( _url , 'api/Login');
    print(url);
    final resp = await http.post(url, body: {
      'email' : user,
      'password' : pass
    });

    final decodeData = json.decode(resp.body);
    print(decodeData);
    if ( decodeData == 0 ) {
      return 0;
    }else{
      final usuario = new Usuario.fromJsonMap(decodeData);
      _prefs.correo = usuario.email;
      _prefs.nombre = usuario.name;
      print(usuario.name);
      _prefs.codigoUsuario = usuario.id;
      return 1;
    }
  }

}