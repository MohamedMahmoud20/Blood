import 'dart:convert';

import 'package:http/http.dart' as http;

class ControllerLogin{
  
  static fatchLogin(String email,String password) async {
    var url =Uri.parse("http://api.instant-ss.com/api/v1/login");
    var response=await  http.post(url,
        body: {
      "email":"$email",
      "password":"$password",
      "device_token":"sdfsfsdfsdfsdfsfs",
    },
    headers: {
      "Accept":"application/json"
    }
    );
    var responsebody=jsonDecode(response.body);
    print(responsebody);
    
    
  }
  
  
}