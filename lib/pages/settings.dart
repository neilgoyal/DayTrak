import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
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
  final _formKey = GlobalKey<FormState>();

  grade12() {
    return Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 20,
          ),
          TextFormField(
              autofocus: false,
              cursorColor: Colors.black54,
              keyboardType: TextInputType.text,
              controller: myController,
              decoration: InputDecoration(
                  labelText: 'Block 1',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.black54, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(224, 163, 160, 1), width: 2),
                  ))),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              cursorColor: Colors.black54,
              autofocus: false,
              keyboardType: TextInputType.text,
              controller: myController2,
              decoration: InputDecoration(
                  labelText: 'Block 2',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.black54, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(224, 163, 160, 1), width: 2),
                  ))),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              cursorColor: Colors.black54,
              autofocus: false,
              keyboardType: TextInputType.text,
              controller: myController3,
              decoration: InputDecoration(
                  labelText: 'Block 3',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.black54, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(224, 163, 160, 1), width: 2),
                  ))),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              cursorColor: Colors.black54,
              autofocus: false,
              keyboardType: TextInputType.text,
              controller: myController4,
              decoration: InputDecoration(
                  labelText: 'Block 4',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.black54, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(224, 163, 160, 1), width: 2),
                  ))),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              cursorColor: Colors.black54,
              autofocus: false,
              keyboardType: TextInputType.text,
              controller: myController5,
              decoration: InputDecoration(
                  labelText: 'Block 5',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.black54, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(224, 163, 160, 1), width: 2),
                  ))),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              cursorColor: Colors.black54,
              autofocus: false,
              keyboardType: TextInputType.text,
              controller: myController6,
              decoration: InputDecoration(
                  labelText: 'Block 6',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.black54, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(224, 163, 160, 1), width: 2),
                  ))),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('B1', myController.text);
              prefs.setString('B2', myController2.text);
              prefs.setString('B3', myController3.text);
              prefs.setString('B4', myController4.text);
              prefs.setString('B5', myController5.text);
              prefs.setString('B6', myController6.text);
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

  grade11() {}

  grade10() {
    return Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 20,
          ),
          TextFormField(
              cursorColor: Colors.black54,
              autofocus: false,
              keyboardType: TextInputType.text,
              controller: myController,
              decoration: InputDecoration(
                  labelText: 'Block 1',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.black54, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(224, 163, 160, 1), width: 2),
                  ))),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              cursorColor: Colors.black54,
              autofocus: false,
              keyboardType: TextInputType.text,
              controller: myController2,
              decoration: InputDecoration(
                  labelText: 'Block 2',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.black54, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(224, 163, 160, 1), width: 2),
                  ))),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              cursorColor: Colors.black54,
              autofocus: false,
              keyboardType: TextInputType.text,
              controller: myController3,
              decoration: InputDecoration(
                  labelText: 'Block 3',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.black54, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(224, 163, 160, 1), width: 2),
                  ))),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              cursorColor: Colors.black54,
              autofocus: false,
              keyboardType: TextInputType.text,
              controller: myController4,
              decoration: InputDecoration(
                  labelText: 'Block 4',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.black54, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(224, 163, 160, 1), width: 2),
                  ))),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              cursorColor: Colors.black54,
              autofocus: false,
              keyboardType: TextInputType.text,
              controller: myController5,
              decoration: InputDecoration(
                  labelText: 'Block 5',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.black54, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(224, 163, 160, 1), width: 2),
                  ))),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              cursorColor: Colors.black54,
              autofocus: false,
              keyboardType: TextInputType.text,
              controller: myController6,
              decoration: InputDecoration(
                  labelText: 'Block 6',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.black54, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(224, 163, 160, 1), width: 2),
                  ))),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              cursorColor: Colors.black54,
              autofocus: false,
              keyboardType: TextInputType.text,
              controller: myController7,
              decoration: InputDecoration(
                  labelText: 'Block 7',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.black54, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(224, 163, 160, 1), width: 2),
                  ))),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              cursorColor: Colors.black54,
              autofocus: false,
              keyboardType: TextInputType.text,
              controller: myController8,
              decoration: InputDecoration(
                  labelText: 'Block 8',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.black54, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(224, 163, 160, 1), width: 2),
                  ))),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              cursorColor: Colors.black54,
              autofocus: false,
              keyboardType: TextInputType.text,
              controller: myController9,
              decoration: InputDecoration(
                  labelText: 'Block 9',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.black54, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(224, 163, 160, 1), width: 2),
                  ))),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              cursorColor: Colors.black54,
              autofocus: false,
              keyboardType: TextInputType.text,
              controller: myController10,
              decoration: InputDecoration(
                  labelText: 'Block 10',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.black54, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(224, 163, 160, 1), width: 2),
                  ))),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () async {
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

  grade9() {}

  grade8() {}

  grade7() {}

  grade6() {}

  grade5() {}

  defaultsvals() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_value == 7 || _value == 8) {
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
    if (_value == 7 || _value == 8) {
      return grade12();
    } else {
      return grade10();
    }
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
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
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
                                      fontSize: 40,
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
                                          child: DropdownButton(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 15,
                                                  fontFamily:
                                                      'Protipo Compact'),
                                              elevation: 1,
                                              isExpanded: true,
                                              isDense: true,
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
                                              fontSize: 30,
                                              color: const Color(0xffbadfca),
                                              fontWeight: FontWeight.w300,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Column(
                                      children: <Widget>[chooser()],
                                    ),
                                  ]))),
                                ])))))));
  }
}
