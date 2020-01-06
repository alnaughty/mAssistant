import 'package:flutter/material.dart';
import 'package:myassistant/variables/global.dart';

class HomePage extends StatefulWidget{
  @override
  _HomeState createState() => new _HomeState();
}
class _HomeState extends State<HomePage>{
  GlobalKey<ScaffoldState> _scaffkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          child: Container(
          width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width/4,
          decoration: BoxDecoration(
            color: Color.fromRGBO(155, 121, 255, 1),
            borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
          ),
        ),
        )
      ),
      key: _scaffkey,
      body: FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1,
        child: Container(
          color: Colors.grey.shade300,
          child: SafeArea(
            child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/10,
                color: Colors.grey.shade400,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/5,
                      height: MediaQuery.of(context).size.height/10,
                      child: IconButton(
                        onPressed: (){
                          _scaffkey.currentState.openDrawer();
                        },
                        icon: Icon(Icons.menu,color: Color.fromRGBO(155, 121, 255, 0.6),size: 30,),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height/3,
                child: ListView.builder(
                  itemCount: budgets != null ? budgets.length : 0,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/14,
                      ),
                    );
                  },
                )
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/12,
                color: Color.fromRGBO(155, 121, 255, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Icons.settings,size: 40,color: Colors.white,),
                    ),
                    Container(
                      child:Text("SETTINGS",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
                ),
                    )
                  ],
                )
              )
            ],
          ),
          )
        ),
      ),
    );
  }
}