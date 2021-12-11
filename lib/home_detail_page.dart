// ignore_for_file: prefer_const_constructors_in_immutables, no_logic_in_create_state

import 'package:flutter/material.dart';

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
          return Text(menuDetail[index]["name"]);
        }),
    );
  }
}