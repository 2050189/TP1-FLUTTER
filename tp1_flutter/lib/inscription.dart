import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tp1_flutter/connexion.dart';

import 'main.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {


  final TextEditingController pseudo = TextEditingController();
  final TextEditingController mdp = TextEditingController();
  final TextEditingController conf = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        color: MyColorScheme.myPrimaryColor,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(400, 100))
                    ),

                    child: Column(
                      children: [
                      Expanded(
                      flex: 11,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(300, 80))
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: MyColorScheme.mySecondaryColor,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(300, 80))
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 9,
                                      child: Container(
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                            color: MyColorScheme.myTertiaryColor,
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(300, 80))
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Bienvenue!", textAlign: TextAlign.center, style: MyTypography.myDisplayStyleDark,
                                            ),
                                            Text("Veuillez vous inscrire.", textAlign: TextAlign.center, style: MyTypography.myBodyStyleDark,)
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
          Expanded(// form
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
                            controller: pseudo,
                            decoration: InputDecoration(
                              hintStyle: MyTypography.myHintStyle,
                              labelStyle: MyTypography.myLabelStyle,
                              labelText: "Pseudo",
                              border: OutlineInputBorder(),
                              hintText: '2 carac. min.',
                            ),
                          ),
                          TextFormField(
                            controller: mdp,
                            decoration: InputDecoration(
                              hintStyle: MyTypography.myHintStyle,
                              labelStyle: MyTypography.myLabelStyle,
                              labelText: "Mot de passe",
                              border: OutlineInputBorder(),
                              hintText: '4 carac.min',

                            ),

                            obscureText: true,
                          ),
                          TextFormField(
                            controller: conf,
                            decoration: InputDecoration(
                              hintStyle: MyTypography.myHintStyle,
                              labelStyle: MyTypography.myLabelStyle,
                              labelText: "Confirmez le mot de passe",
                              border: OutlineInputBorder(),
                              hintText: 'Confirmation',
                            ),
                            obscureText: true,
                          ),

                        ],
                      ),


                    )
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      OutlinedButton(onPressed: () {
                        NavigationHelper().home(context);
                      }, child: Text("Connexion", style: MyTypography.myBtnTextStyle)),
                      FilledButton(onPressed: () {
                        NavigationHelper().navigateTo(context, Inscription()); //TODO : CHANGE TO HOME PAGE
                      }, child: Text("S'inscrire", style: MyTypography.myBtnTextStyle))
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
