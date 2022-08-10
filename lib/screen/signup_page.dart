import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/screen/home_page.dart';
import 'package:movie_app/screen/signin_page.dart';
import 'package:http/http.dart';

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

  // Future login() async {
  //   try{
  //     Response response = await post(
  //       Uri.parse('https://api-telly-tell.herokuapp.com/api/client/signup'),
  //       body: {
  //         'firstName': firstnameController.text,
  //         'lastName': lastnameController.text,
  //         'email': emailController.text,
  //         'password': passwordController.text
  //       }
  //     );
  //     if(response.statusCode == 200){
  //       print('Account created');
  //     }else{
  //       print('failed');
  //     }
  //   }catch(e) {
  //     print(e.toString());
  //   }
  // }

  // Future signup() async {
  //   var response = await post(Uri.parse("https://api-telly-tell.herokuapp.com/api/client/signup"),
  //   body: {"firstName":firstnameController.text, "lastName":lastnameController.text, "email": emailController.text, "password": passwordController.text});
  //
  // }

  Future signup() async {
    try{
      var response = await post(Uri.parse("https://api-telly-tell.herokuapp.com/api/client/signup"),
          body: {"firstName":firstnameController.text, "lastName":lastnameController.text, "email": emailController.text, "password": passwordController.text
      });
      if(response.statusCode == 201){
        print("Account Created");
        //Fluttertoast.showToast(msg: 'Account Created');
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
                            Text('Glad to see you my buddy',
                              style: TextStyle(fontSize: 15,color: Colors.black45),),
                          ],
                        ),
                      ),
                      SizedBox(height: 25),
                      TextField(
                        controller: firstnameController,
                        decoration: InputDecoration(
                          hintText: 'First Name',
                          hintStyle: TextStyle(color: Colors.red),
                          prefixIcon: Icon(Icons.person,color: Colors.red,),
                        ),),
                      SizedBox(height: 25),
                      TextField(
                        controller: lastnameController,
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                          hintStyle: TextStyle(color: Colors.red),
                          prefixIcon: Icon(Icons.person,color: Colors.red,),
                        ),),
                      SizedBox(height: 25),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.red),
                          prefixIcon: Icon(Icons.email,color: Colors.red,),
                        ),),
                      SizedBox(height: 5),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.red),
                          prefixIcon: Icon(Icons.lock,color: Colors.red,),
                        ),),
                      SizedBox(height: 70),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(340, 50),
                          primary: Colors.red, // background
                          onPrimary: Colors.white, // foreground
                          elevation: 15,
                        ),
                        onPressed: () {
                          // login();
                          signup();
                        },
                        child: Text('Continue',style: TextStyle(fontSize: 18),),
                      ),
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
