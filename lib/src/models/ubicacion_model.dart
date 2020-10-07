class Ubicaciones{
  List<Ubicacion> items = new List();

  Ubicaciones();

  Ubicaciones.fromJsonList(List<dynamic> jsonList){
    if (jsonList == null) return;

    for (var item in jsonList) {
      final dato = new Ubicacion.fromJsonMap(item);
      items.add(dato);
    }
  }

}


class Ubicacion {
  int codUbicacion;
  String edificio;
  String ciudad;
  String pais;
  int estado;

  Ubicacion({
    this.codUbicacion,
    this.edificio,
    this.ciudad,
    this.pais,
    this.estado,
  });

  Ubicacion.fromJsonMap( Map<String,dynamic> json ){
    codUbicacion = json['codUbicacion'];
    edificio = json['edificio'];
    ciudad = json['ciudad'];
    pais = json['pais'];
    estado = json['estado'];
  }
}
