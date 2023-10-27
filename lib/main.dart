import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:offline_hive/controller.dart';
import 'package:offline_hive/view_data.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main()
async {

  WidgetsFlutterBinding.ensureInitialized();
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDir.path);
  Hive.registerAdapter(controllerAdapter());
  var box = await Hive.openBox('student');

  runApp(MaterialApp(home: first(),));
}


class first extends StatefulWidget {
  controller ? c;
  first([this.c]);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();

  @override
  void initState() {

    if(widget.c != null)
      {
        t1.text=widget.c!.name;
        t2.text=widget.c!.contact;
      }
  }

  Box box=Hive.box("student");

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),

      body: Column(children: [
        TextField(
          controller: t1,
          decoration: InputDecoration(
              labelText: "Enter name"
          ),
        ),

        TextField(
          controller: t2,
          decoration: InputDecoration(
              labelText: "Enter contact"
          ),
        ),

        ElevatedButton(onPressed: () {

          String name=t1.text;
          String contact=t2.text;

         if(widget.c != null)
           {

             widget.c!.name=name;
             widget.c!.contact=contact;
             widget.c!.save();

           }
         else
           {
             controller c=controller(name,contact);
             box.add(c);
           }

        }, child: Text("Submit")),

        ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return view_data();
          },));

        }, child: Text("View"))

      ],),
    );
  }
}
