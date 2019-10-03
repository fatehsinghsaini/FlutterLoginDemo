import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/mainView/ShowListView.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterView extends StatelessWidget {
  var _mobileNoFocus = FocusNode();
  var _firstNameFocus = FocusNode();
  var _lastNameFocus = FocusNode();
  var _emailFocus = FocusNode();
  var _firstName =  TextEditingController();
  var _lastName =  TextEditingController();
  var _emailId =  TextEditingController();



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sign Up",
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(title: Text('Sign Up'), centerTitle: true,
        leading:IconButton(icon: Icon(Icons.arrow_back),
        onPressed: () =>
          Navigator.pop(context,false)
        ,) ,
        ),
        body: Form(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'First Name'),
                    controller: _firstName,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: _firstNameFocus,
                    onFieldSubmitted: (team) {
                      _fieldFocusChange(
                          context, _firstNameFocus, _lastNameFocus);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Last Name'),
                    controller: _lastName,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: _lastNameFocus,
                    onFieldSubmitted: (team) {
                      _fieldFocusChange(
                          context, _lastNameFocus, _mobileNoFocus);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Mobile No'),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (team) {
                      _fieldFocusChange(context, _mobileNoFocus, _emailFocus);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    controller: _emailId,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    focusNode: _emailFocus,
                    onFieldSubmitted: (team){
                      _emailFocus.unfocus();
                    },
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  RaisedButton(
                    onPressed: () async {
                      final sharedPref=await SharedPreferences.getInstance();
                      sharedPref.setString('UserName', _firstName.text.toString()+" "+_lastName.text.toString());
//                      sharedPref.setString('mobile_no', _mobileNo.text.toString());
                      sharedPref.setBool('isLogin', true);

                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => new ShowListView(sharedPref.getString('UserName'))));

                    },
                    color: Colors.teal,
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  RegisterView();
}

void _fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
