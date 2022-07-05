import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'maple_exporter.dart';

/**
 * Corre la app
 */
void main() {
  //mantiene el splash screen puesto en lo que la app carga. Actualizar a Flutter 3
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(SplashScreen());
}

/**
 * Clase auxiliar para cargar los modulos
 */
class Init {
  Init._();

  static final instance = Init._();

  Future initialize() async {
    //await BrainUIModule.init();
    //await AppInfo.instance.initialize();
    //await Future.delayed(const Duration(seconds: 3));

    //elimina el splash screen cuando termina de cargar. Actualizar a Flutter 3
    //FlutterNativeSplash.remove();
  }
}

/**
 * 'Supuestamente' un Splash Screen en lo que cargar la inicializacion.
 * No deberia salir nunca xq se opaca con el splas screen nativo.
 */
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //aqui y no en el main por un posible bug en flutter, info at https://stackoverflow.com/questions/49418332/flutter-how-to-prevent-device-orientation-changes-and-force-portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return FadeIn(
            child: MapleMaterialApp(),
          );
        } else {
          //loading body
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

class MapleMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: MapleConfig.MAPLE_NAME,
      debugShowCheckedModeBanner: true,
      //--------------------- <RESPONSIVE> -----------------------------------
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(
          color: Colors.white,
        ),
      ),
      //--------------------- </RESPONSIVE> -----------------------------------
      //--------------------- <THEAMING> -----------------------------------
      theme: _buildTheme(),
      //--------------------- </THEAMING> -----------------------------------
      //--------------------- <PAGINATION> -----------------------------------
      initialRoute: DashboardScreen.ROUTE_NAME,
      getPages: [
        //agregar la lista dinamica por los modulos
        GetPage(
          name: DashboardScreen.ROUTE_NAME,
          page: () => DashboardScreen(),
          transition: Transition.fadeIn,
        ),
      ],
      unknownRoute: GetPage(
        name: UnknownRouteScreen.ROUTE_NAME,
        page: () => UnknownRouteScreen(),
      ),
      //--------------------- </PAGINATION> -----------------------------------
    );
  }

  ThemeData _buildTheme() {
    const String FONT_FAMILY_SLAB = "RobotoSlab";

    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,

      // Define the default brightness and colors.
      colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        primary: Color(0xff00a4db),
        secondary: Color(0xff002edb),
      ),

      // Define the default font family.
      fontFamily: FONT_FAMILY_SLAB,

      // Define the default `TextTheme`. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: const TextTheme(
        //utilizado para el texto principal del juego
        headline1: TextStyle(
          fontSize: 90,
          color: Color(0xff2a3762),
          shadows: [
            Shadow(
              color: Colors.blue,
              blurRadius: 10.0,
              offset: Offset(3.0, 3.0),
            ),
            Shadow(
              color: Colors.red,
              blurRadius: 10.0,
              offset: Offset(-3.0, 3.0),
            ),
          ],
        ),
        //utilizado para:
        // - el cargando
        // - los carteles de win/loose
        headline4: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 70,
        ),
        //utilizado para:
        // - el nombre de los modulos
        headline5: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 33,
        ),
        //utilizado para :
        // - el tile de la seleccion
        headline6: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 30,
        ),
        //utilizado para:
        // - el header del tutorial
        // - la letra inicial en el trivia
        subtitle1: TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
        ),
        //utilizado para:
        // - los header de los subniveles
        // - Los badges de los modulos en los botones iniciales
        // - los card con las letras en el ahorcado
        // - La pregunta en el trivia
        // - las respuestas en el trivia
        // - el texto en el appbar de cada modulo(sale todo por tools)
        // - el contador de estrellas de cada nivel(5 / 10 *)
        subtitle2: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
        //utilizado para:
        // - el texto del tutorial
        // - los segundos restantes en el contador de trivia
        bodyText1: TextStyle(
          fontSize: 20.0,
        ),
        //utilizado para:
        // - el texto de los subniveles
        bodyText2: TextStyle(
          fontSize: 15.0,
        ),
      ),
    );
  }
}
