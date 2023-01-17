import 'package:flutter/material.dart';
import 'package:midi_test_flutter/dashboard/login.dart';
import 'package:midi_test_flutter/dashboard/register.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  int currentIndex = 0;

  List _pages = [
    LoginPage(),
    RegisterPage(),
  ];

  void _onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          toolbarHeight: 200,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                color: Colors.orange.shade800,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  //bottomRight: Radius.circular(40)
                ),
                gradient: LinearGradient(
                    colors: [Colors.orange.shade800, Colors.orange.shade500],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          bottom: TabBar(
            onTap: _onTap,
            indicator: UnderlineTabIndicator(),
            indicatorPadding:
                EdgeInsets.symmetric(horizontal: 60, vertical: 10),
            labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            tabs: const [
              Tab(text: " Login "),
              Tab(text: "Sign In "),
            ],
          ),
        ),
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(70)),
          ),
          child: _pages[currentIndex],
        ),
      ),
    );
  }
}
