import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/screen/signin_page.dart';
import 'package:http/http.dart';
import 'package:movie_app/widget/customTextField.dart';

import '../widget/customButton.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();

  Future signup() async {
    try{
      var response = await post(Uri.parse("https://api-telly-tell.herokuapp.com/api/client/signup"),
          body: {"firstName":firstnameController.text, "lastName":lastnameController.text, "email": emailController.text, "password": passwordController.text
      });
      if(response.statusCode == 201){
        //Fluttertoast.showToast(msg: 'Account Created');
        Fluttertoast.showToast(
            msg: "Account Created",  // message
            toastLength: Toast.LENGTH_SHORT, // length
            gravity: ToastGravity.BOTTOM,    // location
            timeInSecForIosWeb: 1               // duration
        );
        Navigator.push(context, MaterialPageRoute(builder: (_)=>SignInPage()));
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
              child: Text('Sign Up',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
            ),
            Container(
              margin: EdgeInsets.only(top: 140),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 200,left: 20),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text('Welcome Buddy!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red),),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                      SizedBox(height: 25),
                      customTextField('First Name', firstnameController, Icons.person),
                      SizedBox(height: 15),
                      customTextField('Last Name', lastnameController, Icons.person),
                      SizedBox(height: 15),
                      customTextField('Email', emailController, Icons.email),
                      SizedBox(height: 15),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.red),
                          prefixIcon: Icon(Icons.lock,color: Colors.red,),
                        ),),
                      SizedBox(height: 40),
                      customButton("Continue", (){
                        signup();
                      }),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, CupertinoPageRoute(builder: (_)=>SignInPage()));
                            },
                            child: const Text('Sign In',style: TextStyle(color: Colors.red),),
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
