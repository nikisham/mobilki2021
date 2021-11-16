import 'package:flutter/material.dart';

class LikedPage extends StatefulWidget {
  const LikedPage({Key? key}) : super(key: key);

  @override
  State<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {

  var _controller = TextEditingController();

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
                            const Text('Избранные',
                                style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                          ],
                        ),

                        const SizedBox(height:30),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              labelText: 'Город',
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed: _controller.clear,
                                icon: const Icon(Icons.clear),
                              ),
                            ),
                          )
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
