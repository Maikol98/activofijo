import 'package:flutter/material.dart';
import 'package:softwareproject/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:softwareproject/src/providers/activoFijo_provider.dart';
import 'package:softwareproject/src/widgets/menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ActivoFijoProvider activoFijoProvider = new ActivoFijoProvider();
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Activo Fijos'),
      ),
      drawer: MenuWidget(),
      body: Center(child: Text('sad')),
    );
  }

}