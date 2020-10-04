class Mantenimientos{

  List<Mantenimiento> items = new List();

  Mantenimientos();

  Mantenimientos.fromJsonList( List<dynamic> jsonList ){
    if (jsonList == null) return;

    for (var item in jsonList) {
      final dato = new Mantenimiento.fromJsonMap(item);
      items.add( dato );
    }
  }

}

class Mantenimiento {
  String codBien;
  String nombreBien;
  String nombreCustodio;
  String nombreOperador;
  String fechaInicio;
  String fechaFinalizo;
  String problema;
  String solucion;
  String costo;

  Mantenimiento({
    this.codBien,
    this.nombreBien,
    this.nombreCustodio,
    this.nombreOperador,
    this.fechaInicio,
    this.fechaFinalizo,
    this.problema,
    this.solucion,
    this.costo,
  });

  Mantenimiento.fromJsonMap( Map<String,dynamic> json ){
    codBien = json['CodBien'];
    nombreBien = json['NombreBien'];
    nombreCustodio = json['NombreCustodio'];
    nombreOperador = json['NombreOperador'];
    fechaInicio = json['FechaInicio'];
    fechaFinalizo = json['FechaFinalizo'];
    problema = json['Problema'];
    solucion = json['Solucion'];
    costo = json['Costo'];
  }
}
