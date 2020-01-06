import 'dart:io';
import 'dart:ui';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

void showWait(context){
  showDialog(
    context: context,
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4.0,sigmaY: 4.0),
      child: Container(
        alignment: AlignmentDirectional.center,
        child: SpinKitThreeBounce(
          color: Color.fromRGBO(155, 121, 255, 0.6),
        ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black.withOpacity(0.2),
    ),
    )
  );
}
void showSuccess(context){
  showDialog(
    context: context,
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4.0,sigmaY: 4.0),
      child: AlertDialog(
        contentPadding: EdgeInsets.all(0),
        backgroundColor: Colors.transparent,
        content: Container(

        ),
      ),
    )
  );
}
void showInvalidLogin(context){
  showDialog(
    context: context,
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4,sigmaY: 4),
      child: AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.all(0),
        content: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width/4,
                height: MediaQuery.of(context).size.height/10,
                child: Icon(Icons.error,color: Colors.red,size: 80,),
              ),
              Container(
                alignment: AlignmentDirectional.center,
                height: MediaQuery.of(context).size.height/10,
                width: MediaQuery.of(context).size.width/3,
                child: Text('INVALID LOGIN DETAILS!',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              )
            ],
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/4,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)
          ),
        ),
      ),
    )
  );
}