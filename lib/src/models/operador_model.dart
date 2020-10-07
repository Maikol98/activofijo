class Operadores{
  List<Operador> items = new List();

  Operadores();

  Operadores.fromJsonList(List<dynamic> jsonList){
    if (jsonList == null) return;

    for (var item in jsonList) {
      final dato = new Operador.fromJsonMap(item);
      items.add(dato);
    }
  }

}



class Operador {
  int codOperador;
  String nombre;
  String apellido;
  int telefono;
  String gmail;
  int estado;

  Operador({
    this.codOperador,
    this.nombre,
    this.apellido,
    this.telefono,
    this.gmail,
    this.estado,
  });



  Operador.fromJsonMap( Map<String,dynamic> json ){
    codOperador = json['CodOperador'];
    nombre = json['Nombre'];
    apellido = json['Apellido'];
    telefono = json['Telefono'];
    gmail = json['Gmail'];
    estado = json['Estado'];
  }


}
