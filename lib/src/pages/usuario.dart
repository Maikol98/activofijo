import 'package:flutter/material.dart';
import 'package:softwareproject/src/widgets/menu.dart';

class UsuarioPage extends StatelessWidget {
  const UsuarioPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuario'),
      ),
      drawer: MenuWidget(),
      body: Center(child: Text('usuario')),
    );
  }
}