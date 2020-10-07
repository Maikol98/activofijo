
class Respuestas{

  List<Respuesta> items = new List();
  Respuestas();

  Respuestas.fromJsonList(List<dynamic> jsonList){
    if (jsonList == null) return;

    for (var item in jsonList) {
      final usuario = new Respuesta.fromJsonMap(item);
      items.add(usuario);
    }
  }
}


class Respuesta {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String createdAt;
  String updatedAt;
  int estado;
  dynamic telefono;
  dynamic genero;

  Respuesta({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.estado,
    this.telefono,
    this.genero,
  });

  Respuesta.fromJsonMap( Map<String, dynamic> json){
    id              = json['id'];
    name            = json['name'];
    email           = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt       = json['created_at'];
    updatedAt       = json['updated_at'];
    estado          = json['Estado'];
    telefono        = json['Telefono'];
    genero          = json['Genero'];
  }

}
