import 'package:flutter/material.dart';
import 'package:softwareproject/src/pages/bitacora_page.dart';
import 'package:softwareproject/src/pages/home.dart';
import 'package:softwareproject/src/pages/login.dart';
import 'package:softwareproject/src/pages/navegation_revision_tecnica/baja/create_page.dart';
import 'package:softwareproject/src/pages/navegation_revision_tecnica/create_page.dart';
import 'package:softwareproject/src/pages/navegation_revision_tecnica/index_page.dart';
import 'package:softwareproject/src/pages/navegation_revision_tecnica/mantenimiento/create_page.dart';
import 'package:softwareproject/src/pages/navegation_revision_tecnica/revaluo/createMantenimiento_page.dart';
import 'package:softwareproject/src/pages/navegation_revision_tecnica/revaluo/createRevision_page.dart';
import 'package:softwareproject/src/pages/tranferencia/create_page.dart';
import 'package:softwareproject/src/pages/tranferencia/index_page.dart';
import 'package:softwareproject/src/pages/usuario.dart';
import 'package:softwareproject/src/pages/usuario/depreciacion.dart';
import 'package:softwareproject/src/pages/usuario/usuario.create.dart';
import 'package:softwareproject/src/pages/usuario/usuario_edit.dart';
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
    print(prefs.codigoUsuario);
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English, no country code
        const Locale('es', 'ES'), 
      ],
      debugShowCheckedModeBanner: false,
      title: 'Software',

      initialRoute: 'login',

      routes:{
        'login'                 : (BuildContext context)=>LoginPage(),
        'home'                  : (BuildContext context)=>HomePage(),
        'usuario'               : (BuildContext context)=>UsuarioPage(),
        'crearusuario'          : (BuildContext context)=>UsuarioCreate(),
        'editusuario'           : (BuildContext context)=>UsuarioEdit(),
        'depreciacion'          : (BuildContext context)=>DepreciacionPage(),
        'bitacora'              : (BuildContext context) => BitacoraPage(),
        'tranferencia'          : (BuildContext context) => TranferenciaPage(),
        'tranferencia/create'   : (BuildContext context) => CreateTranferenciaPage(),
        'revisionTecnica'       : (BuildContext context) => NavegationRevisionTecnicaPage(),
        'revisionTecnica/create': (BuildContext context) => CreateRevisionTecnicaPage(),
        'baja/create'           : (BuildContext context) => CreateBajaPage(),
        'revaluoRevision/create': (BuildContext context) => CreateRevaluoRevisionPage(),
        'revaluoRManteni/create': (BuildContext context) => CreateRevaluoMantenimientoPage(),
        'Mantenimieto/create'   : (BuildContext context) => CreateMantenimientoPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurple[800]
      ),
    );
  }
}