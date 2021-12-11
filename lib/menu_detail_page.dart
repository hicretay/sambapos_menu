// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:sambapos_menu/extensions.dart';
import 'package:sambapos_menu/functions.dart';

class MenuDetailPage extends StatefulWidget {
  final Map menuInfo;
  const MenuDetailPage({Key? key, required this.menuInfo}) : super(key: key);

  @override
  _MenuDetailPageState createState() => _MenuDetailPageState(menuInfo: menuInfo);
}

class _MenuDetailPageState extends State<MenuDetailPage> {
  Map menuInfo;

  _MenuDetailPageState({required this.menuInfo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(menuInfo["name"]),
      ),
      body: Column(
        children: [
          Material(
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(menuInfo["image"]),
                Container(
                  child: Column(
                    children: [
                      Text(menuInfo["caption"]),
                      Text(menuInfo["price"]),
                    ],
                  ),
                )
              ],
            ),
          ),
          menuInfo["subMenus"] == null ? Container() :  
          Expanded(
            child: ListView.builder(
              itemCount: menuInfo["subMenus"].length,
              itemBuilder: (context,index){
              return Container(
                child: Text(menuInfo["subMenus"][index]),
              );
            }),
          )
        ],
      )
    );
  }
}