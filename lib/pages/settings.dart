import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage() : super();
  final String title = "Settings";
  @override
  _SettingsState createState() => _SettingsState();
}

final double toolbarHeight = 100.0;

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, '12'),
      Company(2, '11'),
      Company(3, '10'),
      Company(4, '9'),
      Company(5, '8'),
      Company(6, '7')
    ];
  }
}

class _SettingsState extends State<SettingsPage> {
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;

  Company _selectedCompany;

  String data = "";
  String nameKey;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
    const MethodChannel('plugins.flutter.io/shared_prefrences')
        .setMockMethodCallHandler(
      (MethodCall methodcall) async {
        if (methodcall.method == 'getAll') {
          return {"flutter." + nameKey: "No Grade Selected"};
        }
        return null;
      },
    );
    setData();
  }

  Future saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString('nameKey', _selectedCompany.name);
  }

  Future<String> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String nameKey = prefs.getString('nameKey');
    return nameKey;
  }

  setData() {
    loadData().then((value) {
      data = value;
    });
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    // ignore: deprecated_member_use
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
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
              backgroundColor: Colors.white,
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
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Select a Grade"),
                  SizedBox(
                    height: 20.0,
                  ),
                  DropdownButton(
                    value: _selectedCompany,
                    items: _dropdownMenuItems,
                    onChanged: onChangeDropdownItem,
                    onTap: () {
                      saveData();
                      loadData();
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Selected: $nameKey',
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
