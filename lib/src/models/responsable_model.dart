class Responsables{
  List<Responsable> items = new List();

  Responsables();

  Responsables.fromJsonList(List<dynamic> jsonList){
    if (jsonList == null) return;

    for (var item in jsonList) {
      final dato = new Responsable.fromJsonMap(item);
      items.add(dato);
    }
  }

}


class Responsable {
  int codResponsable;
  String nombre;
  String apellido;
  int telefono;
  int estado;

  Responsable({
    this.codResponsable,
    this.nombre,
    this.apellido,
    this.telefono,
    this.estado,
  });

  Responsable.fromJsonMap( Map<String,dynamic> json ){
    codResponsable = json['CodResponsable'];
    nombre = json['Nombre'];
    apellido = json['Apellido'];
    telefono = json['Telefono'];
    estado = json['Estado'];
  }
}
