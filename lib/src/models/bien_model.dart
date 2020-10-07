class Bienes{
  List<Bien> items = new List();

  Bienes();

  Bienes.fromJsonList(List<dynamic> jsonList){
    if (jsonList == null) return;

    for (var item in jsonList) {
      final dato = new Bien.fromJsonMap(item);
      items.add(dato);
    }
  }

}


class Bien {
  String codBien;
  String nombre;
  String fechaAdquisicion;
  String valorCompra;
  String estado;
  int ubicacionDepartamento;
  int ubicacionAlmacen;
  int codCategoria;
  int codRubro;
  String estadoBien;
  String nuevoValorRevaluo;

  Bien({
    this.codBien,
    this.nombre,
    this.fechaAdquisicion,
    this.valorCompra,
    this.estado,
    this.ubicacionDepartamento,
    this.ubicacionAlmacen,
    this.codCategoria,
    this.codRubro,
    this.estadoBien,
    this.nuevoValorRevaluo,
  });

  Bien.fromJsonMap( Map<String,dynamic> json ){
    codBien = json['CodBien'];
    nombre = json['Nombre'];
    fechaAdquisicion = json['FechaAdquisicion'];
    valorCompra = json['ValorCompra'];
    estado = json['Estado'];
    ubicacionDepartamento = json['UbicacionDepartamento'];
    ubicacionAlmacen = json['UbicacionAlmacen'];
    codCategoria = json['CodCategoria'];
    codRubro = json['CodRubro'];
    estadoBien = json['EstadoBien'];
    nuevoValorRevaluo = json['NuevoValorRevaluo'];
  }
}

