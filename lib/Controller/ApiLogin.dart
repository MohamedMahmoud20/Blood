import 'dart:convert';
import 'package:bloodbankasmaa/Viwes/Screens/Hospital_Screen.dart';
import 'package:bloodbankasmaa/Viwes/Screens/User_Screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Sqflite.dart';

SQFLITE SQL = SQFLITE();

Register(name, Email, phone, password, link, context) async {
  var url = "https://student.valuxapps.com/api/register";
  var pref = await SharedPreferences.getInstance();

  var response = await http.post(
    Uri.parse(url),
    body: {
      "name": name,
      "phone": phone,
      "email": Email,
      "password": password,
      "image": link
    },
  );

  var resBodyData = jsonDecode(response.body)["data"];
  var resBodyMessage = jsonDecode(response.body)["message"];
  var TokenSignup = jsonDecode(response.body)["data"]["token"];
  if (resBodyData != null) {
    // AllData=[name  ,phone , Email , password , link];

    SaveP(TokenSignup);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 1000),
        content: Text("Register Successful")));
    Navigator.pushReplacementNamed(context, HospitalScreen.route);
    await SQL.Insert(
        '''INSERT INTO Todo ('name' , 'phone' , 'address' , 'link')
            VALUES("$name" , "$phone" , "" , "$link" )  ''');

    // Navigator.of(context).pop();
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 1000),
        content: Text("${resBodyMessage}")));
    print(resBodyData);
    print(resBodyMessage);
  }
  print("Token= = = ${pref.getString("token")}");
}

Login(Email, password, context) async {
  var url = "https://student.valuxapps.com/api/login";

  var response = await http.post(Uri.parse(url), body: {
    "email": Email,
    "password": password,
  });

  var responseStatus = jsonDecode(response.body)["status"];
  var responseMessage = jsonDecode(response.body)["message"];
  var TokenSignin = jsonDecode(response.body)["data"]['token'];

  if (responseStatus == true) {
    SaveP(TokenSignin);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 1000),
        content: Text("${responseMessage}")));
    print("Token=====$TokenSignin");
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return HospitalScreen();
    }));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 1000),
        content: Text("${responseMessage}")));
    print(responseStatus);
    print(responseMessage);
  }
}

Logout(context) async {
  var url = "https://student.valuxapps.com/api/logout";
  var pref = await SharedPreferences.getInstance();
  var Token = pref.getString("token");

  var respons = await http.post(Uri.parse(url), headers: {
    "lang": "ar",
    "Content-Type": "application/json",
    "Authorization": "$Token"
  });

  var Status = jsonDecode(respons.body)["status"];
  var Message = jsonDecode(respons.body)["message"];

  if (Status == true) {
    SaveP("0");
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 1000), content: Text("${Message}")));
    Navigator.pushReplacementNamed(context, UserScreen.route);

    // Navigator.of(context).pop();
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 1000), content: Text("${Message}")));
    print(Status);
    print(Message);
  }
}

getProfile() async {
  var url = "https://student.valuxapps.com/api/profile";
  var pref = await SharedPreferences.getInstance();
  var Token = pref.getString("token");

  var response = await http.get(Uri.parse(url),
      headers: {"Content-Type": "application/json", "Authorization": "$Token"});

  var Data = jsonDecode(response.body)["data"];
  print(Data);
  return Data;
}

SaveP(String token) async {
  var pref = await SharedPreferences.getInstance();
  var key = "token";
  pref.setString(key, token);

}

ReadP(context) async {
  var pref = await SharedPreferences.getInstance();
  String? Token = await pref.getString("token");
  if (Token != "0" && Token!=null) {
    print("ReadMain = $Token");
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return HospitalScreen();
    }));
  }
    else {
    print("Failed");
  }
}