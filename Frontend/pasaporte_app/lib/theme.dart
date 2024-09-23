import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*dart:ui: Importa la biblioteca de Dart para trabajar con gráficos y operaciones de UI a nivel bajo. Aquí se usa para definir colores.
flutter/cupertino.dart: Importa los widgets y elementos de diseño de Cupertino (iOS), pero en este caso, solo se usa para que el archivo pueda ser parte de un proyecto Flutter. En realidad, no se están utilizando widgets Cupertino directamente en este archivo. */

class CustomTheme {
  const CustomTheme();

  static const Color loginGradientStart = Color(0xFF742280);
  static const Color loginGradientEnd = Color(0xFFFF3EA2);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: <Color>[loginGradientStart, loginGradientEnd],
    stops: <double>[0.0, 1.0], /* Define en qué puntos del gradiente los colores deben estar. 0.0 es el inicio del gradiente y 1.0 es el final. En este caso, el gradiente comienza con loginGradientStart y termina con loginGradientEnd. */
    begin: Alignment.topCenter,//Define el punto de inicio del gradiente. En este caso, el gradiente comienza en la parte superior del contenedor.
    end: Alignment.bottomCenter,//usa estos colores y define cómo se interpolan entre el inicio y el final del gradiente.
  );
} /*static const LinearGradient primaryGradient: Define un gradiente lineal como una constante estática. El gradiente se utiliza para crear efectos visuales más complejos y agradables. */

/*
Anaranjado ff6f20
Morado 742280
Rosa ff3ea2
Verde Competencias 228673
Verde Fábrica c1ea4e
 */