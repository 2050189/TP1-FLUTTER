import 'package:flutter/material.dart';
import 'package:tp1_flutter/DTOs/transfer.dart';
import 'package:tp1_flutter/http.dart';
import 'package:tp1_flutter/main.dart';

import 'accueil.dart';
import 'creation.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.taskid});

  final int taskid;


  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  String nameOfTask = "";

  int _currentSliderValue = 0;

  double timeLeftPerc = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetTask();
  }

  GetTask()    async{
    TaskDetailResponse tdr = await SeeTask(widget.taskid);
    setState(() {

    });
    nameOfTask = tdr.name;
    _currentSliderValue = tdr.percentageDone;
    timeLeftPerc = tdr.percentageTimeSpent;
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.white,
    ),
      drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: MyColorScheme.myPrimaryColor,
                  ),
                  child: Text(
                    "Salut, "+
                        SingletonDIO.pseudoSingleton+"!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  title: Text("Accueil"),
                  onTap: () async {
                    await NavigationHelper().navigateTo(context, Accueil());
                  }
                  ,
                ),
                ListTile(
                  title: Text("Création d'une tâche"),
                  onTap: () async{
                    await NavigationHelper().navigateTo(context, Creation());
                  }
                  ,
                ),
                ListTile(
                  title: Text("Déconnexion"),
                  onTap: () async {
                    await Logout();
                    await NavigationHelper().home(context);
                  }
                  ,
                )
              ]
          )
      ),
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
                  nameOfTask, textAlign: TextAlign.center, style: MyTypography.myDisplayStyleDark,
                ),
                Text(
                  "Temps restant : "+ timeLeftPerc.toString()+"%", textAlign: TextAlign.center, style: MyTypography.myHeadingStyle,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pourcentage fait : "+_currentSliderValue.toString()+"%", textAlign: TextAlign.center, style: MyTypography.myBodyStyleDark,
                    ),
                    Slider(
                      value: _currentSliderValue.toDouble(),
                      min: 0,
                      max: 100,
                      divisions: 20,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value.toInt();
                        });
                      },
                    ),
                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    TextButton(onPressed: (){
                      NavigationHelper().navigateTo(context, Accueil());
                    }, child: Text("Retour", style: MyTypography.myBodyStyle,)),
                    FilledButton(onPressed: () async{
                      await ChangeProgress(widget.taskid, _currentSliderValue.toInt());
                      NavigationHelper().navigateTo(context, Accueil());
                    }, child: Text(
                      "Modifier le progrès", style: MyTypography.myBodyStyleLight,
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