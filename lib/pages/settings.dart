import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:schoolcalendar/DataBase/globals.dart' as globals;
import 'package:flutter/services.dart';

String errmessage = "Cannot Be Empty";
int thirdlang = 0;
int thirdlange = 0;
int batch = 0;
int histgeo = 0;
OutlineInputBorder textfieldborderenabled = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(25.0)),
  borderSide: BorderSide(color: Colors.black54, width: 1),
);
OutlineInputBorder focusedborder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(25.0)),
  borderSide: BorderSide(color: Color.fromRGBO(202, 232, 140, 1), width: 2),
);

final myController = TextEditingController();
final myController2 = TextEditingController();
final myController3 = TextEditingController();
final myController4 = TextEditingController();
final myController5 = TextEditingController();
final myController6 = TextEditingController();
final myController7 = TextEditingController();
final myController8 = TextEditingController();
final myController9 = TextEditingController();
final _formKey = GlobalKey<FormState>();

grade6and7(context, bool g) {
  return Column(children: [
    SizedBox(
      height: 20,
    ),
    InputDecorator(
        decoration: InputDecoration(
          labelText: '3rd Langauge',
          labelStyle: Theme.of(context)
              .primaryTextTheme
              .caption!
              .copyWith(color: Colors.black),
          border: const OutlineInputBorder(
              gapPadding: 0,
              borderSide: const BorderSide(width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(25.0))),
        ),
        child: DropdownButtonHideUnderline(
            child: Listener(
          onPointerDown: (_) => FocusScope.of(context).unfocus(),
          child: DropdownButton(
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: globals.h10,
                fontFamily: 'Protipo Compact'),
            elevation: 1,
            isExpanded: true,
            isDense: true,
            icon: Icon(Icons.keyboard_arrow_down),
            value: thirdlang,
            items: [
              DropdownMenuItem(child: Text("Spanish"), value: 0),
              DropdownMenuItem(child: Text("French"), value: 1),
            ],
            onChanged: (dynamic value) async {
              thirdlang = value;
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setInt('thirdlang6and7', thirdlang);
              globals.thirdlangsc.add(value);
            },
          ),
        ))),
    SizedBox(
      height: 30,
    )
  ]);
}

dismiss(context) {
  return ElevatedButton(
    onPressed: () async {
      HapticFeedback.heavyImpact();
      Navigator.pop(context);
    },
    child: Padding(
        padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
        child: Column(children: [
          Icon(
            CupertinoIcons.archivebox,
            size: globals.h8,
          ),
          Text('Save Changes',
              style: TextStyle(
                color: Colors.white,
                fontSize: globals.h9,
                fontFamily: 'Protipo Compact',
                fontWeight: FontWeight.w300,
              ))
        ])),
    style: ElevatedButton.styleFrom(
      primary: Colors.deepPurpleAccent[700],
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}

grade8(context, bool g) {
  return Column(children: [
    SizedBox(
      height: 20,
    ),
    InputDecorator(
        decoration: InputDecoration(
          labelText: 'Math and English Batch',
          labelStyle: Theme.of(context)
              .primaryTextTheme
              .caption!
              .copyWith(color: Colors.black),
          border: const OutlineInputBorder(
              gapPadding: 0,
              borderSide: const BorderSide(width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(25.0))),
        ),
        child: DropdownButtonHideUnderline(
            child: Listener(
          onPointerDown: (_) => FocusScope.of(context).unfocus(),
          child: DropdownButton(
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: globals.h10,
                fontFamily: 'Protipo Compact'),
            elevation: 1,
            isExpanded: true,
            isDense: true,
            icon: Icon(Icons.keyboard_arrow_down),
            value: batch,
            items: [
              DropdownMenuItem(child: Text("Batch 1"), value: 0),
              DropdownMenuItem(child: Text("Batch 2"), value: 1),
            ],
            onChanged: (dynamic value) async {
              batch = value;
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setInt('7batchPref', batch);
              globals.thirdlangsc.add(value);
            },
          ),
        ))),
    SizedBox(
      height: 10,
    ),
    InputDecorator(
        decoration: InputDecoration(
          labelText: '3rd Langauge',
          labelStyle: Theme.of(context)
              .primaryTextTheme
              .caption!
              .copyWith(color: Colors.black),
          border: const OutlineInputBorder(
              gapPadding: 0,
              borderSide: const BorderSide(width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(25.0))),
        ),
        child: DropdownButtonHideUnderline(
            child: Listener(
          onPointerDown: (_) => FocusScope.of(context).unfocus(),
          child: DropdownButton(
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: globals.h10,
                fontFamily: 'Protipo Compact'),
            elevation: 1,
            isExpanded: true,
            isDense: true,
            icon: Icon(Icons.keyboard_arrow_down),
            value: thirdlange,
            items: [
              DropdownMenuItem(child: Text("Spanish"), value: 0),
              DropdownMenuItem(child: Text("French"), value: 1),
              DropdownMenuItem(child: Text("Hindi"), value: 2)
            ],
            onChanged: (dynamic value) async {
              thirdlange = value;
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setInt('thirdlang8', thirdlange);
              globals.thirdlangsc.add(value);
            },
          ),
        ))),
    SizedBox(
      height: 10,
    ),
    InputDecorator(
        decoration: InputDecoration(
          labelText: 'History/Geography',
          labelStyle: Theme.of(context)
              .primaryTextTheme
              .caption!
              .copyWith(color: Colors.black),
          border: const OutlineInputBorder(
              gapPadding: 0,
              borderSide: const BorderSide(width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(25.0))),
        ),
        child: DropdownButtonHideUnderline(
            child: Listener(
          onPointerDown: (_) => FocusScope.of(context).unfocus(),
          child: DropdownButton(
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: globals.h10,
                fontFamily: 'Protipo Compact'),
            elevation: 1,
            isExpanded: true,
            isDense: true,
            icon: Icon(Icons.keyboard_arrow_down),
            value: histgeo,
            items: [
              DropdownMenuItem(child: Text("History"), value: 0),
              DropdownMenuItem(child: Text("Geography"), value: 1),
            ],
            onChanged: (dynamic value) async {
              histgeo = value;
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setInt('histgeo', histgeo);
              globals.thirdlangsc.add(value);
            },
          ),
        ))),
    SizedBox(
      height: 30,
    ),
  ]);
}

