import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget{
  @override
  _registerPage createState() => new _registerPage();
}
class _registerPage extends State<RegisterPage>{
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController c_pass = new TextEditingController();
  TextEditingController name = new TextEditingController();

  Future _registerAccount() async{
    final response = await http.post("http://myassistant.ohm-conception.com/api/register",body: {
      "name":name.text,
      "email":username.text,
      "password":password.text,
    },
    headers: {
      "accept":"*/*"
    }
    );
    print(response.statusCode);
    if(password.text == c_pass.text){
      if(response.statusCode == 200){
        json.encode(response.body);
        var data = json.decode(response.body);
      }else{
        print("NO ACCOUNT FOUND!");
      }
    }else{
      print("PASSWORD MISMATCH!");
    }
  }
  bool obscureText = true;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromRGBO(155, 121, 255, 1),Colors.purple.shade100],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft
            )
          ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width/9,
                                height: MediaQuery.of(context).size.height/15,
                                child: Icon(Icons.person,color: Color.fromRGBO(155, 121, 255, 0.6),),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width/4),
                                height: MediaQuery.of(context).size.height/15,
                                alignment: AlignmentDirectional.center,
                                child: TextField(
                                  controller: username,
                                  style: TextStyle(
                                    color: Color.fromRGBO(155, 121, 255, 1),
                                  ),
                                  decoration: InputDecoration.collapsed(
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                    color: Color.fromRGBO(155, 121, 255, 0.6),
                                  ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/80),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/15,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width/9,
                                height: MediaQuery.of(context).size.height/15,
                                child: Icon(Icons.person,color: Color.fromRGBO(155, 121, 255, 0.6),),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width/4),
                                height: MediaQuery.of(context).size.height/15,
                                alignment: AlignmentDirectional.center,
                                child: TextField(
                                  controller: name,
                                  style: TextStyle(
                                    color: Color.fromRGBO(155, 121, 255, 1),
                                  ),
                                  decoration: InputDecoration.collapsed(
                                    hintText: "Name",
                                    hintStyle: TextStyle(
                                    color: Color.fromRGBO(155, 121, 255, 0.6),
                                  ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/80),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/15,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width/9,
                                height: MediaQuery.of(context).size.height/15,
                                child: Icon(Icons.vpn_key,color: Color.fromRGBO(155, 121, 255, 0.6),),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width/4),
                                height: MediaQuery.of(context).size.height/15,
                                alignment: AlignmentDirectional.center,
                                child: TextField(
                                  obscureText: obscureText,
                                  controller: password,
                                  style: TextStyle(
                                    color: Color.fromRGBO(155, 121, 255, 1),
                                  ),
                                  decoration: InputDecoration.collapsed(
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                    color: Color.fromRGBO(155, 121, 255, 0.6),
                                  ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/80),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/15,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width/9,
                                height: MediaQuery.of(context).size.height/15,
                                child: Icon(Icons.vpn_key,color: Color.fromRGBO(155, 121, 255, 0.6),),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width/4),
                                height: MediaQuery.of(context).size.height/15,
                                alignment: AlignmentDirectional.center,
                                child: TextField(
                                  obscureText: obscureText,
                                  controller: c_pass,
                                  style: TextStyle(
                                    color: Color.fromRGBO(155, 121, 255, 1),
                                  ),
                                  decoration: InputDecoration.collapsed(
                                    hintText: "Confirm Password",
                                    hintStyle: TextStyle(
                                    color: Color.fromRGBO(155, 121, 255, 0.6),
                                  ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/80),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/15,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/20,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.height/20,
                                height: MediaQuery.of(context).size.height/20,
                                child: obscureText ? IconButton(
                                  onPressed: (){
                                    setState(() {
                                      obscureText = false;
                                    });
                                  },
                                  icon: Icon(Icons.check_box_outline_blank,color: Colors.white,),
                                ) : IconButton(
                                  onPressed: (){
                                    setState(() {
                                      obscureText = true;
                                    });
                                  },
                                  icon: Icon(Icons.check_box,color: Colors.white,),
                                )
                              ),
                              Container(
                                alignment: AlignmentDirectional.centerStart,
                                child: Text("Show Password".toUpperCase(),style: TextStyle(
                                  color: Colors.white
                                ),),
                              )
                            ],
                          ),
                        ),
                GestureDetector(
                  onTap: (){
                    _registerAccount();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/15,
                    alignment: AlignmentDirectional.center,
                    child: Text("REGISTER",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(155, 121, 255, 1),
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop(null);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/15,
                    alignment: AlignmentDirectional.center,
                    child: Text("ANNULER",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,width: 4),
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                )
              ],
            ),
            )
          )
        ],
      ),
    );
  }
}