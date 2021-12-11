// ignore_for_file: no_logic_in_create_state, prefer_const_constructors

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
                      Text(menuInfo["price"].toString()),
                    ],
                  ),
                )
              ],
            ),
          ),
          menuInfo["subMenus"] == null ? Container() :  
          Expanded(
            child: FutureBuilder<Map>(
              future: getAllMenu(),
              builder: (context, snapshot) {              
                    if(snapshot.hasError){
                      return Center(child: Text("Hata"));
                    }else
                    {
                      if (snapshot.hasData) {
                        Map mapData = snapshot.requireData;
                        return ListView.builder(
                          itemCount: menuInfo["subMenus"].length,
                          itemBuilder: (context,index){
                            Map subMenuDetail = {};
                            for (var item in mapData["menus"]) {
                              if (item["key"] == menuInfo["subMenus"][index]) {
                                subMenuDetail = item;
                              }
                            }
                          return Material(
                            child: Column(
                              children: [
                                Text(menuInfo["subMenus"][index]),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: subMenuDetail["items"].length,
                                  itemBuilder: (context,index){
                                  return Text(subMenuDetail["items"][index]["name"] ?? subMenuDetail["items"][index]["caption"]);

                                })
                              ],
                            ),
                          );
                        });
                      }else{
                        return Center(child: CircularProgressIndicator(),);
                      }
                    }              
                    

                ///////////////////
                
              }
            ),
          )
        ],
      )
    );
  }
}