class Bajas{

  List<Baja> items = new List();

  Bajas();

  Bajas.fromJsonList( List<dynamic> jsonList ){
    if (jsonList == null) return;

    for (var item in jsonList) {
      final baja = new Baja.fromJsonMap(item);
      items.add( baja );
    }
  }

}


class Baja {
  String codBien;
  String nombreBien;
  String nombreCustodio;
  String nombreOperador;
  String descripcion;
  String fechaHora;

  Baja({
    this.codBien,
    this.nombreBien,
    this.nombreCustodio,
    this.nombreOperador,
    this.descripcion,
    this.fechaHora,
  });

  Baja.fromJsonMap( Map<String,dynamic> json ){
    codBien = json['CodBien'];
    nombreBien = json['NombreBien'];
    nombreCustodio = json['NombreCustodio'];
    nombreOperador = json['NombreOperador'];
    descripcion = json['Descripcion'];
    fechaHora = json['FechaHora'];
  }
}
