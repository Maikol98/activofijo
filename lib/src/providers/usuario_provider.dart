import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:softwareproject/src/models/usuarios.dart';
import 'package:softwareproject/src/preferencias_usuario/preferencias_usuario.dart';

class UsuarioProvider{
  final _prefs = new PreferenciasUsuario();
  String _url = 'fierce-dawn-95981.herokuapp.com';
  
  //Gestionar Usuario
  Future<List<Respuesta>> usuarioIndex() async{
    final url = Uri.https(_url, 'api/UsuarioMovil');

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final usuario = new Respuestas.fromJsonList(decodeData);
    return usuario.items;
  }
  
  //create
  Future crearusuario(Map<String, dynamic> datos) async{
    final url = Uri.https(_url, 'api/UsuarioMovil');

    final resp = await http.post(url,body: datos);
    final decodeData = json.decode(resp.body);
    return decodeData;
  }


  //edit
  Future<Respuesta> editUsuario(int codigo, Map<String,dynamic> datos) async{
    final url = Uri.https(_url, 'api/UsuarioMovil/$codigo');

    final resp = await http.put(url,body: datos);
    final decodeData = json.decode(resp.body);
    final usuario = new Respuesta.fromJsonMap(decodeData);
    return usuario;
  }

  //eliminar
   Future<Respuesta> deleteUsuario(int codigo) async{
    final url = Uri.https(_url, 'api/Eliminar/$codigo');

    final resp = await http.put(url,body:{
      'idUsuario' : _prefs.codigoUsuario.toString(),
    });
    final decodeData = json.decode(resp.body);
    final usuario = new Respuesta.fromJsonMap(decodeData);
    return usuario;
  }

}