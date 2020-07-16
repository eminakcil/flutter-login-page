import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/screens/home_page.dart';
import 'package:flutter_login/services/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _email = "";
  String _password = "";

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Simple Login Example"),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: _emailFilter,
              decoration: new InputDecoration(labelText: 'Email'),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _passwordFilter,
              decoration: new InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new RaisedButton(
            child: new Text('Login'),
            onPressed: _loginPressed,
          )
        ],
      ),
    );
  }

  void _loginPressed() {
    print('The user wants to login with $_email and $_password');

    Widget successWidget = Center(child: Icon(Icons.check_circle));
    Widget waitingWidget = Center(child: CircularProgressIndicator());
    Widget failureWidget = Center(child: Icon(Icons.error));

    showDialog(
        context: context,
        child: EnhancedFutureBuilder(
          future: Auth().login(
            _email,
            _password,
            successMethod: () {
              Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            failureMethod: () => print('fail'),
          ),
          rememberFutureResult: false,
          whenDone: (snapshotData) => successWidget,
          whenNotDone: waitingWidget,
          whenError: (error) => failureWidget,
        ));
  }
}
