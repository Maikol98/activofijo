
// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:softwareproject/src/models/custodio_model.dart';

// class EmpleadoProvider{

//   String _url = 'fierce-dawn-95981.herokuapp.com';


//   Future<List<Custodio>> listarCustodio() async{
//     final url = Uri.https(_url, 'api/listarCusodio');
//     final resp = await http.get(url);
//     final decodeData = json.decode(resp.body);
//     final custodio = new Custodios.fromJsonList(decodeData);
//     return custodio.items;
//   }

  // OPERADOR
  //   Future<List<Custodio>> listarOperador() async{
  //   final url = Uri.https(_url, 'api/listarOperador');
  //   final resp = await http.get(url);
  //   final decodeData = json.decode(resp.body);
  //   //-------------------------------
  //   //final operador = new Operador.fromJsonList(decodeData);
  //   //return operador.items;
  // }



// }