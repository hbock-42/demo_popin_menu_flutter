import 'package:demo_poping_menu/animated_transition/animated_transition_launcher.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color.fromRGBO(17, 137, 89, 1.0);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme(
              background: Colors.orange,
              brightness: Brightness.light,
              error: Colors.red,
              onBackground: Colors.white,
              onError: Colors.white,
              primary: Colors.white,
              onPrimary: Color.fromRGBO(90, 90, 90, 1),
              secondary: Colors.white,
              onSecondary: Color.fromRGBO(90, 90, 90, 1),
              surface: Color.fromRGBO(234, 234, 234, 1),
              onSurface: Color.fromRGBO(90, 90, 90, 1),
              primaryVariant: Color.fromRGBO(207, 207, 207, 1),
              secondaryVariant: Color.fromRGBO(207, 207, 207, 1)),
          primarySwatch: Colors.blue,
          primaryColor: primaryColor,
          primaryColorDark: Colors.green,
          primaryColorLight: Colors.green,
          primaryColorBrightness: Brightness.light,
          primaryTextTheme: TextTheme(
            headline: TextStyle(
                color: Color.fromRGBO(82, 92, 142, 1.0),
                fontSize: 30,
                fontWeight: FontWeight.w900,
                height: 1.0),
            title: TextStyle(color: Colors.green),
            subhead: TextStyle(color: Colors.green),
            body2: TextStyle(
              color: Color.fromRGBO(82, 92, 152, 1.0),
              fontSize: 18,
              height: 1.5,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.9,
            ),
            body1: TextStyle(
              color: Color.fromRGBO(82, 92, 152, 0.7),
              fontSize: 18,
              height: 1.5,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.9,
            ),
            subtitle: TextStyle(
              color: Color.fromRGBO(82, 92, 152, 1.0),
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.9,
            ),
            overline: TextStyle(color: Colors.green),
            button: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2,
            ),
          ),
          textTheme: TextTheme(
            headline: TextStyle(
                color: Color.fromRGBO(82, 92, 142, 1.0),
                fontSize: 40,
                decoration: TextDecoration.underline,
                decorationColor: primaryColor,
                fontWeight: FontWeight.w600,
                height: 1.4),
            title: TextStyle(
                color: Color.fromRGBO(82, 92, 152, 0.8),
                fontSize: 24,
                height: 1.4),
            subtitle: TextStyle(
                color: Color.fromRGBO(82, 92, 152, 0.5),
                fontSize: 22,
                height: 1.4),
            subhead: TextStyle(color: Colors.green),
            body2: TextStyle(color: Color.fromRGBO(82, 92, 152, 0.5)),
            body1: TextStyle(
              color: Color.fromRGBO(82, 92, 152, 0.7),
              fontSize: 18,
            ),
            overline: TextStyle(color: Colors.green),
            button: TextStyle(color: Colors.green),
          ),
          accentTextTheme: TextTheme(
            headline: TextStyle(color: Colors.green),
            title: TextStyle(color: Colors.green),
            subhead: TextStyle(color: Colors.green),
            body2: TextStyle(color: Colors.green),
            body1: TextStyle(color: Colors.green),
            subtitle: TextStyle(color: Colors.green),
            overline: TextStyle(color: Colors.green),
            button: TextStyle(color: Colors.green),
          )),
      home: Material(
        child: AnimatedTransitionLauncher(),
      ),
    );
  }
}
