import 'package:flutter/material.dart';
import 'package:softwareproject/src/widgets/menu.dart';

class EmpleadoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Empleados'),
        centerTitle: true,
      ),
      drawer: MenuWidget(),
      body: Center(child: Text('hola')),
    );
  }
}