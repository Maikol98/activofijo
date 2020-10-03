class Bitacoras{

  List<Bitacora> items = new List();

  Bitacoras();

  Bitacoras.fromJsonList( List<dynamic> jsonList ){
    if (jsonList == null) return;

    for (var item in jsonList) {
      final bitacora = new Bitacora.fromJsonMap(item);
      items.add( bitacora );
    }
  }

}


class Bitacora {
  String name;
  String email;
  String accion;
  String fechaAccion;

  Bitacora({
    this.name,
    this.email,
    this.accion,
    this.fechaAccion,
  });

  Bitacora.fromJsonMap( Map<String,dynamic> json ){
    name        = json['name'];
    email       = json['email'];
    accion      = json['accion'];
    fechaAccion = json['fechaAccion'];
  }
}
