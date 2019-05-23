import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


void main() async{

  Map data=await getAllData();

  print("Sunsrise time is:"+data['status']);

  runApp(new MaterialApp(
    home: new Scaffold(

      appBar: new AppBar(
        title: new Text("Sunrsie and Sunset"),
        backgroundColor: Colors.purple,
      ),
      drawer: new Drawer(

      ),

      body: new Container(
        height: 900.0,
        child: new Stack(
          children: <Widget>[

            new Container(
              height: 500.0,
              child: new Image(
                  image: new AssetImage("asset/sun.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            new Positioned(
              bottom: 50.0,
              child: new Container(
                margin: EdgeInsets.all(10.0),
                height: 150.0,
                width: 340.0,
                color: Colors.purple,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    new Container(
                      child: new Text("Sunrise Time:"+data['results']['sunrise'],
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white
                      ),
                      ),
                    ),
                    
                    new SizedBox(height: 10.0,),
                    
                    new Text("Sunset Time:"+ data['results']['sunset'],
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                    ),
                    ),
                    new SizedBox(height: 10.0,),
                    
                    new Text("Solar Noon:"+data['results']['solar_noon'],
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                    ),
                    )

                  ],
                ),
              ),
            )


          ],
        ),
      ),

    ),
  ));
}

Future<Map> getAllData() async{

  var api="https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400";

  var data=await http.get(api);

  var jsonData=json.decode(data.body);

  return jsonData;
}


