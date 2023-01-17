import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';

class ApiProvider{
  ApiProvider();

  //Login 
  Future<http.Response> doLogin(String phone ,String password) async{
    var _url =Uri.parse("http://192.168.43.199:3000/api/user/login");
    var body={
      "phone":phone,
      "password":password
    };
    return http.post(_url,body: body);
  }

  //Login 
  Future<http.Response> doRegister(String fname ,String lname,String phone ,String password) async{
    var _url =Uri.parse("http://192.168.43.199:3000/api/user/register");
    var body={
      "fname":fname,
      "lname":lname,
      "phone":phone,
      "password":password
    };
    return http.post(_url,body: body);
  }

  
}