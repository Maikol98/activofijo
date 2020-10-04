import 'package:flutter/material.dart';
import 'package:softwareproject/src/pages/bitacora_page.dart';
import 'package:softwareproject/src/pages/home.dart';
import 'package:softwareproject/src/pages/login.dart';
import 'package:softwareproject/src/pages/tranferencia/create_page.dart';
import 'package:softwareproject/src/pages/tranferencia/index_page.dart';
import 'package:softwareproject/src/pages/usuario.dart';
import 'package:softwareproject/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

 
void main() async { 

  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final prefs = new PreferenciasUsuario();
    //print(prefs.codigoUsuario);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English, no country code
        const Locale('es', 'ES'), 
      ],
      title: 'Software',

      initialRoute: 'login',

      routes:{
        'login'                 : (BuildContext context) => LoginPage(),
        'home'                  : (BuildContext context) => HomePage(),
        'usuario'               : (BuildContext context) => UsuarioPage(),
        'bitacora'              : (BuildContext context) => BitacoraPage(),
        'tranferencia'          : (BuildContext context) => TranferenciaPage(),
        'tranferencia/create'   : (BuildContext context) => CreateTranferenciaPage()
      },
    );
  }
}