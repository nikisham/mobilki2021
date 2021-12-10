import 'package:flutter/material.dart';
import 'package:flutter_app/Whether.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'ApiFunction.dart';
import 'DayForecast.dart';
import 'Params.dart';
import 'WeeklyForecast.dart';

void main() {
  initializeDateFormatting('ru', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LukWeather',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'LukWeather'),
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
  Color Viol = const Color(0xFFE2EBFF);
  bool barOpen = false;
  var Date = DateFormat.yMMMMd('ru').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
            child: ListView(
          children: <Widget>[
            const DrawerHeader(
              child: Text('Weather APP',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  )),
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.settings, color: Colors.black),
                  SizedBox(width: 10),
                  Text('Настройки',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      )),
                ],
              ),
              // onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SettingsPage()));},
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.favorite, color: Colors.black),
                  SizedBox(width: 10),
                  Text('Избранные',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      )),
                ],
              ),
              //onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LikedPage()));},
            ),
            const Divider(),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.account_circle_rounded, color: Colors.black),
                  SizedBox(width: 10),
                  Text('О приложении',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      )),
                ],
              ),
              //  onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AboutPage()));},
            ),
          ],
        )),
        body: FutureBuilder(
          future: API.GetWhether(Params.selectedPlace.lat , Params.selectedPlace.lng),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done) {
                Params.weather = snapshot.data as Weather;
                return Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image(
                    image: AssetImage('assets/back.png'),
                    fit: BoxFit.fill,
                  ),
                ),

                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 60, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NeumorphicButton(
                              style: const NeumorphicStyle(
                                  shape: NeumorphicShape.concave,
                                  boxShape: NeumorphicBoxShape.circle(),
                                  depth: 3,
                                  lightSource: LightSource.topLeft,
                                  color: Colors.transparent),
                              child: NeumorphicIcon(
                                Icons.menu,
                                size: 30,
                              ),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              }),
                          Column(
                            children: [
                              const Text(
                                '10˚c',
                                style: TextStyle(
                                  fontSize: 80,
                                  color: Colors.white,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -8,
                                ),
                              ),
                              Text(
                                Date,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          NeumorphicButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            style: const NeumorphicStyle(
                                shape: NeumorphicShape.concave,
                                boxShape: NeumorphicBoxShape.circle(),
                                depth: 3,
                                lightSource: LightSource.topLeft,
                                color: Colors.transparent),
                            child: NeumorphicIcon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                LimitedBox(
                  maxHeight: MediaQuery.of(context).size.height * .7,
                  child: ExpandableBottomSheet(
                    onIsContractedCallback: () {
                      setState(() {
                        barOpen = false;
                      });
                      print(barOpen);
                    },
                    onIsExtendedCallback: () {
                      setState(() {
                        barOpen = true;
                      });
                      print(barOpen);
                    },
                    background: Container(),
                    persistentContentHeight:
                        MediaQuery.of(context).size.height * .3,
                    persistentHeader: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                        color: Viol,
                      ),
                      child: Center(
                        child: Image(
                          image: AssetImage('assets/Modalheader.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    expandableContent: Stack(children: [
                      Container(
                          color: Viol,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .6),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(29),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Neumorphic(
                                  child: Container(
                                      width: 65,
                                      height: 122,
                                      color: Viol,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                DateFormat.Hm().format(
                                                    DateTime.fromMillisecondsSinceEpoch(
                                                        Params.weather.time[0].time.toInt() * 1000
                                                    )
                                                )
                                            ),
                                            Image(
                                                image:
                                                    AssetImage('assets/sun.png')),
                                            Text(
                                                (Params.weather.time[0].temperature.toInt() - 273).toString(),
                                            )
                                          ],
                                        ),
                                      ))),
                              Neumorphic(
                                  child: Container(
                                      width: 65,
                                      height: 122,
                                      color: Viol,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                DateFormat.Hm().format(
                                                    DateTime.fromMillisecondsSinceEpoch(
                                                        Params.weather.time[6].time.toInt() * 1000
                                                    )
                                                )
                                            ),
                                            Image(
                                                image: AssetImage(
                                                    'assets/doshd3.png')),
                                            Text(
                                              (Params.weather.time[6].temperature.toInt() - 273).toString(),
                                            )
                                          ],
                                        ),
                                      ))),
                              Neumorphic(
                                  child: Container(
                                      width: 65,
                                      height: 122,
                                      color: Viol,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                DateFormat.Hm().format(
                                                    DateTime.fromMillisecondsSinceEpoch(
                                                        Params.weather.time[12].time.toInt() * 1000
                                                    )
                                                )
                                            ),
                                            Image(
                                                image: AssetImage(
                                                    'assets/doshd.png')),
                                            Text(
                                              (Params.weather.time[12].temperature.toInt() - 273).toString(),
                                            )
                                          ],
                                        ),
                                      ))),
                              Neumorphic(
                                  child: Container(
                                      width: 65,
                                      height: 122,
                                      color: Viol,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                DateFormat.Hm().format(
                                                    DateTime.fromMillisecondsSinceEpoch(
                                                        Params.weather.time[18].time.toInt() * 1000
                                                    )
                                                )
                                            ),
                                            Image(
                                                image:
                                                    AssetImage('assets/sun.png')),
                                            Text(
                                              (Params.weather.time[18].temperature.toInt() - 273).toString(),
                                            )
                                          ],
                                        ),
                                      ),

                                  ),),

                            ],

                          ),

                        ),
            Visibility(
            visible: !barOpen,
            child: Container(
            height: 35,
            child: Center(
            child: RaisedButton(
            onPressed: () {
            List<DayForecast> days = [
            new DayForecast(image: "assets/sun.png",temperature: 8,day: "22 сентября",humidity: 87,pressure: 761, speed: 9,),
            new DayForecast(image: "assets/sun.png",temperature: 8,day: "23 сентября",humidity: 87,pressure: 761, speed: 9,),
            new DayForecast(image: "assets/sun.png",temperature: 8,day: "24 сентября",humidity: 87,pressure: 761, speed: 9,),
            new DayForecast(image: "assets/sun.png",temperature: 8,day: "25 сентября",humidity: 87,pressure: 761, speed: 9,),
            new DayForecast(image: "assets/sun.png",temperature: 8,day: "26 сентября",humidity: 87,pressure: 761, speed: 9,),
            new DayForecast(image: "assets/sun.png",temperature: 8,day: "27 сентября",humidity: 87,pressure: 761, speed: 9,),
            new DayForecast(image: "assets/sun.png",temperature: 8,day: "28 сентября",humidity: 87,pressure: 761, speed: 9,)
            ];
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => WeeklyForecast(days: days,)));
            },
            child: Text(
            "Прогноз на неделю",
            style: TextStyle(
            color: Color(0xff038CFE),
            fontSize: 14,
            ),
            ),
            ),),),),
                        Visibility(
                          visible: barOpen,
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 29.0, right: 29.0, top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Neumorphic(
                                        child: Container(
                                          width: 150,
                                          height: 65,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 52.0),
                                            child: Row(children: [
                                              Container(
                                                width: 12,
                                                height: 24,
                                                child: NeumorphicIcon(
                                                  Icons.thermostat_sharp,
                                                  style: NeumorphicStyle(
                                                    color: Color(0xff5A5A5A),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5)),
                                              Text(
                                                '8',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                '˚c',
                                                style: TextStyle(
                                                  color: Color(0xff5A5A5A),
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ),
                                        style: NeumorphicStyle(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      Neumorphic(
                                        child: Container(
                                          width: 150,
                                          height: 65,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 42.0),
                                            child: Row(children: [
                                              Container(
                                                width: 19,
                                                height: 24,
                                                child: Image(
                                                  image: AssetImage(
                                                    'assets/drop.png',
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5)),
                                              Text(
                                                '87',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                '%',
                                                style: TextStyle(
                                                  color: Color(0xff5A5A5A),
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ),
                                        style: NeumorphicStyle(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 29.0, right: 29.0, top: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Neumorphic(
                                        child: Container(
                                          width: 150,
                                          height: 65,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 38.0),
                                            child: Row(children: [
                                              Container(
                                                width: 19,
                                                height: 24,
                                                child: NeumorphicIcon(
                                                  Icons.air,
                                                  style: NeumorphicStyle(
                                                    color: Color(0xff5A5A5A),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5)),
                                              Text(
                                                '9',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                'м/с',
                                                style: TextStyle(
                                                  color: Color(0xff5A5A5A),
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ),
                                        style: NeumorphicStyle(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      Neumorphic(
                                        child: Container(
                                          width: 150,
                                          height: 65,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15.0),
                                            child: Row(children: [
                                              Container(
                                                width: 19,
                                                height: 24,
                                                child: NeumorphicIcon(
                                                  Icons.speed,
                                                  style: NeumorphicStyle(
                                                    color: Color(0xff5A5A5A),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5)),
                                              Text(
                                                '761',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                'мм.рт.ст',
                                                style: TextStyle(
                                                  color: Color(0xff5A5A5A),
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ),
                                        style: NeumorphicStyle(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ])
                    ]),
                  ),
                ),
              ],
            );
              } else {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black,
                );
              }
            },
        ),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
