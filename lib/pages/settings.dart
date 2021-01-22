import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage() : super();
  final String title = "Settings";
  @override
  _SettingsState createState() => _SettingsState();
}

final double toolbarHeight = 100.0;
int _value = 1;

class _SettingsState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
    getIntValuesSF();
  }

  addIntToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('Value', _value);
  }

  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _value = prefs.getInt('Value') ?? 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(190),
                child: AppBar(
                  backgroundColor: Color.fromRGBO(250, 250, 250, 1),
                  elevation: 0,
                  title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Settings',
                                style: TextStyle(
                                  fontFamily: 'Protipo Compact',
                                  fontSize: 40,
                                  color: const Color(0xff9b8fb1),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ])
                      ]),
                  toolbarHeight: toolbarHeight,
                )),
            body: new Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  DropdownButton(
                      value: _value,
                      items: [
                        DropdownMenuItem(child: Text("5"), value: 1),
                        DropdownMenuItem(child: Text("6"), value: 2),
                        DropdownMenuItem(child: Text("7"), value: 3),
                        DropdownMenuItem(child: Text("8"), value: 4),
                        DropdownMenuItem(child: Text("9"), value: 5),
                        DropdownMenuItem(child: Text("10"), value: 6),
                        DropdownMenuItem(child: Text("11"), value: 7),
                        DropdownMenuItem(child: Text("12"), value: 8),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                          addIntToSF();
                        });
                      }),
                ]))));
  }
}
