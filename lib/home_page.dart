// ignore_for_file: avoid_print, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:sambapos_menu/functions.dart';
import 'package:sambapos_menu/home_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map mapData = {};
  Future<bool> get getData async {
    mapData = await getAllMenu();
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
                    if(snapshot.hasError){
                      return Center(child: Text("Hata"));
                    }else
                    {
                      if (snapshot.hasData) {
                        return ListView.builder(
                      shrinkWrap: true,
                      itemCount: mapData["menus"][0]['items'].length,
                      itemBuilder: (BuildContext context, int index){
                      return SizedBox(
                        child: ElevatedButton(onPressed: ()  {
                          print(mapData);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeDetailPage(menuDetail: mapData["menus"][0]['items'][index]["items"])));
                        },
                        child: Text(mapData["menus"][0]['items'][index]["name"])
                        ),
                      ); 
                      //Text(Item.fromJson(loadYaml(snapshot.data.toString())[index]).caption); // ana kategoriler //mapData["menus"][index+1]["orderTag"]
                    });
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