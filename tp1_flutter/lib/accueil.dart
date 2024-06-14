import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tp1_flutter/http.dart';

import 'DTOs/transfer.dart';
import 'creation.dart';
import 'details.dart';
import 'main.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {

  List<HomeItemResponse> listeTask = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTask();

  }

  getAllTask() async {
    listeTask = await GetAllTasks();
    setState(() {

    });
    if(listeTask.isEmpty){
      Fluttertoast.showToast(msg: "Ajoutez votre première tâche!", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
    }
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child:
          ListView.builder(
              itemCount: listeTask.length,
              itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), // Add border radius here
                    color: MyColorScheme.myAccentColorPale,
                  ),
                  child: ListTile(
                    title: Text(
                        (listeTask[index].name).toString(), style: MyTypography.myHeadingStyle
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "${listeTask[index].deadline.day}/${listeTask[index].deadline.month}/${listeTask[index].deadline.year}",
                            style: MyTypography.myBodyStyleDark
                        ),
                        Text(
                            (listeTask[index].percentageTimeSpent.toString() + "% temps restant").toString(), style: MyTypography.myHintStyle
                        ),
                      ],
                    ),
                    trailing: Text(
                        (listeTask[index].percentageDone).toString() + "% fait", style: MyTypography.myLabelStyle
                    ),
                    onTap: () => NavigationHelper().navigateTo(context, Details(taskid: listeTask[index].id)),),
                );
              }
          ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigationHelper().navigateTo(context, Creation());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
