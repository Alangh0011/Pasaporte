import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pasaporte_app/Login_Register/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  /* WidgetsFlutterBinding.ensureInitialized(): Asegura que el binding de los widgets esté inicializado. Esto es útil para realizar configuraciones antes de ejecutar la aplicación, especialmente si usas paquetes que requieren inicialización previa.*/
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  /*SystemChrome.setPreferredOrientations(...): Configura la orientación preferida de la pantalla. En este caso, la aplicación solo permitirá que el dispositivo esté en orientación vertical (retrato), tanto hacia arriba como hacia abajo. Esto evita que la aplicación se gire a orientación horizontal. */
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //debugShowCheckedModeBanner: false: Oculta el banner de "Debug" que aparece en la esquina superior derecha cuando la aplicación está en modo de depuración.
      title: 'Login',
      home: LoginPage(),
    );
    /*class MyApp extends StatelessWidget: Define una clase MyApp que extiende StatelessWidget, lo que significa que este widget no tiene estado mutable.*/
  }
}
