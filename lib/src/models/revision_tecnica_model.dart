class Revisiones{

  List<Revision> items = new List();

  Revisiones();

  Revisiones.fromJsonList( List<dynamic> jsonList ){
    if (jsonList == null) return;

    for (var item in jsonList) {
      final dato = new Revision.fromJsonMap(item);
      items.add( dato );
    }
  }

}


class Revision {
  int nroRevision;
  String codBien;
  String nombreBien;
  String nombreCustodio;
  String apellidoCustodio;
  String nombreOperador;
  String apellidoOperador;
  String fechaHora;

  Revision({
    this.nroRevision,
    this.codBien,
    this.nombreBien,
    this.nombreCustodio,
    this.apellidoCustodio,
    this.nombreOperador,
    this.apellidoOperador,
    this.fechaHora,
  });

  Revision.fromJsonMap( Map<String,dynamic> json ){
    nroRevision = json['NroRevision'];
    codBien = json['CodBien'];
    nombreBien = json['NombreBien'];
    nombreCustodio = json['NombreCustodio'];
    apellidoCustodio = json['ApellidoCustodio'];
    nombreOperador = json['NombreOperador'];
    apellidoOperador = json['ApellidoOperador'];
    fechaHora = json['FechaHora'];
  }
}
