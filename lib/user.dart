import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class users extends StatefulWidget {
  @override
  _usersState createState() => _usersState();
}

class _usersState extends State<users> {
  List user;
  Map  datas;
  Future setUser() async{
  String url="https://pixabay.com/api/?key=14001068-da63091f2a2cb98e1d7cc1d82&q=beautiful&image_type=photo&pretty=true";
    http.Response response = await http.get(url);
      datas = json.decode(response.body);
    setState(() {
      user = datas['hits'];
    });
  }
  @override
  void initState(){
    super.initState();
    setUser();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Api"),
        centerTitle: true,
        leading: Icon(Icons.menu),
      ),
      body: ListView.builder(
        itemCount: user == null ? 0 : user.length,
        itemBuilder: (BuildContext contex, int i){
          final users = user[i];
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding:  EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: CircleAvatar(
                      backgroundImage: NetworkImage('${users["userImageURL"]}'),
                    ),
                  ),
                  SizedBox(
                    child: SizedBox(
                    width: 20.0,
                  ),
                  ),
                    Container(
                     child: Text('${users["user"]}'),
                    ),
                  ],
                ),
              ),
              
              Container(
                child: Image.network('${users["largeImageURL"]}'),
                    
              ),
            ],
          );     
        }
      ),
    );
  }
}
