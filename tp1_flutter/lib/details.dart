import 'package:flutter/material.dart';
import 'package:tp1_flutter/main.dart';

class Details extends StatefulWidget {
  const Details({super.key});

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
            margin: EdgeInsets.fromLTRB(10, 50, 10, 50),
            decoration: BoxDecoration(
                color: MyColorScheme.mySecondaryColor,
                borderRadius: BorderRadius.circular(20)
            ),
          ),
            flex: 10,
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}