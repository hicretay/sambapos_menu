// ignore_for_file: prefer_const_constructors_in_immutables, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:sambapos_menu/extensions.dart';
import 'package:sambapos_menu/menu_detail_page.dart';

class HomeDetailPage extends StatefulWidget {
  final dynamic menuDetail; 
  HomeDetailPage({Key? key,@required this.menuDetail}) : super(key: key);

  @override
  _HomeDetailPageState createState() => _HomeDetailPageState(menuDetail: menuDetail);
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  dynamic menuDetail;

  _HomeDetailPageState({this.menuDetail});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: menuDetail.length,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: EdgeInsets.all( ScreenSizes(context).height*0.02),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuDetailPage(menuInfo: menuDetail[index])));

              }, 
              child: Column(
              children: [
                Image.asset(menuDetail[index]["image"],
                 height: ScreenSizes(context).height*0.3,
                 ),
                Text(menuDetail[index]["name"]),
              ],
            )),
          );
        }),
    );
  }
}