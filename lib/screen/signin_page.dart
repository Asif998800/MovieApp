import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/screen/signup_page.dart';

import 'home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future signIn() async {
    try{
      var response = await post(Uri.parse("https://api-telly-tell.herokuapp.com/api/client/signin"),
          body: {"email": _emailController.text, "password": _passwordController.text
          });
      if(response.statusCode == 201){
        print("Welcome");
        Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
      }else{
        print("Failed");
      }
    }catch(e) {
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 70,left: 20),
              child: Text('Sign In',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
            ),
            Container(
              margin: EdgeInsets.only(top: 140),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
              ),
            ),
            SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Container(
                margin: EdgeInsets.only(top: 200,left: 20),
                child: Container(
                  child: Column(
                    children: [
                      //Welcome Back
                      Container(
                        child: Column(
                          children: [
                            Text('Welcome Back',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red),),
                            SizedBox(height: 5),
                            Text('Glad to have you back my buddy',
                              style: TextStyle(fontSize: 15,color: Colors.black45),),
                          ],
                        ),
                      ),
                      SizedBox(height: 25),
                      //Form
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.red),
                          prefixIcon: Icon(Icons.email,color: Colors.red,),
                        ),),
                      SizedBox(height: 5),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.red),
                          prefixIcon: Icon(Icons.lock,color: Colors.red,),
                        ),),
                      SizedBox(height: 70),
                      //Sign in Button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(340, 50),
                          primary: Colors.red, // background
                          onPrimary: Colors.white, // foreground
                          elevation: 15,
                        ),
                        onPressed: () {
                          signIn();
                        },
                        child: Text('SIGN IN',style: TextStyle(fontSize: 18),),
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Dont have an account?'),
                          SizedBox(width: 5),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, CupertinoPageRoute(builder: (_)=>SignUpPage()));
                            },
                            child: const Text('Sign Up',style: TextStyle(color: Colors.red),),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
