import 'package:flutter/material.dart';
import 'package:softwareproject/src/providers/tranferencia_provider.dart';
import 'package:softwareproject/src/widgets/menu.dart';

class CreateTranferenciaPage extends StatefulWidget {
  @override
  _CreateTranferenciaState createState() => _CreateTranferenciaState();
}

class _CreateTranferenciaState extends State<CreateTranferenciaPage> {
 

  String _custodioOrigen = '';
  String _custodioDestino = '';
  String _email = '';


  final tranferenciaProvider = new TranferenciaProvider();  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Tranferencia'),
      ),
      drawer: MenuWidget(),
      body: ListView(
        //Crear padding
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        //Input
        children: <Widget>[
          //Numero Tranferencia
          _inputNumeroTraferencia(),
          //Fecha
          //_crearFecha(context),
          //Custodio origen
          getCustodioDropdown(_custodioOrigen),
          //Custodio destino
          getCustodioDropdown(_custodioDestino),
          
        ],
      ),
    );
  }


  //Numero Tranferencia
  Widget _inputNumeroTraferencia() {
    return TextField(
      keyboardType: TextInputType.number,
      //Decoracion del input
      decoration: InputDecoration(
          //Agregar Borde
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Nro de Transferencia',
          labelText: 'Nro de Transferencia',
          ),
      //Obtener valor del texto a la variable _nombre, valor es el valor que tiene el texto
      onChanged: (valor) => setState(() {
            _email = valor;
      }));
  }

  //Crear Fecha
  // Widget _crearFecha(BuildContext context) {
  //   return TextField(
  //     enableInteractiveSelection: false,
  //     //Decir que este input CrearFecha esta relaccionada con InputFieldDateController
  //     controller: _inputFieldDateController,
  //     //Decoracion del input
  //     decoration: InputDecoration(
  //         //Agregar Borde
  //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
  //         hintText: 'Fecha de Nacimiento',
  //         labelText: 'Fecha de Nacimiento',
  //         //Icono derecha
  //         suffixIcon: Icon(Icons.perm_contact_calendar),
  //         //Icono Izquierda
  //         icon: Icon(Icons.calendar_today)),
  //     onTap: () {
  //       //Ocultar el focus, cuando uno presiona click, no aparezca escribir
  //       FocusScope.of(context).requestFocus(new FocusNode());
  //       _selectDate(context);
  //     },
  //   );
  // }

  //Custodio
  Widget getCustodioDropdown(String _custodio){
    return FutureBuilder(
      future: tranferenciaProvider.getCustodio(),
      //snapshot optiene la respuesta del http
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        //print(snapshot.data);
       
        if (snapshot.hasData){
            return Row(
              
              children: <Widget>[
                SizedBox(
                  width: 30.0,
                ),
                //Expandir al maximo
                Expanded(
                  child: DropdownButton(
                    
                    //Valor es la opcion seleccionada
                    value: _custodio,
                    items: _agregarDatosCustodio(snapshot.data),
                    //Actualizar el Dropdown y poner el texto seleccionado
                    onChanged: (opt) {
                      setState(() {
                        _custodio = opt;
                      });
                    },
                  ),
                )
              ],
            );
        }else{
            return Container(
              height: 400.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
        }

      }
    ); 
  }
  List<DropdownMenuItem<String>> _agregarDatosCustodio(data) {
    List<DropdownMenuItem<String>> lista = new List();
    
    lista.add(DropdownMenuItem(
      child: Text('Seleccione un custodio'),
      value: '',
    ));

    data.forEach((dato) {
      lista.add(DropdownMenuItem(
        child: Text(dato.nombre),
        value: dato.codCustodio.toString(),
      ));
    });

    return lista;
  }

}
