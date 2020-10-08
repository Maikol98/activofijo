class Almacenes{

  List<Almacen> items = new List();

  Almacenes();

  Almacenes.fromJsonList( List<dynamic> jsonList ){
    if (jsonList == null) return;

    for (var item in jsonList) {
      final dato = new Almacen.fromJsonMap(item);
      items.add( dato );
    }
  }

}


class Almacen {
  int nroAlmacen;
  String direccion;
  int estado;

  Almacen({
    this.nroAlmacen,
    this.direccion,
    this.estado,
  });

  Almacen.fromJsonMap( Map<String,dynamic> json ){
    nroAlmacen = json['NroAlmacen'];
    direccion = json['Direccion'];
    estado = json['Estado'];
  }
}
