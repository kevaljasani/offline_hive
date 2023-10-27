import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:offline_hive/controller.dart';
import 'package:offline_hive/main.dart';

class view_data extends StatefulWidget {
  const view_data({super.key});

  @override
  State<view_data> createState() => _view_dataState();
}

class _view_dataState extends State<view_data> {

 Box box=Hive.box("student");
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),

      body: ListView.builder(
        itemBuilder: (context, index) {

          controller c=box.getAt(index);
        return Card(
          child: ListTile(
            title: Text("${c.name}"),
            trailing: Wrap(
              children: [
                IconButton(onPressed: () {

                  box.deleteAt(index);
                  setState(() {

                  });
                }, icon: Icon(Icons.delete)),

                IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return first(c);
                  },));

                }, icon: Icon(Icons.edit))
              ],
            ),
          ),
        );
      },),
    );
  }
}
