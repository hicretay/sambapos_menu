// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sambapos_menu/functions.dart';
import 'package:sambapos_menu/model.dart';
import 'package:yaml/yaml.dart';
import "package:flutter/services.dart" as s;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map mapData = {};
  Future<bool> get getData async {
     final data = await s.rootBundle.loadString("assets/menu.yaml");
     mapData = loadYaml(data);
    return true;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: 
             Column(
              children: [
                FutureBuilder<bool>(
                  future: getData,
                  builder: (context, snapshot) {                    
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: mapData["menus"][0]['items'].length,
                      itemBuilder: (BuildContext context, int index){
                        print(getAllMenu(context));
                      return SizedBox(
                        child: ElevatedButton(onPressed: ()  {
                          print(mapData);
                        },
                        child: Text(mapData["menus"][0]['items'][index]["name"])
                        ),
                      ); 
                      //Text(Item.fromJson(loadYaml(snapshot.data.toString())[index]).caption); // ana kategoriler //mapData["menus"][index+1]["orderTag"]
                    });
                  }
                ),
                ],
            )
      ),
    );
  }
}