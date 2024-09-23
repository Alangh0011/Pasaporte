import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pasaporte_app/theme.dart'; //Colores
import 'package:pasaporte_app/Login_Register/WaveClipper.dart'; //ClipPath

/*
  LoginPage: Es un widget con estado (StatefulWidget) que sirve como la página principal para la pantalla de inicio de sesión y registro.
createState(): Crea una instancia del estado asociado con este widget (_LoginPageState).
 */
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

/*_LoginPageState es la clase que contendrá toda la lógica del estado de tu página de login, incluyendo lo que se mostrará en la pantalla, las funciones de manejo de eventos (como los clics de botón), y las actualizaciones de la interfaz. */

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }
  /*
  - _LoginPageState: La clase que maneja el estado de LoginPage.
  - SingleTickerProviderStateMixin: Permite a la clase proporcionar un Ticker (utilizado para animaciones) para la PageController.
  - PageController _pageController: Controlador para la paginación de vistas (como las páginas de inicio de sesión y registro).
  - Color left y Color right: Colores usados para indicar qué página está activa en la barra de menú.
  - dispose(): Limpia los recursos cuando el widget se elimina de la jerarquía de widgets. Aquí, se asegura de que el PageController se libere adecuadamente.
  - initState(): Inicializa el PageController cuando el estado se crea.
   */
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) { //Este es el método que construye (renderiza) el widget en la pantalla. El context proporciona información sobre el árbol de widgets
    return Scaffold(/*Scaffold es un widget que Flutter proporciona para crear una estructura básica de página. Contiene los elementos de UI comunes de las aplicaciones, como el AppBar, body, FloatingActionButton, etc. En este caso, estás definiendo solo el body de la pantalla. */
      body: SingleChildScrollView( //SingleChildScrollView es un widget que permite desplazarse verticalmente por su contenido. Aquí, se utiliza para permitir el desplazamiento de la pantalla si el contenido es demasiado grande para caber en la pantalla. Como en formularios largos.
      physics: const ClampingScrollPhysics(),//ClampingScrollPhysics es un tipo de ScrollPhysics que no permite que el contenido se desplace más allá de sus límites. Aquí, se utiliza para evitar que el contenido se desplace más allá de los límites de la pantalla.
      child: GestureDetector(//GestureDetector es un widget que detecta gestos del usuario, como taps, swipes, etc. En este caso, está detectando el gesto de tocar la pantalla. Cuando se toca la pantalla, se oculta el teclado.
          onTap: () {//onTap: es la función que se ejecuta cuando el usuario toca cualquier parte de la pantalla que esté cubierta por este widget. 
          // En este caso, cuando el usuario toque la pantalla, llamará a la siguiente función:
          FocusScope.of(context).requestFocus(FocusNode());// es una función para ocultar el teclado cuando el usuario toque fuera de un campo de texto. En los formularios de login, es común que, después de escribir en un campo, el teclado quede abierto hasta que el usuario toque otra parte de la pantalla. Este código detecta cuando el usuario toca fuera de un campo de texto y oculta el teclado automáticamente.
        },

        /*En resumen, el Container está configurado para ocupar toda la pantalla del dispositivo. */

        child: Container( //Container es un widget de Flutter que actúa como un contenedor flexible. Puedes utilizarlo para aplicar estilo, definir tamaño, agregar márgenes, bordes, colores, etc.
          width: MediaQuery.of(context).size.width, //width: MediaQuery.of(context).size.width: Aquí estás obteniendo el ancho de la pantalla del dispositivo en tiempo real. MediaQuery.of(context) te da acceso a la información sobre el tamaño de la pantalla (y otros detalles del dispositivo). Así, el contenedor ocupará todo el ancho de la pantalla.
          height: MediaQuery.of(context).size.height,//height: MediaQuery.of(context).size.height: Similar a lo anterior, esto hace que el contenedor ocupe todo el alto de la pantalla.
          decoration: const BoxDecoration( //decoration: const BoxDecoration: Aquí estás aplicando un gradiente de color al contenedor. Un gradiente es una transición suave entre dos o más colores. En este caso, el gradiente va desde CustomTheme.loginGradientStart a CustomTheme.loginGradientEnd.
            gradient: LinearGradient(
                colors: <Color>[
                  CustomTheme.loginGradientStart, //CustomTheme.loginGradientStart: Este es un color personalizado que define el punto de inicio del gradiente.
                  CustomTheme.loginGradientEnd //CustomTheme.loginGradientEnd: Este es un color personalizado que define el punto final del gradiente.

                  /*Estos colores estan definidos en theme.dart */

                ],
                begin: FractionalOffset(0.0, 0.0), // El gradiente comienza en la esquina superior izquierda de la pantalla (punto 0,0).
                end: FractionalOffset(1.0, 1.0),//El gradiente termina en la esquina inferior derecha de la pantalla (punto 1,1). Esto significa que el gradiente cubre toda la pantalla de esquina a esquina, creando un efecto diagonal.
                stops: <double>[0.0, 1.0], //stops: <double>[0.0, 1.0]: El primer color (loginGradientStart) se aplica en el 0% del recorrido y el segundo color (loginGradientEnd) en el 100%.
                tileMode: TileMode.clamp), //tileMode: TileMode.clamp: Define cómo se repite el gradiente si no llena el espacio. TileMode.clamp asegura que el gradiente se estire para llenar el espacio sin repetirse.

          ),

          /*El Column es un widget que organiza a sus hijos en una columna vertical. Los widgets que se pasan como hijos (usando el parámetro children) se apilan verticalmente, uno encima del otro. */

          child: Column(
            mainAxisSize: MainAxisSize.max, //mainAxisSize: MainAxisSize.max: Esto controla cómo el Column ocupa el espacio en su eje principal, que en este caso es vertical. MainAxisSize.max significa que el Column ocupará el máximo espacio disponible en su contenedor.
            children: <Widget>[
            /* Aquí, los hijos del Column son una lista de widgets (en este caso dos widgets), que se mostrarán de manera vertical. */
/*
            /*Primer hijo: Padding con una imagen (SE REMPLAZO POR CLIPPATH*/
              Padding(
                padding: const EdgeInsets.only(top: 75.0),//Padding: Añade un espacio (margen interno) alrededor del widget hijo. Aquí, el Padding está añadiendo 75 píxeles de espacio en la parte superior (con el parámetro top) antes de mostrar la imagen.
                child: Image(//Image: Un widget que muestra una imagen. Aquí, se muestra el logotipo de la aplicación.
                    height: //height: MediaQuery.of(context).size.height > 800 ? 191.0 : 150: Está ajustando la altura de la imagen dependiendo del tamaño de la pantalla. Si la altura de la pantalla es mayor a 800 píxeles, la imagen tendrá una altura de 191 píxeles; si no, tendrá una altura de 150 píxeles. Esto asegura que la imagen se escale según el tamaño del dispositivo.
                        MediaQuery.of(context).size.height > 800 ? 191.0 : 150,
                    fit: BoxFit.fill, //BoxFit.fill: Este atributo ajusta cómo la imagen se adapta a su contenedor. BoxFit.fill significa que la imagen ocupará completamente el contenedor, estirándose si es necesario.
                    image: const AssetImage('assets/img/login_logo.png')),
              ),
*/             
              /*Primer hijo: ClipPath con una imagen y un texto */
              /*ClipPath es un widget que te permite recortar su hijo (en este caso, el Container) en una forma personalizada. Esto es útil cuando quieres que el contenedor tenga un borde no rectangular, como en este caso con un borde ondulado. */
              ClipPath(
                //WaveClipper(): Se exporta la clase WaveClipper() de WaveClipper.dart
                clipper: WaveClipper(), // Clase personalizada para crear la forma ondulada
                child: Container( // Aquí, se ajusta el tamaño y el color de fondo del contenedor.
                  width: MediaQuery.of(context).size.width, //Establece el ancho del Container igual al ancho total de la pantalla del dispositivo.
                  height: MediaQuery.of(context).size.height * 0.31, // Establece la altura del Container como el 31% de la altura total de la pantalla del dispositivo. Esto asegura que el Container se ajuste bien en diferentes pantallas, manteniendo una proporción adecuada.
                  color: Colors.lightGreenAccent, // Fondo verde claro
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0), // Aquí, añade un espacio de 20 píxeles en la parte superior (top: 20.0). Esto empuja el contenido (texto e imagen) un poco hacia abajo.
                    child: Column( // Usa Column para organizar el texto y la imagen verticalmente
                      mainAxisAlignment: MainAxisAlignment.center, //mainAxisAlignment: MainAxisAlignment.center: Centra verticalmente el contenido dentro del Column. Esto asegura que el título y la imagen estén alineados en el centro vertical de la sección.
                      children: [
                        Text(
                          'Login', // El título encima de la imagen
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20.0), // Espacio entre el texto y la imagen
                        Image(
                          height: MediaQuery.of(context).size.height > 800 ? 191.0 : 150,
                          fit: BoxFit.fill,
                          image: const AssetImage('assets/img/login_logo.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


              /*Segundo hijo: Padding con un menú */
              Padding(
                padding: const EdgeInsets.only(top: 20.0), // Añade un espacio de 20 píxeles en la parte superior del menú.
                child: _buildMenuBar(context), //Esta es una llamada a un método que construye y retorna un widget que actúa como barra de menú. Este widget probablemente contiene botones o elementos interactivos que permiten al usuario alternar entre la pantalla de "Iniciar sesión" y "Registrarse".
                //Este viene en otro paquete ------
              ),

              /*Tercer hijo: PageView con dos páginas (Iniciar sesión y Registrarse) */
              Expanded( // Este widget se utiliza para expandir su hijo (en este caso el PageView
                flex: 2, //indica que este widget debe tomar dos partes del espacio disponible, en comparación con otros posibles Expanded o Flexible widgets en la misma Column.
                child: PageView( //PageView: Este widget permite deslizar entre diferentes páginas horizontalmente. Es común en los flujos de UI donde se pueden deslizar vistas como "Iniciar sesión" y "Registrarse".
                  controller: _pageController, //controller: _pageController: Usa un PageController para controlar qué página está visible. Esto es útil para la animación entre páginas y para mantener un control programático de la vista visible. Su clase viene abajo
                  physics: const ClampingScrollPhysics(), //physics: ClampingScrollPhysics(): Define cómo se siente el desplazamiento. ClampingScrollPhysics impide que el contenido rebote

                  /* onPageChanged: (int i): Este callback se invoca cuando cambia la página visible. Aquí, se usa para ajustar los colores de los indicadores (posiblemente en la barra de menú) para reflejar cuál página (SignIn o SignUp) está activa. Cambia los colores de las variables left y right según la página activa. */
                  onPageChanged: (int i) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (i == 0) {
                      setState(() {
                        right = Colors.white;
                        left = Colors.black;
                      });
                    } else if (i == 1) {
                      setState(() {
                        right = Colors.black;
                        left = Colors.white;
                      });
                    }
                  },
                  children: <Widget>[
                    /* ConstrainedBox: Este widget aplica restricciones a sus hijos, en este caso, se utiliza para expandir los widgets hijos (SignIn y SignUp) para llenar todo el espacio disponible dado por el PageView. BoxConstraints.expand() hace que el hijo (la página de SignIn o SignUp) llene todo el espacio disponible, asegurando que cada página ocupe todo el viewport del PageView.*/
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: SignIn(),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: SignUp(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

/*ME QUEDE AQUI */
  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: const BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: BubbleIndicatorPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onSignInButtonPress,
                child: Text(
                  'Existing',
                  style: TextStyle(
                      color: left,
                      fontSize: 16.0,
                      fontFamily: 'WorkSansSemiBold'),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onSignUpButtonPress,
                child: Text(
                  'New',
                  style: TextStyle(
                      color: right,
                      fontSize: 16.0,
                      fontFamily: 'WorkSansSemiBold'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  
  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}



