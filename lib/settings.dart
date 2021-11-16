import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool isSwitched = false;

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
                            const Text('Настройки',
                                style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                          ],
                        ),
                      ],
                    ),

                    LimitedBox(
                      maxHeight: 600,
                      child: SettingsList(
                        backgroundColor: const Color.fromRGBO(226, 235, 255, 1),
                        sections: [

                          SettingsSection(
                            titleTextStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 19
                            ),
                            titlePadding: const EdgeInsets.all(20),
                            title: 'Местоположения',
                            tiles: [
                              SettingsTile(
                                titleTextStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17
                                ),
                                title: 'Город',
                                subtitle: 'Санкт-Петербург',
                                leading: const Icon(Icons.location_city_rounded),
                                onPressed: (BuildContext context) {},
                              ),
                            ],
                          ),

                          SettingsSection(
                            titleTextStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 19
                            ),
                            titlePadding: const EdgeInsets.all(20),
                            title: 'Единицы измерения',
                            tiles: [
                              SettingsTile(
                                titleTextStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 17
                                ),
                                title: 'Температура',
                                subtitle: '°С (°F)',
                                leading: const Icon(Icons.device_thermostat_rounded),
                                onPressed: (BuildContext context) {},
                              ),
                              SettingsTile(
                                titleTextStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17
                                ),
                                title: 'Сила ветра',
                                subtitle: 'м/с (км/ч)',
                                leading: const Icon(Icons.air_rounded),
                                onPressed: (BuildContext context) {},
                              ),
                              SettingsTile(
                                titleTextStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17
                                ),
                                title: 'Давление',
                                subtitle: 'мм.рт.ст. (гПа)',
                                leading: const Icon(Icons.cloud_circle_rounded),
                                onPressed: (BuildContext context) {},
                              ),
                            ],
                          ),
                          SettingsSection(
                            titleTextStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 19
                            ),
                            titlePadding: const EdgeInsets.all(20),
                            title: 'Приложение',
                            tiles: [
                              SettingsTile.switchTile(
                                titleTextStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17
                                ),
                                title: 'Dark theme',
                                leading: const Icon(Icons.bedtime_rounded),
                                switchValue: isSwitched,
                                onToggle: (value) {
                                  setState(() {
                                    isSwitched = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                  ]
              ),

            );
          }
      ),
    );
  }
}
