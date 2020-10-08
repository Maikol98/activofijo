import 'package:flutter/material.dart';
import 'package:softwareproject/src/pages/empleado/custodio.dart';
import 'package:softwareproject/src/pages/empleado/operador.dart';
import 'package:softwareproject/src/pages/empleado/responsable.dart';
import 'package:softwareproject/src/widgets/menu.dart';

class EmpleadoPage extends StatefulWidget {

  @override
  _EmpleadoPageState createState() => _EmpleadoPageState();
}

class _EmpleadoPageState extends State<EmpleadoPage> {

  int _currentIndex =0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Empleados'),
        centerTitle: true,
      ),
      drawer: MenuWidget(),
      bottomNavigationBar: _navigatorBar(),
      body: _callPage(_currentIndex),

    );
  }

  Widget _callPage(int index){
    switch (index) {
      case 1: return ResponsablePage(); 
      
      case 2: return CustodioPage();

        break;
      default:
        return OperadorPage();
    }
  }


  Widget _navigatorBar(){
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (value) {
        setState(() {
        _currentIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box),
          title: Text('Operador')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          title: Text('Responsable')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervisor_account),
          title: Text('Custodio')
        ),
      ],
    );
  }

}