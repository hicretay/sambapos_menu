// ignore_for_file: prefer_const_constructors_in_immutables, no_logic_in_create_state, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:sambapos_menu/settings/constants.dart';
import 'package:sambapos_menu/views/menu_detail_page.dart';
import 'package:sambapos_menu/widgets/menu_card_widget.dart';
// ignore: must_be_immutable
class HomeDetailPage extends StatefulWidget {
  final dynamic menuDetail; 
  String pageTitle;
  HomeDetailPage({Key? key, required this.menuDetail, required this.pageTitle}) : super(key: key);

  @override
  _HomeDetailPageState createState() => _HomeDetailPageState(menuDetail: menuDetail, pageTitle: pageTitle);
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  dynamic menuDetail;
  String pageTitle;

  _HomeDetailPageState({this.menuDetail, required this.pageTitle});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(pageTitle,style: TextStyle(color: Colors.white,fontSize: 25),),
        backgroundColor: appBarColor,
        elevation: defaultPadding),
      body: ListView.builder(
        itemCount: menuDetail.length,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: 
            
            InkWell(
              onTap:  menuDetail[index]["subMenus"] == null ? (){} :
              (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuDetailPage(menuInfo: menuDetail[index])));
              }, 
              child: MenuCardWidget(
                image: Image.asset(menuDetail[index]["image"]),
                leading: Text(menuDetail[index]["name"] +" "+ menuDetail[index]["price"].toString()),
            )),
          );
        }),
    );
  }
}