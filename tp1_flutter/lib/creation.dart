import 'package:flutter/material.dart';
import 'package:tp1_flutter/DTOs/transfer.dart';
import 'package:tp1_flutter/accueil.dart';
import 'package:tp1_flutter/main.dart';

import 'http.dart';

class Creation extends StatefulWidget {
  const Creation({super.key});

  @override
  State<Creation> createState() => _CreationState();
}

class _CreationState extends State<Creation> {

  final TextEditingController nomTask = TextEditingController();

  DateTime selectedDate = DateTime.now();

  String formattedDate = "";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8), // limite inf de date
        lastDate: DateTime(2101)); // limite sup de date
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formattedDate = selectedDate.day.toString() +"/"+ selectedDate.month.toString() +"/"+ selectedDate.year.toString();
      });
    }
  }

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
              color: MyColorScheme.myAccentColorPale,
              borderRadius: BorderRadius.circular(20),
                border: Border.all(color: MyColorScheme.myAccentColor)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Créer une tâche", textAlign: TextAlign.center, style: MyTypography.myHeadingStyle,
                ),
                TextFormField(
                  controller: nomTask,
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
                OutlinedButton(onPressed: () => _selectDate(context), child:
                Text(
                  "Sélectionnez une date de fin", style: MyTypography.myBodyStyle,
                )),
                Text(formattedDate, style: MyTypography.myBodyStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    TextButton(onPressed: (){
                      NavigationHelper().navigateTo(context, Accueil());
                    }, child: Text("Retour", style: MyTypography.myBodyStyle,)),
                    ElevatedButton(onPressed: () async{
                      await CreateTask(new AddTaskRequest(name: nomTask.text, deadline: selectedDate));
                      NavigationHelper().navigateTo(context, Accueil());
                    }, child: Text(
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