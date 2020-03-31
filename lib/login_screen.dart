import 'package:flutter/material.dart';
import 'package:fw/auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;

  final formKey = new GlobalKey<FormState>();

  checkFields() {
    final form= formKey.currentState;
    if( form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  String validateEmail( String value ) {
    Pattern pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern);
    if( !regex.hasMatch( value )){
      return "Enter Valid Email";
    } else {
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 250,
          width: 300,
          child: Column(
            children: <Widget>[
              Form(
                key: formKey, 
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only( 
                        left: 25.0, 
                        right: 25.0,
                        top: 20.0,
                        bottom: 5.0
                      ),
                      child: Container(
                        height: 50.0,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Email"
                          ),
                          validator: (value) => value.isEmpty ? 'Email is Required' : validateEmail(value.trim()),
                          onChanged: (value){
                            this.email = value;
                          }
                        )
                      )),
                      Padding(
                      padding: EdgeInsets.only( 
                        left: 25.0, 
                        right: 25.0,
                        top: 20.0,
                        bottom: 5.0
                      ),
                      child: Container(
                        height: 50.0,
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password"
                          ),
                          validator: (value) => value.isEmpty ? 'Password is Required' : null,
                          onChanged: (value){
                            this.password = value;
                          }
                        )
                      )),
                      InkWell(
                        onTap: () {
                          if( checkFields() ){
                            AuthService().signIn(email, password);
                          }
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.2)
                          ),
                          child: Center( child: Text( 'Signin'),),
                        ),
                      )
                ],) ,)
            ],
          )
        )
      )
    );
  }
}