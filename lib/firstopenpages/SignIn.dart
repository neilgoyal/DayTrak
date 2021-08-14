import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schoolcalendar/DataBase/globals.dart' as globals;
import 'package:schoolcalendar/authentication.dart';
import 'package:schoolcalendar/firstopenpages/SignUp.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          SizedBox(height: 80),
          Column(
            children: [
              Column(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.5,
                  child: Stack(children: <Widget>[
                    Positioned.fill(
                      child: FlareActor("assets/WorldSpin.flr",
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                          animation: "roll"),
                    )
                  ]),
                ),
              ]),
              SizedBox(height: globals.h4),
              Text(
                'Welcome back!',
                style: TextStyle(fontSize: 24),
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 30),
                  Text('New here ? ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signup()));
                    },
                    child: Text('Get Registered Now!!',
                        style: TextStyle(fontSize: 20, color: Colors.blue)),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LoginForm(),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Container buildLogo() {
    return Container(
      height: 80,
      width: 80,
      // padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.blue),
      child: Center(
        child: Text(
          "T",
          style: TextStyle(color: Colors.white, fontSize: 60.0),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  late String email;
  late String password;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // email
          TextFormField(
            // initialValue: 'Input text',
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(100.0),
                ),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (val) {
              email = val!;
            },
          ),
          SizedBox(
            height: 20,
          ),

          // password
          TextFormField(
            // initialValue: 'Input text',
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(100.0),
                ),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            obscureText: _obscureText,
            onSaved: (val) {
              password = val!;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          SizedBox(height: 30),

          SizedBox(
            height: 54,
            width: 184,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  AuthenticationHelper()
                      .signIn(email: email, password: password)
                      .then((result) {
                    if (result == null) {
                      Navigator.pushReplacementNamed(context, "/main");
                    } else {}
                  });
                }
              },
              child: Text(
                'Login',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
