import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:midi_test_flutter/api/api_provier.dart';
import 'package:midi_test_flutter/screen/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _ctrlPhone = TextEditingController();
  TextEditingController _ctrlpassword = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  ApiProvider apiProvider = ApiProvider();

  Future doLogin() async {
    if (_formkey.currentState!.validate()) {
      try {
        var rs = await apiProvider.doLogin(_ctrlPhone.text, _ctrlpassword.text);
        if (rs.statusCode == 200) {
          print(rs.body);
          var jsonRes = json.decode(rs.body);
          String token = jsonRes['token'];
          print(token);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => Home()),
          );
        } else {
          print("Server error !");
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange.shade800),
              ),
              const SizedBox(height: 20),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ]),
                child: Center(
                  child: TextFormField(
                      controller: _ctrlPhone,
                      // validator: ((value) {
                      //   if (value!.isEmpty) {
                      //     return "Email is require";
                      //   } else if (value.contains("@gamil.com")) {
                      //     return "You have to use @gmail.com";
                      //   }
                      //   return null;
                      // }),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone",
                          hintStyle: const TextStyle(fontSize: 18),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.orange.shade800,
                          ))),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ]),
                child: Center(
                  child: TextFormField(
                      controller: _ctrlpassword,
                      obscureText: true,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "password is require";
                        } else if (value.length < 5) {
                          return "You have to use password  >5";
                        }
                        return null;
                      }),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: const TextStyle(fontSize: 18),
                          prefixIcon: Icon(
                            Icons.security,
                            color: Colors.orange.shade800,
                          ))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => {doLogin()},
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.orange.shade800,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
