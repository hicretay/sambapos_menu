import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:yaml/yaml.dart';
import "package:flutter/services.dart" as s;

  Future<dynamic> getAllMenu(BuildContext context)async{
    final data = await s.rootBundle.loadString("assets/menu.yaml");
    final mapData = loadYaml(data);
    return json.encode(mapData);    
     // print(mapData["menus"][0]["items"][0]["caption"]);
     //  print(mapData["menus"][0]["key"]);
  } 