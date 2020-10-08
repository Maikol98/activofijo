class Departamentos{

  List<Departamento> items = new List();

  Departamentos();

  Departamentos.fromJsonList( List<dynamic> jsonList ){
    if (jsonList == null) return;

    for (var item in jsonList) {
      final dato = new Departamento.fromJsonMap(item);
      items.add( dato );
    }
  }

}

class Departamento {
  int codDepartamento;
  String descripcion;
  String edificio;
  String ciudad;
  String pais;

  Departamento({
    this.codDepartamento,
    this.descripcion,
    this.edificio,
    this.ciudad,
    this.pais,
  });

  Departamento.fromJsonMap( Map<String,dynamic> json ){
    codDepartamento = json['CodDepartamento'];
    descripcion = json['Descripcion'];
    edificio = json['Edificio'];
    ciudad = json['Ciudad'];
    pais = json['Pais'];
  }
}
