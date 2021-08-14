import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schoolcalendar/authentication.dart';
import 'package:schoolcalendar/firstopenpages/fp2.dart';
import 'package:schoolcalendar/DataBase/globals.dart' as globals;

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          SizedBox(height: 80),
          Column(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.5,
                  child: Stack(children: <Widget>[
                    Positioned.fill(
                      child: FlareActor("assets/goose.flr",
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                          animation: "neilnude"),
                    )
                  ]),
                ),
              ]),
          SizedBox(height: 50),
          Text(
            'Welcome!',
            style: TextStyle(fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SignupForm(),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('Already here  ?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(' Get Logged in Now!',
                          style: TextStyle(fontSize: 20, color: Colors.blue)),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildLogo() {
    return Container(
      height: 80,
      width: 80,
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

class SignupForm extends StatefulWidget {
  SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  late String email;
  late String password;
  bool _obscureText = true;

  final pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        const Radius.circular(100.0),
      ),
    );

    var space = SizedBox(height: 10);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // email
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: 'Email',
                border: border),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (val) {
              email = val!;
            },
            keyboardType: TextInputType.emailAddress,
          ),

          space,

          // password
          TextFormField(
            controller: pass,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: border,
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
            onSaved: (val) {
              password = val!;
            },
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          space,
          // confirm passwords
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: border,
            ),
            obscureText: true,
            validator: (value) {
              if (value != pass.text) {
                return 'password not match';
              }
              return null;
            },
          ),
          space,

          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                AuthenticationHelper()
                    .signUp(email: email, password: password)
                    .then((result) {
                  if (result == null) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Fp2Page(globals.thirdlangsc.stream)));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        result,
                        style: TextStyle(fontSize: 16),
                      ),
                    ));
                  }
                });
              }
            },
            child: Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
