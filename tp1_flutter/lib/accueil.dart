import 'package:flutter/material.dart';
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
    listeTask = await HttpHelper().GetAllTasks();
    setState(() {

    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child:
          ListView.builder(
              itemCount: listeTask.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(
                      (listeTask[index].name).toString()
                  ),
                  onTap: () => NavigationHelper().navigateTo(context, Details(taskid: listeTask[index].id)),);
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
