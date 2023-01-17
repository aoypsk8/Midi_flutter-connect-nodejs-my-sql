import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:midi_test_flutter/data/data_gridview_home.dart';
import 'package:midi_test_flutter/screen/edit.dart';
import 'package:midi_test_flutter/screen/history.dart';
import 'package:midi_test_flutter/screen/location.dart';
import 'package:midi_test_flutter/screen/person.dart';

import '../data/data_pageviews_home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "KA-07 EF-222",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 55,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              FontAwesomeIcons.alignLeft,
              color: Colors.black,
              size: 28,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: IconButton(
              color: Colors.black,
              iconSize: 28,
              icon: const Icon(FontAwesomeIcons.envelopeOpenText),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //height: double.infinity,
            color: Colors.orange[400],
            child: Column(
              children: [
                SizedBox(
                  height: 280,
                  child: PageView.builder(
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (_, ind) {
                      return AnimatedBuilder(
                        animation: pageController,
                        builder: (ctx, child) {
                          return child!;
                        },
                        child: Container(
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 165,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${homecontents.elementAt(ind).logo}"),
                                        fit: BoxFit.cover),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Center(
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                "${homecontents.elementAt(ind).backgroundImage}"),
                                            radius: 30,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                                "${homecontents.elementAt(ind).title}",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black)),
                                            Text(
                                              "${homecontents.elementAt(ind).discription}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black45),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 0, left: 0, top: 5, bottom: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: SizedBox(
                                          width: 150,
                                          height: 70,
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text("Service Stotus"),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: const [
                                                    Icon(Icons.car_crash,
                                                        size: 15),
                                                    Text(
                                                      "Way To Customer ",
                                                      style: TextStyle(
                                                          fontSize: 12.5,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 1,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              color: Colors.black26),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: SizedBox(
                                          width: 150,
                                          height: 70,
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                    "it is sometimes known",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                    )),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: const [
                                                    Icon(Icons.backpack,
                                                        size: 15),
                                                    Text(
                                                      "12 Feb 2018",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Icon(Icons.watch_later,
                                                        size: 15),
                                                    Text("2:30 Pm",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      );
                    },
                    itemCount: homecontents.length,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      homecontents.length, (index) => buildDot(index, context)),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 15),
                  child: GridB(),
                )
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("AoyPhongsakoun"),
              accountEmail: Text("aoypsk8@gmail.com"),
              currentAccountPicture: CircleAvatar(
                  // backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
              decoration: BoxDecoration(color: Colors.orange),
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.user,
                size: 28,
              ),
              title: Text('Person'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Person()));
              },
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.clipboardList,
                size: 28,
              ),
              title: Text('History'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => History()));
              },
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.screwdriver,
                size: 28,
              ),
              title: Text('Edit'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Edit()));
              },
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.mapLocation,
                size: 28,
              ),
              title: Text('Location'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Location()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.black26),
    );
  }
}

class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);
  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 25.0,
          mainAxisSpacing: 12.0,
          mainAxisExtent: 150,
        ),
        itemCount: grid_home_contents.length,
        itemBuilder: (_, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "${grid_home_contents.elementAt(index).image}",
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 3.0,
                          spreadRadius: 2.0,
                          offset: Offset(1, 3))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${grid_home_contents.elementAt(index).title}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${grid_home_contents.elementAt(index).discription}",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
