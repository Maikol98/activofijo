class RevisionMantenimientos{

  List<RevisionMantenimiento> items = new List();

  RevisionMantenimientos();

  RevisionMantenimientos.fromJsonList( List<dynamic> jsonList ){
    if (jsonList == null) return;

    for (var item in jsonList) {
      final dato = new RevisionMantenimiento.fromJsonMap(item);
      items.add( dato );
    }
  }

}



class RevisionMantenimiento {
  int nroRevision;
  String codBien;
  String nombreBien;
  String nombreCustodio;
  String apellidoCustodio;
  String nombreOperador;
  String apellidoOperador;
  String fechaHora;

  RevisionMantenimiento({
    this.nroRevision,
    this.codBien,
    this.nombreBien,
    this.nombreCustodio,
    this.apellidoCustodio,
    this.nombreOperador,
    this.apellidoOperador,
    this.fechaHora,
  });

  RevisionMantenimiento.fromJsonMap( Map<String,dynamic> json ){
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
