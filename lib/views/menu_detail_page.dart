// ignore_for_file: no_logic_in_create_state, prefer_const_constructors, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:sambapos_menu/settings/constants.dart';
import 'package:sambapos_menu/settings/functions.dart';

class MenuDetailPage extends StatefulWidget {
  final Map menuInfo;
  const MenuDetailPage({Key? key, required this.menuInfo}) : super(key: key);

  @override
  _MenuDetailPageState createState() => _MenuDetailPageState(menuInfo: menuInfo);
}

class _MenuDetailPageState extends State<MenuDetailPage> {
  Map menuInfo;
  Map<dynamic,int> radioValue={};
  void  setRadioValue(){
    for (var item in menuInfo["subMenus"]) {
      Map<dynamic,int> temp = {item:0};
      radioValue.addEntries(temp.entries);
    }
  }
  @override
  void initState() { 
    super.initState();
    setState(() {
    setRadioValue();
    });
  }
  _MenuDetailPageState({required this.menuInfo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
        centerTitle: true,
        title: Text(menuInfo["name"] +" "+ menuInfo["price"] + "TL".toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
        backgroundColor: appBarColor,
        elevation: defaultPadding),
      body: Column(
        children: [
          Material(
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(menuInfo["image"]),
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
                          itemBuilder: (context,groupIndex){
                            Map subMenuDetail = {};
                            for (var item in mapData["menus"]) {
                              if (item["key"] == menuInfo["subMenus"][groupIndex]) {
                                subMenuDetail = item;
                              }
                            }

                          return Material(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: defaultPadding),
                                  child: Text(subMenuDetail["description"],style: TextStyle(fontSize: 20),),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: subMenuDetail["items"].length,
                                  itemBuilder: (context,index){
                                    
                                  return RadioListTile(
                                    onChanged: (value) {                                          
                                          setState(() {
                                            radioValue[subMenuDetail["key"]] = value as int;
                                          });
                                        },
                                    groupValue: radioValue[subMenuDetail["key"]],
                                    value: index,
                                    title: Text(subMenuDetail["items"][index]["name"] ?? subMenuDetail["items"][index]["caption"]),
                                    // ignore: prefer_if_null_operators
                                    subtitle:  subMenuDetail["items"][index]["price"] == null ? Container() : Text(subMenuDetail["items"][index]["price"].toString()),
                                    secondary: Image.asset(subMenuDetail["items"][index]["image"]),
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    );
                                })
                              ],
                            ),
                          );
                        });
                      }else{
                        return Center(child: CircularProgressIndicator());
                    }
                }                             
              }
            ),
          )
        ],
      )
    );
  }
}