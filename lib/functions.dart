import 'package:yaml/yaml.dart';
import "package:flutter/services.dart" as s;

  Future<Map> getAllMenu() async{
    final data = await s.rootBundle.loadString("assets/menu.yaml");
    Map mapData = loadYaml(data); 
    return mapData;
  } 