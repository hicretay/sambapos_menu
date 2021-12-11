// ignore_for_file: avoid_print, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:sambapos_menu/settings/constants.dart';
import 'package:sambapos_menu/settings/extensions.dart';
import 'package:sambapos_menu/settings/functions.dart';
import 'package:sambapos_menu/views/home_detail_page.dart';
import 'package:sambapos_menu/widgets/menu_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SambaPos Menü",style: TextStyle(color: Colors.white,fontSize: 25),),
        backgroundColor: appBarColor,
        elevation: defaultPadding),
      body: Center(
        child: 
             Column(
              children: [
                FutureBuilder<Map>(
                  future: getAllMenu(),
                  builder: (context, snapshot) {      
                    if(snapshot.hasError){
                      return Center(child: Text("Hata"));
                    }else
                    {
                      if (snapshot.hasData) {
                        Map mapData = snapshot.requireData;
                        return Expanded(
                          child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: mapData["menus"][0]['items'].length,
                          itemBuilder: (BuildContext context, int index){
                          return InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(defaultPadding),
                              child: 
                              MenuCardWidget(
                                image: Image.asset(mapData["menus"][0]['items'][index]["image"],
                                height: ScreenSizes(context).height*0.3,), 
                                leading: Text(mapData["menus"][0]['items'][index]["name"], style: TextStyle(fontSize: 20)))
                            ),
                           onTap: ()  {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeDetailPage(
                               menuDetail: mapData["menus"][0]['items'][index]["items"], 
                               pageTitle: mapData["menus"][0]['items'][index]["name"],
                            )));
                           },
                          ); 
                         }),
                        );
                      }else{
                        return Center(child: CircularProgressIndicator(),);
                      }
                    }              
                  }
                ),
              ],
            )
      ),
    );
  }
}