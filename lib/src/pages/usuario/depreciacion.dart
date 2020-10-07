import 'package:flutter/material.dart';
import 'package:softwareproject/src/widgets/menu.dart';

class DepreciacionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drepeciacion'),
      ),
      drawer: MenuWidget(),
      body: Center(child: Text('hola'),),
    );
  }
}