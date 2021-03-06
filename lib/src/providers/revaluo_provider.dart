import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:softwareproject/src/models/revaluo_model.dart';

class RevaluoProvider {
  String _url     = 'fierce-dawn-95981.herokuapp.com';

  Future<List<Revaluo>> getRevaluo() async {
    final url = Uri.https(_url,'/api/Revaluo');

    final resp = await http.get( url );
    final decodeData = json.decode(resp.body);

    final dato = new Revaluos.fromJsonList(decodeData);
  
    return dato.items;

  }

  Future<int> postDatos(Map<String,String> datos) async{

    final url = Uri.http(_url, 'api/Revaluo/create');
    final resp = await http.post(url,body: datos);

    return json.decode(resp.body);
    
  }


}