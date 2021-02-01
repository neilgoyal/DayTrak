import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:schoolcalendar/globals.dart' as globals;
import 'package:flutter/services.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

final double toolbarHeight = 100.0;
String errmessage = "Cannot Be Empty";
OutlineInputBorder textfieldborderenabled = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(25.0)),
  borderSide: BorderSide(color: Colors.black54, width: 1),
);
OutlineInputBorder focusedborder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(25.0)),
  borderSide: BorderSide(color: Color.fromRGBO(224, 163, 160, 1), width: 2),
);

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
  final _formKey = GlobalKey<FormState>();

  grade12() {
    return Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 20,
          ),
          TextFormField(
              focusNode: FocusNode(canRequestFocus: false),
              cursorColor: Colors.black54,
              validator: (value) {
                if (value.isEmpty) {
                  return errmessage;
                }
                return null;
              },
              controller: myController,
              decoration: InputDecoration(
                  labelText: 'Block 1',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: textfieldborderenabled,
                  focusedBorder: focusedborder)),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              cursorColor: Colors.black54,
              validator: (value) {
                if (value.isEmpty) {
                  return errmessage;
                }
                return null;
              },
              focusNode: FocusNode(canRequestFocus: false),
              controller: myController2,
              decoration: InputDecoration(
                  labelText: 'Block 2',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: textfieldborderenabled,
                  focusedBorder: focusedborder)),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return errmessage;
                }
                return null;
              },
              cursorColor: Colors.black54,
              focusNode: FocusNode(canRequestFocus: false),
              controller: myController3,
              decoration: InputDecoration(
                  labelText: 'Block 3',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: textfieldborderenabled,
                  focusedBorder: focusedborder)),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return errmessage;
                }
                return null;
              },
              cursorColor: Colors.black54,
              focusNode: FocusNode(canRequestFocus: false),
              controller: myController4,
              decoration: InputDecoration(
                  labelText: 'Block 4',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: textfieldborderenabled,
                  focusedBorder: focusedborder)),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return errmessage;
                }
                return null;
              },
              cursorColor: Colors.black54,
              focusNode: FocusNode(canRequestFocus: false),
              controller: myController5,
              decoration: InputDecoration(
                  labelText: 'Block 5',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: textfieldborderenabled,
                  focusedBorder: focusedborder)),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return errmessage;
                }
                return null;
              },
              cursorColor: Colors.black54,
              focusNode: FocusNode(canRequestFocus: false),
              controller: myController6,
              decoration: InputDecoration(
                  labelText: 'Block 6',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: textfieldborderenabled,
                  focusedBorder: focusedborder)),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () async {
              HapticFeedback.mediumImpact();
              if (_formKey.currentState.validate()) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('B1', myController.text);
                prefs.setString('B2', myController2.text);
                prefs.setString('B3', myController3.text);
                prefs.setString('B4', myController4.text);
                prefs.setString('B5', myController5.text);
                prefs.setString('B6', myController6.text);
              }
            },
            child: const Text('Save',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'Protipo Compact',
                )),
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(119, 227, 134, 1),
              shadowColor: Color.fromRGBO(223, 164, 160, 1),
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ]));
  }

  grade10() {
    return Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 20,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return errmessage;
                }
                return null;
              },
              cursorColor: Colors.black54,
              focusNode: FocusNode(canRequestFocus: false),
              controller: myController,
              decoration: InputDecoration(
                  labelText: 'Block 1',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: textfieldborderenabled,
                  focusedBorder: focusedborder)),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return errmessage;
                }
                return null;
              },
              cursorColor: Colors.black54,
              focusNode: FocusNode(canRequestFocus: false),
              controller: myController2,
              decoration: InputDecoration(
                  labelText: 'Block 2',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: textfieldborderenabled,
                  focusedBorder: focusedborder)),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return errmessage;
                }
                return null;
              },
              cursorColor: Colors.black54,
              focusNode: FocusNode(canRequestFocus: false),
              controller: myController3,
              decoration: InputDecoration(
                  labelText: 'Block 3',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: textfieldborderenabled,
                  focusedBorder: focusedborder)),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return errmessage;
                }
                return null;
              },
              cursorColor: Colors.black54,
              focusNode: FocusNode(canRequestFocus: false),
              controller: myController4,
              decoration: InputDecoration(
                  labelText: 'Block 4',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: textfieldborderenabled,
                  focusedBorder: focusedborder)),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return errmessage;
                }
                return null;
              },
              cursorColor: Colors.black54,
              focusNode: FocusNode(canRequestFocus: false),
              controller: myController5,
              decoration: InputDecoration(
                  labelText: 'Block 5',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: textfieldborderenabled,
                  focusedBorder: focusedborder)),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return errmessage;
                }
                return null;
              },
              cursorColor: Colors.black54,
              focusNode: FocusNode(canRequestFocus: false),
              controller: myController6,
              decoration: InputDecoration(
                  labelText: 'Block 6',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: textfieldborderenabled,
                  focusedBorder: focusedborder)),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return errmessage;
                }
                return null;
              },
              cursorColor: Colors.black54,
              focusNode: FocusNode(canRequestFocus: false),
              controller: myController7,
              decoration: InputDecoration(
                  labelText: 'Block 7',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: textfieldborderenabled,
                  focusedBorder: focusedborder)),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return errmessage;
                }
                return null;
              },
              cursorColor: Colors.black54,
              focusNode: FocusNode(canRequestFocus: false),
              controller: myController8,
              decoration: InputDecoration(
                  labelText: 'Block 8',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: textfieldborderenabled,
                  focusedBorder: focusedborder)),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return errmessage;
                }
                return null;
              },
              cursorColor: Colors.black54,
              focusNode: FocusNode(canRequestFocus: false),
              controller: myController9,
              decoration: InputDecoration(
                  labelText: 'Block 9',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: textfieldborderenabled,
                  focusedBorder: focusedborder)),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return errmessage;
                }
                return null;
              },
              cursorColor: Colors.black54,
              focusNode: FocusNode(canRequestFocus: false),
              controller: myController10,
              decoration: InputDecoration(
                  labelText: 'Block 10',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: textfieldborderenabled,
                  focusedBorder: focusedborder)),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('B1', myController.text);
                prefs.setString('B2', myController2.text);
                prefs.setString('B3', myController3.text);
                prefs.setString('B4', myController4.text);
                prefs.setString('B5', myController5.text);
                prefs.setString('B6', myController6.text);
                prefs.setString('B7', myController7.text);
                prefs.setString('B8', myController8.text);
                prefs.setString('B9', myController9.text);
                prefs.setString('B10', myController10.text);
              }
            },
            child: const Text('Save',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'Protipo Compact',
                )),
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(119, 227, 134, 1),
              shadowColor: Color.fromRGBO(223, 164, 160, 1),
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ]));
  }

  defaultsvals() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (globals.valueOfGrade == 11 || globals.valueOfGrade == 12) {
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

  @override
  void dispose() {
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
    prefs.setInt('Value', globals.valueOfGrade);
  }

  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      globals.valueOfGrade = prefs.getInt('Value') ?? 11;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
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
                                      fontSize: globals.h1,
                                      color: const Color(0xff9b8fb1),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ]),
                          ]),
                      toolbarHeight: toolbarHeight,
                    )),
                resizeToAvoidBottomInset: false,
                body: SingleChildScrollView(
                    child: Container(
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: 0.0, left: 25.0, right: 25.0),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Choose Grade',
                                          style: TextStyle(
                                            fontFamily: 'Protipo Compact',
                                            fontSize: globals.h3,
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
                                          child: Column(children: <Widget>[
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
                                            child: Listener(
                                          onPointerDown: (_) =>
                                              FocusScope.of(context).unfocus(),
                                          child: DropdownButton(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w300,
                                                fontSize: globals.h9,
                                                fontFamily: 'Protipo Compact'),
                                            elevation: 1,
                                            isExpanded: true,
                                            isDense: true,
                                            icon:
                                                Icon(Icons.keyboard_arrow_down),
                                            value: globals.valueOfGrade,
                                            items: [
                                              DropdownMenuItem(
                                                  child: Text("5"), value: 5),
                                              DropdownMenuItem(
                                                  child: Text("6"), value: 6),
                                              DropdownMenuItem(
                                                  child: Text("7"), value: 7),
                                              DropdownMenuItem(
                                                  child: Text("8"), value: 8),
                                              DropdownMenuItem(
                                                  child: Text("9"), value: 9),
                                              DropdownMenuItem(
                                                  child: Text("10"), value: 10),
                                              DropdownMenuItem(
                                                  child: Text("11"), value: 11),
                                              DropdownMenuItem(
                                                  child: Text("12"), value: 12),
                                            ],
                                            onChanged: (value) {
                                              setState(() {
                                                globals.valueOfGrade = value;
                                                addIntToSF();
                                              });
                                            },
                                          ),
                                        ))),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Add subjects',
                                            style: TextStyle(
                                              fontFamily: 'Protipo Compact',
                                              fontSize: globals.h3,
                                              color: const Color(0xffbadfca),
                                              fontWeight: FontWeight.w300,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        (globals.valueOfGrade == 11 ||
                                                globals.valueOfGrade == 12)
                                            ? grade12()
                                            : grade10()
                                      ],
                                    ),
                                  ]))),
                                ])))))));
  }
}
