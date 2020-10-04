import 'package:flutter/material.dart';
import 'package:softwareproject/src/pages/navegation_revision_tecnica/mantenimiento/index_page.dart';
import 'package:softwareproject/src/pages/navegation_revision_tecnica/revision_tecnica/index_page.dart';
import 'package:softwareproject/src/widgets/menu.dart';

class NavegationRevisionTecnicaPage extends StatefulWidget {
  NavegationRevisionTecnicaPage({Key key}) : super(key: key);

  @override

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<NavegationRevisionTecnicaPage> {

  int positionIndex = 0;

  
  @override
  Widget build(BuildContext context) {

    //Probar el login
    //return LoginPage();

    //Descomentar esta seccion
    return Scaffold(
              
        appBar: AppBar(
          title: Text('Bitacora'),
        ),
        drawer: MenuWidget(),
        
        body: Center(
          child: getPage(),
        ),

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromRGBO(52, 57, 87, 1),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: _onItemTapped,
          currentIndex: positionIndex,
          items: [
            BottomNavigationBarItem(
              title: Text('Revision Tecnica'),
              icon: Icon(Icons.settings),
            ),
            BottomNavigationBarItem(
              title: Text('Mantenimiento'),
              icon: Icon(Icons.attach_money),
            ),
          ],
      ),
      floatingActionButton:FloatingActionButton(
        child: Icon( Icons.add ),
        onPressed: () {
          print("agregar");
        }
      )
      
    );
    
  }



  void _onItemTapped(int index) {
    setState(() {
      positionIndex = index;
    });
  }


  Widget getPage(){
    if (positionIndex == 0){
      return RevisionTecnicaPage();
    }else{
      return MantenimientoPage();
    }
  }
}
