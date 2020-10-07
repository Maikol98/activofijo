class Tranferencias{

  List<Tranferencia> items = new List();

  Tranferencias();

  Tranferencias.fromJsonList( List<dynamic> jsonList ){
    if (jsonList == null) return;

    for (var item in jsonList) {
      final dato = new Tranferencia.fromJsonMap(item);
      items.add( dato );
    }
  }

}


class Tranferencia {
  int nroTranferencia;
  String fechaTranferencia;
  String nombrec1;
  String nombrer;

  Tranferencia({
    this.nroTranferencia,
    this.fechaTranferencia,
    this.nombrec1,
    this.nombrer,
  });

  Tranferencia.fromJsonMap( Map<String,dynamic> json ){
    nroTranferencia = json['NroTranferencia'];
    fechaTranferencia = json['FechaTranferencia'];
    nombrec1 = json['nombrec1'];
    nombrer = json['nombrer'];
  }
}
