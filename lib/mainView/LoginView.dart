import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/mainView/RegisterView.dart';
import 'package:flutter_app/mainView/ShowListView.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[

          SizedBox(height: 80.0),

          SizedBox(
            height: 120.0,
          ),
          TextFormField(

            validator: (value){
              if(value.isEmpty) {
                return 'Please enter Username';
              }return null;

            },controller: _userNameController,
            decoration: InputDecoration(labelText: 'Username',
                filled: true
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          TextFormField(

            validator: (value){
                if(value.isEmpty){
                  return 'Please enter password';
                }
                return null;
            },

            decoration: InputDecoration(labelText: 'Password', filled: true),
            obscureText: true,
          ),
          ButtonBar(
            children: <Widget>[
              RaisedButton(
                child: Text('SignUp'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => new RegisterView()
                  ));
                },
              ),
              RaisedButton(
                child: Text('Next'),
                onPressed: () {

                  if(_formKey.currentState.validate()){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) => new ShowListView(_userNameController.text)
                    )
                    );
                  }
                },
              )
            ],
          )
        ],
      )),
    );
  }
}
