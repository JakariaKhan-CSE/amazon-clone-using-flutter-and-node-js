import 'package:amazon_clone/common/widget/customButton.dart';
import 'package:amazon_clone/common/widget/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signUp
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _signInFormkey = GlobalKey<FormState>();
  final _signUpFormkey = GlobalKey<FormState>();
  Auth _auth = Auth.signUp;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariables.greyBackgroundCOlor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                SizedBox(height: 10,),
                ListTile(
                  //list tile er sob kisu ai color hobe
                  tileColor: _auth == Auth.signUp ? GlobalVariables.backgroundColor: GlobalVariables.greyBackgroundCOlor,
                  title: Text('Create Account',style: TextStyle(fontWeight: FontWeight.bold),),
                  leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signUp, // Auth.signup
                    groupValue: _auth,
                    onChanged: (Auth? val){
                    setState(() {
                      _auth = val!;
                    });
                    },
                  ),
                ),
          
                if(_auth == Auth.signUp)
                  Container(
                    padding: EdgeInsets.all(8),
                    color: GlobalVariables.backgroundColor,
                    child: Form(
                      key: _signUpFormkey,
                        child: Column(
                          children: [
                            CustomTextField(controller: _nameController, hintText: "Name"),
                            SizedBox(height: 10,),
                            CustomTextField(controller: _emailController, hintText: "Email"),
                            SizedBox(height: 10,),
                            CustomTextField(controller: _passwordController, hintText: "Password"),
                            SizedBox(height: 10,),
                            CustomButton(text: 'SignUp', onTap: (){
          
                            })
          
                          ],
                        )),
                  ),
          
                ListTile(
                  tileColor: _auth == Auth.signin ? GlobalVariables.backgroundColor: GlobalVariables.greyBackgroundCOlor,
                  title: Text('Sign-In',style: TextStyle(fontWeight: FontWeight.bold),),
                  leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signin, // Auth.signup
                    groupValue: _auth,
                    onChanged: (Auth? val){
                    setState(() {
                      _auth = val!;
                    });
                    },
                  ),
                ),
                if(_auth == Auth.signin)
                  Container(
                    padding: EdgeInsets.all(8),
                    color: GlobalVariables.backgroundColor,
                    child: Form(
                        key: _signInFormkey,
                        child: Column(
                          children: [

                            CustomTextField(controller: _emailController, hintText: "Email"),
                            SizedBox(height: 10,),
                            CustomTextField(controller: _passwordController, hintText: "Password"),
                            SizedBox(height: 10,),
                            CustomButton(text: 'SignIn', onTap: (){

                            })

                          ],
                        )),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}