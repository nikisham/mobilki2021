import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qwe/settings.dart';
import 'package:qwe/liked.dart';
import 'package:qwe/about.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        canvasColor: const Color.fromRGBO(226, 235, 255, 1),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        canvasColor: const Color.fromRGBO(54, 54, 54, 1),
      ),
      home: const MyHomePage(title: 'Weather'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = const BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    return Scaffold(
      drawer: Drawer(
          child: ListView(
            children: <Widget> [
              const DrawerHeader(child: Text('Weather APP',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,)),),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.settings, color: Colors.black),
                    SizedBox(width:10),
                    Text('Настройки',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,)),
                  ],
                ),
                onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SettingsPage()));},
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.favorite, color: Colors.black),
                    SizedBox(width:10),
                    Text('Избранные',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,)),
                  ],
                ),
                onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LikedPage()));},
              ),
              const Divider(),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.account_circle_rounded, color: Colors.black),
                    SizedBox(width:10),
                    Text('О приложении',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,)),
                  ],
                ),
                onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AboutPage()));},
              ),
            ],
          )
      ),

        body: Builder(
          builder: (context) {
            return Container(
                  height: double.infinity,
                   width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                    image: AssetImage("images/back.png"),
                    fit: BoxFit.fill,
                ),
                  ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Column(
                  children: [
                    const SizedBox(height:30),
                    Row(
                      children: [
                        IconButton(icon: const Icon(Icons.menu, color: Colors.white), onPressed: () {Scaffold.of(context).openDrawer();}),
                        const Spacer(),
                        const Text('Санкт-Петербург',
                            style: TextStyle(color: Colors.white,
                              fontSize: 20,
                            )),
                        const Spacer(),
                        IconButton(icon: const Icon(Icons.add_circle_outline_rounded, color: Colors.white), onPressed: () {}),
                      ],
                    ),
                    const SizedBox(height:50),
                    const Text('1°C',
                        style: TextStyle(color: Colors.white,
                            fontSize: 70,
                            fontWeight: FontWeight.bold
                        )),
                    const Text('23 сент. 2021',
                        style: TextStyle(color: Colors.white,
                          fontSize: 20,
                        )),
                  ],
                ),

                SlidingUpPanel(
                maxHeight: 420,
                  panel: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(226, 235, 255, 1),
                        borderRadius: radius
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          const SizedBox(height:70),
                          Column(
                            children: [
                              const SizedBox(height:30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:[
                                  Column(
                                  children:const [
                                  Text("06:00", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                                  Icon(Icons.ac_unit_rounded, color: Colors.black, size: 60),
                                  Text("-10°C", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold))
                                  ],
                                  ),
                                  Column(
                                    children:const [
                                      Text("12:00", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                                      Icon(Icons.wb_sunny_outlined, color: Colors.black, size: 60),
                                      Text("-10°C", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                  Column(
                                    children:const [
                                      Text("18:00", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                                      Icon(Icons.wb_cloudy_outlined, color: Colors.black, size: 60),
                                      Text("-10°C", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                  Column(
                                    children:const [
                                      Text("23:00", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                                      Icon(Icons.mode_night_outlined, color: Colors.black, size: 60),
                                      Text("-10°C", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold))
                                    ],
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ]
                    ),
                  ),
                  collapsed: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(226, 235, 255, 1),
                        borderRadius: radius
                    ),
                      child: const Icon(Icons.horizontal_rule_rounded, color: Colors.blue, size: 70),
                  ),
                borderRadius: radius,
              ),
                  ]
            ),
      );
          }
        ),
    );
  }
}
