// ignore_for_file: avoid_print, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:sambapos_menu/extensions.dart';
import 'package:sambapos_menu/functions.dart';
import 'package:sambapos_menu/home_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          return Column(
                          children: [
                            Image.asset(mapData["menus"][0]['items'][index]["image"],
                              height: ScreenSizes(context).height*0.3,
                              ),
                            SizedBox(
                              height: ScreenSizes(context).height*0.05,
                              child: Card(
                                elevation: 10,
                                child: InkWell(
                                  onTap: ()  {
                                  //print(mapData);
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeDetailPage(menuDetail: mapData["menus"][0]['items'][index]["items"])));
                                },
                                child: Center(child: Text(mapData["menus"][0]['items'][index]["name"]))
                                ),
                              ),
                            ),
                            SizedBox(height: ScreenSizes(context).height*0.03,)
                            
                          ],
                           ); 
                           //Text(Item.fromJson(loadYaml(snapshot.data.toString())[index]).caption); // ana kategoriler //mapData["menus"][index+1]["orderTag"]
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