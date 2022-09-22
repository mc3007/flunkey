import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flunkey/homePage.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  var formKey=GlobalKey<FormState>();

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  String emailError='Enter your Email';
  String emailInvalidError='Enter a valid email';
  String passwordError='Enter Password';

  void clearText(){
    email.clear();
  }
  bool _obscureText= true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset("assets/1601981025992svg2.svg",width: 150,height: 150,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: email,
                      // ignore: missing_return
                      validator: (String? value) {
                        if(value==null){
                          return emailError;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your Email',
                          suffixIcon: IconButton(icon: const Icon(Icons.clear), onPressed: clearText),
                          errorStyle: const TextStyle(
                            fontSize: 15.0,
                          ),
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0),topRight: Radius.circular(5.0))
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: password,
                      // ignore: missing_return
                      validator: (String? value) {
                        if(value==null){
                          return passwordError;
                        }
                      },
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your Password',
                          suffixIcon: IconButton(
                              icon: _obscureText ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                              onPressed: (){
                                setState(() =>_obscureText=!_obscureText);
                              }),
                          errorStyle: const TextStyle(
                            fontSize: 15.0,
                          ),
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5.0),bottomRight: Radius.circular(5.0))
                          )
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()) {
                        if(email == "flunkey" && password == "password123"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return HomePage();
                              }));
                        }else if(email == "user" && password == "password123"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return HomePage();
                              }));
                        }
                      }
                    },
                    child: const Text("Log in"),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}
