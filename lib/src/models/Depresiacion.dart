
class Depreciaciones{

  List<Depreciacion> items = new List();
  Depreciaciones();

  Depreciaciones.fromJsonList(List<dynamic> jsonList){
    if (jsonList == null) return;

    for (var item in jsonList) {
      final depreciacion = new Depreciacion.fromjsonMap(item);
      items.add(depreciacion);
    }
  }
}


class Depreciacion {
  String codBien;
  String nombre;
  String categoria;
  String valorCompra;
  int vidautil;
  String descripcion;
  String fechaAdquisicion;
  String depreciacion;

  Depreciacion({
    this.codBien,
    this.nombre,
    this.categoria,
    this.valorCompra,
    this.vidautil,
    this.descripcion,
    this.fechaAdquisicion,
    this.depreciacion,
  });

  Depreciacion.fromjsonMap(Map<String, dynamic> json){
    codBien          = json['CodBien'];
    nombre           = json['Nombre']; 
    categoria        = json['categoria']; 
    valorCompra      = json['ValorCompra'];
    vidautil         = json['vidautil'];
    descripcion      = json['Descripcion'];
    fechaAdquisicion = json['FechaAdquisicion'];
    depreciacion     = json['depreciacion']; 
  }
}