grade9and10(context, bool g) {
  return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: 20,
        ),
        TextFormField(
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            cursorColor: Colors.black54,
            validator: (value) {
              if (value!.isEmpty) {
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
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            cursorColor: Colors.black54,
            validator: (value) {
              if (value!.isEmpty) {
                return errmessage;
              }
              return null;
            },
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
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (value!.isEmpty) {
                return errmessage;
              }
              return null;
            },
            cursorColor: Colors.black54,
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
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (value!.isEmpty) {
                return errmessage;
              }
              return null;
            },
            cursorColor: Colors.black54,
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
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (value!.isEmpty) {
                return errmessage;
              }
              return null;
            },
            cursorColor: Colors.black54,
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
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (value!.isEmpty) {
                return errmessage;
              }
              return null;
            },
            cursorColor: Colors.black54,
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
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (value!.isEmpty) {
                return errmessage;
              }
              return null;
            },
            cursorColor: Colors.black54,
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
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (value!.isEmpty) {
                return errmessage;
              }
              return null;
            },
            cursorColor: Colors.black54,
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
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (value!.isEmpty) {
                return errmessage;
              }
              return null;
            },
            cursorColor: Colors.black54,
            controller: myController9,
            decoration: InputDecoration(
                labelText: 'Block 9',
                labelStyle: TextStyle(
                  color: Colors.black54,
                ),
                enabledBorder: textfieldborderenabled,
                focusedBorder: focusedborder)),
        SizedBox(
          height: 15,
        ),
        (g) ? g9tt(context) : Container(),
        SizedBox(
          height: 30,
        ),
      ]));
}

g9tt(context) {
  return ElevatedButton(
    onPressed: () async {
      HapticFeedback.heavyImpact();
      if (_formKey.currentState!.validate()) {
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
        Navigator.pop(context);
      }
    },
    child: Padding(
        padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
        child: Column(children: [
          Icon(
            CupertinoIcons.archivebox,
            size: globals.h8,
          ),
          Text('Save Changes',
              style: TextStyle(
                color: Colors.white,
                fontSize: globals.h9,
                fontFamily: 'Protipo Compact',
                fontWeight: FontWeight.w300,
              ))
        ])),
    style: ElevatedButton.styleFrom(
      primary: Colors.deepPurpleAccent[700],
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}

grade11(context, bool g) {
  return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: 20,
        ),
        TextFormField(
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            cursorColor: Colors.black54,
            validator: (value) {
              if (value!.isEmpty) {
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
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            cursorColor: Colors.black54,
            validator: (value) {
              if (value!.isEmpty) {
                return errmessage;
              }
              return null;
            },
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
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (value!.isEmpty) {
                return errmessage;
              }
              return null;
            },
            cursorColor: Colors.black54,
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
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (value!.isEmpty) {
                return errmessage;
              }
              return null;
            },
            cursorColor: Colors.black54,
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
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (value!.isEmpty) {
                return errmessage;
              }
              return null;
            },
            cursorColor: Colors.black54,
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
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (value!.isEmpty) {
                return errmessage;
              }
              return null;
            },
            cursorColor: Colors.black54,
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
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (value!.isEmpty) {
                return errmessage;
              }
              return null;
            },
            cursorColor: Colors.black54,
            controller: myController7,
            decoration: InputDecoration(
                labelText: 'Block 7',
                labelStyle: TextStyle(
                  color: Colors.black54,
                ),
                enabledBorder: textfieldborderenabled,
                focusedBorder: focusedborder)),
        SizedBox(
          height: 25,
        ),
        (g) ? g11TT(context) : Container(),
        SizedBox(
          height: 30,
        ),
      ]));
}

