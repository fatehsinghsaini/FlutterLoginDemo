import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/mainView/ShowListView.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 80.0),
          Column(
            children: <Widget>[
              Image.asset('assets/images/logo.jpg'),
              SizedBox(
                height: 20.0,
              ),
              Text('Material Login')
            ],
          ),
          SizedBox(
            height: 120.0,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Username', filled: true),
          ),
          SizedBox(
            height: 12.0,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Password', filled: true),
            obscureText: true,
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {},
              ),
              RaisedButton(
                child: Text('Next'),
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(
                     builder: (BuildContext context) => new ShowListView()
                 )
                  );
                },
              )
            ],
          )
        ],
      )),
    );
  }
}
