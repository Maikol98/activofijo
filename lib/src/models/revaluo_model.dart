class Revaluos{

  List<Revaluo> items = new List();

  Revaluos();

  Revaluos.fromJsonList( List<dynamic> jsonList ){
    if (jsonList == null) return;

    for (var item in jsonList) {
      final dato = new Revaluo.fromJsonMap(item);
      items.add( dato );
    }
  }

}


class Revaluo {
  String codBien;
  String nombreBien;
  String nombreCustodio;
  String nombreOperador;
  String estado;
  String fechaHora;
  String monto;
  String descripcion;

  Revaluo({
    this.codBien,
    this.nombreBien,
    this.nombreCustodio,
    this.nombreOperador,
    this.estado,
    this.fechaHora,
    this.monto,
    this.descripcion,
  });

  Revaluo.fromJsonMap( Map<String,dynamic> json ){
    codBien = json['codBien'];
    nombreBien = json['nombreBien'];
    nombreCustodio = json['nombreCustodio'];
    nombreOperador = json['nombreOperador'];
    estado = json['estado'];
    fechaHora = json['fechaHora'];
    monto = json['monto'];
    descripcion = json['descripcion'];
  }
}
