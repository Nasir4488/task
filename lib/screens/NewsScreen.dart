import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../model/apiModel.dart';
class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<photsAPi> list=[];
  Future<List<photsAPi>> getApi() async {
    final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(var i in data){
        list.add(photsAPi.fromJson(i));
      }
      return list;
    }
    else{
      return list;
    }
  }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var  height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getApi(),
          builder: (context, snapshot) {
            return ListView(
              children: List.generate(list.length, (index){
                return Container(
                  margin: EdgeInsets.only(top: 20),
                  width: width,
                  height: height/4,
                  color: Colors.cyanAccent,
                  child: Row(
                    children: [
                      Text(list[index].id.toString(),style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                      Image(image: NetworkImage(list[index].url.toString())),
                      SizedBox(width: 10,),
                      Image(image: NetworkImage(list[index].thumbnailUrl.toString())),
                    ],
                  ),
                );
              }),
            );
          },
        ),
      ),

    );
  }
}
