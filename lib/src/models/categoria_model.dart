class Categorias{

  List<Categoria> items = new List();

  Categorias();

  Categorias.fromJsonList( List<dynamic> jsonList ){
    if (jsonList == null) return;

    for (var item in jsonList) {
      final dato = new Categoria.fromJsonMap(item);
      items.add( dato );
    }
  }

}

class Categoria {
  int codCategoria;
  String nombre;
  int codRubro;
  String descripcion;

  Categoria({
    this.codCategoria,
    this.nombre,
    this.codRubro,
    this.descripcion,
  });


  Categoria.fromJsonMap( Map<String,dynamic> json ){
    codCategoria = json['CodCategoria'];
    nombre = json['Nombre'];
    codRubro = json['CodRubro'];
    descripcion = json['Descripcion'];
  }
}
