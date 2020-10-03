class Custodios{
  List<Custodio> items = new List();

  Custodios();

  Custodios.fromJsonList(List<dynamic> jsonList){
    if (jsonList == null) return;

    for (var item in jsonList) {
      final dato = new Custodio.fromJsonMap(item);
      items.add(dato);
    }
  }

}



class Custodio {
  int codCustodio;
  String nombre;
  String apellido;
  int telefono;
  int estado;
  int codDepartamento;

  Custodio({
    this.codCustodio,
    this.nombre,
    this.apellido,
    this.telefono,
    this.estado,
    this.codDepartamento,
  });

  Custodio.fromJsonMap( Map<String,dynamic> json ){
    codCustodio = json['CodCustodio'];
    nombre = json['Nombre'];
    apellido = json['Apellido'];
    telefono = json['Telefono'];
    estado = json['Estado'];
    codDepartamento = json['CodDepartamento'];
  }
}
