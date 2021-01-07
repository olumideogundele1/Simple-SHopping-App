import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey  = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Welcome",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: "Corben",
                      fontWeight: FontWeight.w600
                  ),),
                Container(
                  margin: EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0
                  ),
                  width: size.width / 1.5,
                  child: TextFormField(
                    validator: (value){
                      if(value.isEmpty)
                        return 'user name is empty';
                      else
                        return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Enter a Username'
                    ),

                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 5.0,
                      bottom: 20.0
                  ),
                  width: size.width / 1.5,
                  child: TextFormField(
//                  key: _formKey,
                  obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Enter a Password'
                    ),
                  ),
                ),
                FlatButton(
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        print('passed validation');
                        Navigator.pushNamed(context, '/catalog');
                      }
                    },
                    color: Colors.yellow,
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Text('ENTER'))
              ],


            ),
          ),
        ),
      ),
    );

  }

}