g11TT(context) {
  return ElevatedButton(
    onPressed: () async {
      HapticFeedback.heavyImpact();
      if (_formKey.currentState!.validate()) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('B1', myController.text);
        prefs.setString('B2', myController2.text);
        prefs.setString('B3', myController3.text);
        prefs.setString('B4', myController4.text);
        prefs.setString('B5', myController5.text);
        prefs.setString('B6', myController6.text);
        prefs.setString('B7', myController7.text);
        Navigator.pop(context);
      }
    },
    child: Padding(
        padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
        child: Column(children: [
          Icon(
            CupertinoIcons.archivebox,
            size: globals.h8,
          ),
          Text('Save Changes',
              style: TextStyle(
                color: Colors.white,
                fontSize: globals.h9,
                fontFamily: 'Protipo Compact',
                fontWeight: FontWeight.w300,
              ))
        ])),
    style: ElevatedButton.styleFrom(
      primary: Colors.deepPurpleAccent[700],
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}

grade12(context, bool g) {
  return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: 20,
        ),
        TextFormField(
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            cursorColor: Colors.black54,
            validator: (value) {
              if (value!.isEmpty) {
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
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            cursorColor: Colors.black54,
            validator: (value) {
              if (value!.isEmpty) {
                return errmessage;
              }
              return null;
            },
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
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (value!.isEmpty) {
                return errmessage;
              }
              return null;
            },
            cursorColor: Colors.black54,
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
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (value!.isEmpty) {
                return errmessage;
              }
              return null;
            },
            cursorColor: Colors.black54,
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
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (value!.isEmpty) {
                return errmessage;
              }
              return null;
            },
            cursorColor: Colors.black54,
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
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (value!.isEmpty) {
                return errmessage;
              }
              return null;
            },
            cursorColor: Colors.black54,
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
        SizedBox(
          height: 25,
        ),
        (g) ? g12TT(context) : Container(),
        SizedBox(
          height: 30,
        ),
      ]));
}

g12TT(context) {
  return ElevatedButton(
    onPressed: () async {
      HapticFeedback.heavyImpact();
      if (_formKey.currentState!.validate()) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('B1', myController.text);
        prefs.setString('B2', myController2.text);
        prefs.setString('B3', myController3.text);
        prefs.setString('B4', myController4.text);
        prefs.setString('B5', myController5.text);
        prefs.setString('B6', myController6.text);
        Navigator.pop(context);
      }
    },
    child: Padding(
        padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
        child: Column(children: [
          Icon(
            CupertinoIcons.archivebox,
            size: globals.h8,
          ),
          Text('Save Changes',
              style: TextStyle(
                color: Colors.white,
                fontSize: globals.h9,
                fontFamily: 'Protipo Compact',
                fontWeight: FontWeight.w300,
              ))
        ])),
    style: ElevatedButton.styleFrom(
      primary: Colors.deepPurpleAccent[700],
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}

nosupport() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: globals.s2,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 0.0, left: globals.h5!, right: globals.h5!),
                      child: Container(
                        child: Text(
                          'Support Coming Soon!',
                          style: TextStyle(
                            fontFamily: 'Protipo Compact',
                            fontSize: globals.h5,
                            color: Colors.black54,
                            fontWeight: FontWeight.w300,
                          ),
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          maxLines: 6,
                        ),
                      )))
            ]),
      ],
    ),
  );
}

addIntToSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('Value', globals.valueOfGrade!);
}

fp2helper() async {
  HapticFeedback.heavyImpact();
  if (globals.valueOfGrade == 11) {
    if (_formKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('B1', myController.text);
      prefs.setString('B2', myController2.text);
      prefs.setString('B3', myController3.text);
      prefs.setString('B4', myController4.text);
      prefs.setString('B5', myController5.text);
      prefs.setString('B6', myController6.text);
      prefs.setString('B7', myController7.text);
    }
  } else if (globals.valueOfGrade == 91 ||
      globals.valueOfGrade == 92 ||
      globals.valueOfGrade == 101 ||
      globals.valueOfGrade == 102) {
    if (_formKey.currentState!.validate()) {
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
    }
  } else if (globals.valueOfGrade == 12) {
    if (_formKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('B1', myController.text);
      prefs.setString('B2', myController2.text);
      prefs.setString('B3', myController3.text);
      prefs.setString('B4', myController4.text);
      prefs.setString('B5', myController5.text);
      prefs.setString('B6', myController6.text);
    }
  }
}
