import 'package:flutter/material.dart';
import 'package:tp1_flutter/accueil.dart';
import 'package:tp1_flutter/creation.dart';
import 'package:tp1_flutter/inscription.dart';
import 'package:tp1_flutter/main.dart';

import 'DTOs/transfer.dart';
import 'http.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {

  @override
  Widget build(BuildContext context) {

    final TextEditingController pseudoConnexion = TextEditingController();
    final TextEditingController mdpConnexion = TextEditingController();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Column(
          children: <Widget>[
            Expanded( // Deco card
              flex: 5,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: MyColorScheme.myTertiaryColor,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(400, 100))
                      ),

                      child: Column(
                        children: [
                          Expanded(
                            flex: 11,
                            child: Container(
                              decoration: BoxDecoration(
                                  color:  MyColorScheme.mySecondaryColor,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(300, 80))
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.deepOrangeAccent,
                                          borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(300, 80))
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 9,
                                            child: Container(
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                  color:  MyColorScheme.myPrimaryColor,
                                                  borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(300, 80))
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Bonjour!", textAlign: TextAlign.center, style: MyTypography.myDisplayStyleLight
                                                  ),
                                                  Text("Veuillez vous connecter.", textAlign: TextAlign.center, style: MyTypography.myBodyStyleLight,)
                                                ]
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded( // form
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 250,
                        width: 350,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [ // TODO : RECHECK FIELDS
                            TextFormField(
                              controller: pseudoConnexion,
                              decoration: InputDecoration(
                                hintStyle: MyTypography.myHintStyle,
                                labelStyle: MyTypography.myLabelStyle,
                                labelText: "Pseudo",
                                border: OutlineInputBorder(),
                                hintText: '2 carac. min.',
                              ),
                            ),
                            TextFormField(
                              controller: mdpConnexion,
                              decoration: InputDecoration(
                                hintStyle: MyTypography.myHintStyle,
                                labelStyle: MyTypography.myLabelStyle,
                                labelText: "Mot de passe",
                                border: OutlineInputBorder(),
                                hintText: '4 carac.min',

                              ),

                              obscureText: true,
                            ),

                          ],
                        ),


                      )
                    ],
                  ),
                  Row(
                    children: [
                      OutlinedButton(onPressed: () {
                        NavigationHelper().navigateTo(context, Inscription());
                      }, child: Text("Inscription", style: MyTypography.myBtnTextStyle)),
                      FilledButton(onPressed: () {
                        HttpHelper().Login(new SigninRequest(username: pseudoConnexion.text, password: mdpConnexion.text));
                        NavigationHelper().navigateTo(context, Accueil());
                      }, child: Text("Se connecter", style: MyTypography.myBtnTextStyle))
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  )

                ],

              ),
            ),
          ]
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
