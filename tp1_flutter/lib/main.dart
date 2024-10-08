//import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tp1_flutter/connexion.dart';
import 'package:tp1_flutter/inscription.dart';

import 'DTOs/transfer.dart';

void main() {
  runApp(const MyApp());
}

class MyColorScheme extends ColorScheme{

  static const Color myPrimaryColor = Colors.redAccent;
  static const Color mySecondaryColor = Colors.orangeAccent;
  static const Color myTertiaryColor = Colors.yellow;
  static const Color myBackgroundColor = Colors.white;
  static const Color myAccentColor = Color(0xFFF8A9C8);
  static const Color myAccentColorPale = Color(0xFFFFD0E2);

  const MyColorScheme({
    // Set your custom colors as primary and secondary
    Color primary = myPrimaryColor,
    Color secondary = mySecondaryColor,

    // Include other color properties from the super class
    // such as background, surface, onBackground, etc.

  }) : super(background: myBackgroundColor, primary: myPrimaryColor, secondary: mySecondaryColor, tertiary: myTertiaryColor, brightness: Brightness.light, error: Colors.red, surface: myAccentColor, onPrimary: Colors.white, onBackground: myPrimaryColor, onSecondary: Colors.black, onError: Colors.white, onSurface: Colors.black);

}

class MyTypography {
  static const TextStyle myHeadingStyle = TextStyle(
    fontSize: 34, fontWeight: FontWeight.normal,
    fontFamily: "DMSerif",
    color: MyColorScheme.myPrimaryColor
  );

  static const TextStyle myDisplayStyleLight = TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.normal,
      fontFamily: "DMSerif",
    color: Colors.white
  );

  static const TextStyle myDisplayStyleDark = TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.normal,
      fontFamily: "DMSerif",
      color: Colors.black
  );

  static const TextStyle myLabelStyle = TextStyle(
    fontSize: 16,
    fontFamily: "OpenSans",
    color: MyColorScheme.myPrimaryColor
  );

  static const TextStyle myBtnTextStyle = TextStyle(
    fontSize: 16,
    fontFamily: "OpenSans",
  );

  static const TextStyle myHintStyle = TextStyle(
    fontSize: 12,
    fontFamily: "OpenSans",
    color: MyColorScheme.myPrimaryColor
  );

  static const TextStyle myBodyStyleDark = TextStyle(
    fontSize: 16,
    fontFamily: "OpenSans",
    color: Colors.black
  );

  static const TextStyle myBodyStyleLight = TextStyle(
      fontSize: 16,
      fontFamily: "OpenSans",
      color: Colors.white
  );

  static const TextStyle myBodyStyle = TextStyle(
      fontSize: 16,
      fontFamily: "OpenSans"
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      home: const Connexion(), // HOME PAGE
      routes: routes(),

      theme: ThemeData(
          colorScheme: MyColorScheme()

      ),

    );
  }


  Map<String, WidgetBuilder> routes(){ // DEFINE ROUTES
    return {
      '/connexion' : (context) => const Connexion(),
      //  INPUT PAGE ROUTE
      // '/result' : (Context) => const ResultPage() // RESULT PAGE ROUTE
    };
  }
}


class NavigationHelper {
  navigateTo(BuildContext context, StatefulWidget page){
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => page
      ),
    );
  }

  home(BuildContext context){
    Navigator.of(context).popUntil((route)=> false);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const Connexion()
      ),
    );
  }

}

