class Rubros{

  List<Rubro> items = new List();

  Rubros();

  Rubros.fromJsonList( List<dynamic> jsonList ){
    if (jsonList == null) return;

    for (var item in jsonList) {
      final dato = new Rubro.fromJsonMap(item);
      items.add( dato );
    }
  }

}

class Rubro {
  int codRubro;
  String descripcion;
  int vidautil;
  double coeficiente;
  int deprecia;
  int actualiza;

  Rubro({
    this.codRubro,
    this.descripcion,
    this.vidautil,
    this.coeficiente,
    this.deprecia,
    this.actualiza,
  });


  Rubro.fromJsonMap( Map<String,dynamic> json ){
    codRubro = json['CodRubro'];
    descripcion = json['Descripcion'];
    vidautil = json['vidautil'];
    coeficiente = json['coeficiente'] / 1.0;
    deprecia = json['deprecia'];
    actualiza = json['actualiza'];
  }
}
