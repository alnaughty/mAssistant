import 'dart:convert';
import 'dart:io';
import 'package:myassistant/pages/HomePage.dart';
import 'package:myassistant/pages/RegisterPage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myassistant/screens/popups.dart';
import 'package:myassistant/variables/global.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InitPage(),
    );
  }
}

class InitPage extends StatefulWidget {
  
  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  void printWrapped(String text) {
  final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

  Future _fetchData() async{
    final response = await http.post("http://myassistant.ohm-conception.com/api/login",body: {
      "email" : username.text,
      "password" : password.text
    },
    headers: {
      HttpHeaders.authorizationHeader: token
    }
    );
    if(response.statusCode == 200){
      var data = json.decode(response.body);
      setState(() {
        token = data['success']['token'];
        uid = data['success']['details']['id'].toString();
        uname = data['success']['details']['name'];
        uemail = data['success']['details']['email'];
        payment_methods = data['success']['details']['payment_methods'];
        currencies = data["success"]['details']['currencies'];
        budgets = data['success']['details']['budgets'];
        bei_cat = data['success']['details']['incomeexpense_categories'];
      });
      print(uname);
      printWrapped(data.toString());
      Navigator.of(context).pop(null);
      Navigator.push(context, PageTransition(child: HomePage(),type: PageTransitionType.rotate,alignment: Alignment.center,duration: Duration(milliseconds: 600)));
      Fluttertoast.showToast(msg: "Login Successful!",toastLength: Toast.LENGTH_LONG,backgroundColor: Colors.grey);
    }else if(response.statusCode == 401){
      Navigator.of(context).pop(null);
      Fluttertoast.showToast(msg: "Invalid Login Details",toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.grey);
    }
  }
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromRGBO(155, 121, 255, 1),Colors.purple.shade100],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft
            )
          ),
          child: SafeArea(
            child: Column(
            children: <Widget>[
              Flexible(
                child: FractionallySizedBox(
                  heightFactor: 1,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    alignment: AlignmentDirectional.center,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width/9,
                                height: MediaQuery.of(context).size.height/15,
                                child: Icon(Icons.vpn_key,color: Color.fromRGBO(155, 121, 255, 0.6),),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width/3) - 10,
                                height: MediaQuery.of(context).size.height/15,
                                alignment: AlignmentDirectional.center,
                                child: TextField(
                                  controller: password,
                                  style: TextStyle(
                                    color: Color.fromRGBO(155, 121, 255, 1),
                                  ),
                                  obscureText: obscureText,
                                  decoration: InputDecoration.collapsed(
                                    hintText: "Mot de passe",
                                    hintStyle: TextStyle(
                                    color: Color.fromRGBO(155, 121, 255, 0.6),
                                  ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width/10.5,
                                height: MediaQuery.of(context).size.height/15,
                                child: obscureText ? IconButton(onPressed: (){
                                  setState(() {
                                    obscureText = false;
                                  });
                                }, icon: Icon(Icons.visibility),color: Color.fromRGBO(155, 121, 255, 0.6))
                                : IconButton(onPressed: (){
                                  setState(() {
                                    obscureText = true;
                                  });
                                }, icon: Icon(Icons.visibility_off),color: Color.fromRGBO(155, 121, 255, 0.6)),
                              )
                            ],
                          ),
                          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/30),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/15,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            showWait(context);
                            _fetchData();
                          },
                          child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/15,
                          alignment: AlignmentDirectional.center,
                          child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 20),),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(155, 121, 255, 1),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, PageTransition(child: RegisterPage(),type: PageTransitionType.downToUp));
                          },
                          child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/15,
                          alignment: AlignmentDirectional.center,
                          child: Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white,width: 4)
                          ),
                        ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("CONTACT US:",style: TextStyle(
                      color: Colors.white
                    ),),
                    Container(
                      width: MediaQuery.of(context).size.width/3,
                      height: MediaQuery.of(context).size.height/15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                            width: MediaQuery.of(context).size.width/10,
                            height: MediaQuery.of(context).size.width/10,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://image.flaticon.com/icons/png/512/124/124010.png"),
                                fit: BoxFit.fitHeight
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          ),
                          GestureDetector(
                            child: Container(
                            width: MediaQuery.of(context).size.width/10,
                            height: MediaQuery.of(context).size.width/10,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("http://pluspng.com/img-png/instagram-png-instagram-png-logo-1455.png"),
                                fit: BoxFit.fitHeight
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          )
        ),
      )
        ],
      )
      
    );
  }
}
