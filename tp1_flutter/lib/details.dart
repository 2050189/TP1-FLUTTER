import 'package:flutter/material.dart';
import 'package:tp1_flutter/main.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.taskid});

  final int taskid;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child:
          Container(
            margin: EdgeInsets.fromLTRB(10, 80, 10, 80),
            padding: EdgeInsets.fromLTRB(15, 30, 15, 30),
            decoration: BoxDecoration(
                color: MyColorScheme.myTertiaryColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: MyColorScheme.myPrimaryColor)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "DETAILS", textAlign: TextAlign.center, style: MyTypography.myHeadingStyle,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintStyle: MyTypography.myHintStyle,
                      labelStyle: MyTypography.myLabelStyle,
                      labelText: "Nom de la tâche",
                      border: OutlineInputBorder(
                      ),
                      hintText: 'Ex: Examen de math',
                      fillColor: Colors.white,
                      filled: true
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    TextButton(onPressed: (){
                      //TODO : NAVIGATION
                    }, child: Text("Retour", style: MyTypography.myBodyStyle,)),
                    ElevatedButton(onPressed: (){}, child: Text(
                      "Créer la tâche", style: MyTypography.myBodyStyleLight,
                    ))
                  ],
                )

              ],
            ),
          ),
            flex: 10,
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}