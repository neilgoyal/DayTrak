import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myController5 = TextEditingController();
  final myController6 = TextEditingController();
  final myController7 = TextEditingController();
  final myController8 = TextEditingController();
  final myController9 = TextEditingController();
  final myController10 = TextEditingController();

  grade12() {
    return Column(children: [
      TextFormField(
          controller: myController,
          decoration: InputDecoration(labelText: 'Block 1')),
      TextFormField(
          controller: myController2,
          decoration: InputDecoration(labelText: 'Block 2')),
      TextFormField(
          controller: myController3,
          decoration: InputDecoration(labelText: 'Block 3')),
      TextFormField(
          controller: myController4,
          decoration: InputDecoration(labelText: 'Block 4')),
      TextFormField(
          controller: myController5,
          decoration: InputDecoration(labelText: 'Block 5')),
      TextFormField(
          controller: myController6,
          decoration: InputDecoration(labelText: 'Block 6')),
    ]);
  }

  grade11() {
    return Column(children: [
      TextFormField(
          controller: myController,
          decoration: InputDecoration(labelText: 'Block 1')),
      TextFormField(
          controller: myController2,
          decoration: InputDecoration(labelText: 'Block 2')),
      TextFormField(
          controller: myController3,
          decoration: InputDecoration(labelText: 'Block 3')),
      TextFormField(
          controller: myController4,
          decoration: InputDecoration(labelText: 'Block 4')),
      TextFormField(
          controller: myController5,
          decoration: InputDecoration(labelText: 'Block 5')),
      TextFormField(
          controller: myController6,
          decoration: InputDecoration(labelText: 'Block 6')),
    ]);
  }

  grade10() {
    return Column(children: [
      TextFormField(
          controller: myController,
          decoration: InputDecoration(labelText: 'Block 1')),
      TextFormField(
          controller: myController2,
          decoration: InputDecoration(labelText: 'Block 2')),
      TextFormField(
          controller: myController3,
          decoration: InputDecoration(labelText: 'Block 3')),
      TextFormField(
          controller: myController4,
          decoration: InputDecoration(labelText: 'Block 4')),
      TextFormField(
          controller: myController5,
          decoration: InputDecoration(labelText: 'Block 5')),
      TextFormField(
          controller: myController6,
          decoration: InputDecoration(labelText: 'Block 6')),
      TextFormField(
          controller: myController7,
          decoration: InputDecoration(labelText: 'Block 7')),
      TextFormField(
          controller: myController8,
          decoration: InputDecoration(labelText: 'Block 8')),
      TextFormField(
          controller: myController9,
          decoration: InputDecoration(labelText: 'Block 9')),
      TextFormField(
          controller: myController10,
          decoration: InputDecoration(labelText: 'Block 10')),
    ]);
  }

  grade9() {
    return Column(children: [
      TextFormField(
          controller: myController,
          decoration: InputDecoration(labelText: 'Block 1')),
      TextFormField(
          controller: myController2,
          decoration: InputDecoration(labelText: 'Block 2')),
      TextFormField(
          controller: myController3,
          decoration: InputDecoration(labelText: 'Block 3')),
      TextFormField(
          controller: myController4,
          decoration: InputDecoration(labelText: 'Block 4')),
      TextFormField(
          controller: myController5,
          decoration: InputDecoration(labelText: 'Block 5')),
      TextFormField(
          controller: myController6,
          decoration: InputDecoration(labelText: 'Block 6')),
      TextFormField(
          controller: myController7,
          decoration: InputDecoration(labelText: 'Block 7')),
      TextFormField(
          controller: myController8,
          decoration: InputDecoration(labelText: 'Block 8')),
      TextFormField(
          controller: myController9,
          decoration: InputDecoration(labelText: 'Block 9')),
      TextFormField(
          controller: myController10,
          decoration: InputDecoration(labelText: 'Block 10')),
    ]);
  }

  grade8() {
    return Column(children: [
      TextFormField(
          controller: myController,
          decoration: InputDecoration(labelText: 'Block 1')),
      TextFormField(
          controller: myController2,
          decoration: InputDecoration(labelText: 'Block 2')),
      TextFormField(
          controller: myController3,
          decoration: InputDecoration(labelText: 'Block 3')),
      TextFormField(
          controller: myController4,
          decoration: InputDecoration(labelText: 'Block 4')),
      TextFormField(
          controller: myController5,
          decoration: InputDecoration(labelText: 'Block 5')),
      TextFormField(
          controller: myController6,
          decoration: InputDecoration(labelText: 'Block 6')),
      TextFormField(
          controller: myController7,
          decoration: InputDecoration(labelText: 'Block 7')),
      TextFormField(
          controller: myController8,
          decoration: InputDecoration(labelText: 'Block 8')),
      TextFormField(
          controller: myController9,
          decoration: InputDecoration(labelText: 'Block 9')),
      TextFormField(
          controller: myController10,
          decoration: InputDecoration(labelText: 'Block 10')),
    ]);
  }

  grade7() {
    return Column(children: [
      TextFormField(
          controller: myController,
          decoration: InputDecoration(labelText: 'Block 1')),
      TextFormField(
          controller: myController2,
          decoration: InputDecoration(labelText: 'Block 2')),
      TextFormField(
          controller: myController3,
          decoration: InputDecoration(labelText: 'Block 3')),
      TextFormField(
          controller: myController4,
          decoration: InputDecoration(labelText: 'Block 4')),
      TextFormField(
          controller: myController5,
          decoration: InputDecoration(labelText: 'Block 5')),
      TextFormField(
          controller: myController6,
          decoration: InputDecoration(labelText: 'Block 6')),
      TextFormField(
          controller: myController7,
          decoration: InputDecoration(labelText: 'Block 7')),
      TextFormField(
          controller: myController8,
          decoration: InputDecoration(labelText: 'Block 8')),
      TextFormField(
          controller: myController9,
          decoration: InputDecoration(labelText: 'Block 9')),
      TextFormField(
          controller: myController10,
          decoration: InputDecoration(labelText: 'Block 10')),
    ]);
  }

  grade6() {
    return Column(children: [
      TextFormField(
          controller: myController,
          decoration: InputDecoration(labelText: 'Block 1')),
      TextFormField(
          controller: myController2,
          decoration: InputDecoration(labelText: 'Block 2')),
      TextFormField(
          controller: myController3,
          decoration: InputDecoration(labelText: 'Block 3')),
      TextFormField(
          controller: myController4,
          decoration: InputDecoration(labelText: 'Block 4')),
      TextFormField(
          controller: myController5,
          decoration: InputDecoration(labelText: 'Block 5')),
      TextFormField(
          controller: myController6,
          decoration: InputDecoration(labelText: 'Block 6')),
      TextFormField(
          controller: myController7,
          decoration: InputDecoration(labelText: 'Block 7')),
      TextFormField(
          controller: myController8,
          decoration: InputDecoration(labelText: 'Block 8')),
      TextFormField(
          controller: myController9,
          decoration: InputDecoration(labelText: 'Block 9')),
      TextFormField(
          controller: myController10,
          decoration: InputDecoration(labelText: 'Block 10')),
    ]);
  }

  grade5() {
    return Column(children: [
      TextFormField(
          controller: myController,
          decoration: InputDecoration(labelText: 'Block 1')),
      TextFormField(
          controller: myController2,
          decoration: InputDecoration(labelText: 'Block 2')),
      TextFormField(
          controller: myController3,
          decoration: InputDecoration(labelText: 'Block 3')),
      TextFormField(
          controller: myController4,
          decoration: InputDecoration(labelText: 'Block 4')),
      TextFormField(
          controller: myController5,
          decoration: InputDecoration(labelText: 'Block 5')),
      TextFormField(
          controller: myController6,
          decoration: InputDecoration(labelText: 'Block 6')),
      TextFormField(
          controller: myController7,
          decoration: InputDecoration(labelText: 'Block 7')),
      TextFormField(
          controller: myController8,
          decoration: InputDecoration(labelText: 'Block 8')),
      TextFormField(
          controller: myController9,
          decoration: InputDecoration(labelText: 'Block 9')),
      TextFormField(
          controller: myController10,
          decoration: InputDecoration(labelText: 'Block 10')),
    ]);
  }

  defaultsvals() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_value == 11 || _value == 12) {
      setState(() {
        myController.text = prefs.getString('B1') ?? "";
        myController2.text = prefs.getString('B2') ?? "";
        myController3.text = prefs.getString('B3') ?? "";
        myController4.text = prefs.getString('B4') ?? "";
        myController5.text = prefs.getString('B5') ?? "";
        myController6.text = prefs.getString('B6') ?? "";
      });
    } else {
      setState(() {
        myController.text = prefs.getString('B1') ?? "";
        myController2.text = prefs.getString('B2') ?? "";
        myController3.text = prefs.getString('B3') ?? "";
        myController4.text = prefs.getString('B4') ?? "";
        myController5.text = prefs.getString('B5') ?? "";
        myController6.text = prefs.getString('B6') ?? "";
        myController7.text = prefs.getString('B7') ?? "";
        myController8.text = prefs.getString('B8') ?? "";
        myController9.text = prefs.getString('B9') ?? "";
        myController10.text = prefs.getString('B10') ?? "";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getIntValuesSF();
    defaultsvals();
  }

  chooser() {
    if (_value == 8) {
      return grade12();
    } else if (_value == 7) {
      return grade11();
    } else if (_value == 6) {
      return grade10();
    } else if (_value == 5) {
      return grade9();
    } else if (_value == 4) {
      return grade8();
    } else if (_value == 3) {
      return grade7();
    } else if (_value == 2) {
      return grade6();
    } else if (_value == 1) {
      return grade5();
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController2.dispose();
    myController3.dispose();
    myController4.dispose();
    myController5.dispose();
    myController6.dispose();
    myController7.dispose();
    myController8.dispose();
    myController9.dispose();
    myController10.dispose();
    super.dispose();
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
                preferredSize: Size.fromHeight(100),
                child: AppBar(
                  backgroundColor: Color.fromRGBO(250, 250, 250, 1),
                  elevation: 0,
                  title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                            ]),
                      ]),
                  toolbarHeight: toolbarHeight,
                )),
            body: SingleChildScrollView(
                child: Container(
                    child: Padding(
                        padding:
                            EdgeInsets.only(top: 0.0, left: 25.0, right: 25.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Choose Grade:',
                                      style: TextStyle(
                                        fontFamily: 'Protipo Compact',
                                        fontSize: 30,
                                        color: const Color(0xffbadfca),
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                  child: Center(
                                      child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                    InputDecorator(
                                        decoration: InputDecoration(
                                          labelText: 'Select Grade',
                                          labelStyle: Theme.of(context)
                                              .primaryTextTheme
                                              .caption
                                              .copyWith(color: Colors.black),
                                          border: const OutlineInputBorder(
                                              gapPadding: 0,
                                              borderSide:
                                                  const BorderSide(width: 1),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(25.0))),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 15,
                                                  fontFamily:
                                                      'Protipo Compact'),
                                              elevation: 1,
                                              isExpanded: true,
                                              isDense:
                                                  true, // Reduces the dropdowns height by +/- 50%
                                              icon: Icon(
                                                  Icons.keyboard_arrow_down),
                                              value: _value,
                                              items: [
                                                DropdownMenuItem(
                                                    child: Text("5"), value: 1),
                                                DropdownMenuItem(
                                                    child: Text("6"), value: 2),
                                                DropdownMenuItem(
                                                    child: Text("7"), value: 3),
                                                DropdownMenuItem(
                                                    child: Text("8"), value: 4),
                                                DropdownMenuItem(
                                                    child: Text("9"), value: 5),
                                                DropdownMenuItem(
                                                    child: Text("10"),
                                                    value: 6),
                                                DropdownMenuItem(
                                                    child: Text("11"),
                                                    value: 7),
                                                DropdownMenuItem(
                                                    child: Text("12"),
                                                    value: 8),
                                              ],
                                              onChanged: (value) {
                                                setState(() {
                                                  _value = value;
                                                  addIntToSF();
                                                });
                                              }),
                                        )),
                                    Column(
                                      children: [chooser()],
                                    ),
                                    SizedBox(height: 30),
                                    ElevatedButton(
                                      onPressed: () async {
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        if (_value == 11 || _value == 12) {
                                          prefs.setString(
                                              'B1', myController.text);
                                          prefs.setString(
                                              'B2', myController2.text);
                                          prefs.setString(
                                              'B3', myController3.text);
                                          prefs.setString(
                                              'B4', myController4.text);
                                          prefs.setString(
                                              'B5', myController5.text);
                                          prefs.setString(
                                              'B6', myController6.text);
                                        } else {
                                          prefs.setString(
                                              'B1', myController.text);
                                          prefs.setString(
                                              'B2', myController2.text);
                                          prefs.setString(
                                              'B3', myController3.text);
                                          prefs.setString(
                                              'B4', myController4.text);
                                          prefs.setString(
                                              'B5', myController5.text);
                                          prefs.setString(
                                              'B6', myController6.text);
                                          prefs.setString(
                                              'B7', myController7.text);
                                          prefs.setString(
                                              'B8', myController8.text);
                                          prefs.setString(
                                              'B9', myController9.text);
                                          prefs.setString(
                                              'B10', myController10.text);
                                        }
                                      },
                                      child: const Text('Save',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ]))),
                            ]))))));
  }
}
