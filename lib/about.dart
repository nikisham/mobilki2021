import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
          builder: (context) {
            return Container(
              decoration: const BoxDecoration(

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
                            IconButton(icon: const Icon(Icons.arrow_back_rounded, color: Colors.black), onPressed: () {Navigator.pop(context);}),
                            const Text('О приложении',
                                style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                          ],
                        ),

                        Column(
                          children: const [
                            SizedBox(height:30),
                            Text('Weather APP',
                                style: TextStyle(color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                )),
                            Text('by ITMO',
                                style: TextStyle(color: Colors.black,
                                  fontSize: 20,
                                )),
                            SizedBox(height:10),
                            Text('Версия 1.0',
                                style: TextStyle(color: Colors.black,
                                  fontSize: 15,
                                )),
                            Text('от 1 ноября 2021',
                                style: TextStyle(color: Colors.black,
                                  fontSize: 15,
                                )),
                          ],
                        ),

                      ],
                    ),
                  ]
              ),

            );
          }
      ),
    );
  }
}
