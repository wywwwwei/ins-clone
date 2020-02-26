import 'package:ins_like_app/page/login_animation.dart';
import 'package:ins_like_app/page/signup.dart';
import 'package:ins_like_app/utilities/constraints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget{
  static const routeName = '/LoginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin{
  final _formKey = GlobalKey<FormState>();
  String _email,_password;
  bool _obsecureText = true;
  //Animation
  AnimationController _loginButtonController;
  bool _animation = false;

  Future<Null> _playAnimation() async {
    try {
      await _loginButtonController.forward();
      await _loginButtonController.reverse();
    } on TickerCanceled {}
  }

  //Submit form and log in
  _submit(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print(_email);
      print(_password);
      setState(() {
        _animation = true;
      });
      _playAnimation();
    }
  }

  //Email input field
  Widget _buildEmailField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: CustomLabelStyle,
        ),
        Container(
          height: 70.0,
          //alignment: Alignment.centerLeft,
          child: TextFormField(
            style: TextStyle(
              color: Colors.black,
            ),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
                onPressed: () =>_formKey.currentState.reset(),
              ),
              hintText: 'Enter your e-mail',
              hintStyle:CustomHintStyle,
            ),
            validator: (input) => input == null || !input.contains('@') ? 'Please enter a valid email' : null,
            onSaved: (input) => _email = input,
          ),
        ),
      ],
    );
  }

  //Password input field
  Widget _buildPasswordField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: CustomLabelStyle,
        ),
        Container(
          height: 70.0,
          //alignment: Alignment.bottomCenter,
          child: TextFormField(
            style: TextStyle(
              color: Colors.black,
              //textBaseline: TextBaseline.ideographic,
            ),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obsecureText ? Icons.visibility_off : Icons.visibility ,
                  color: Colors.grey,
                ),
                onPressed: (){
                  setState(() {
                    _obsecureText = !_obsecureText;
                  });
                },
              ),
              hintText: 'Enter your password',
              hintStyle:CustomHintStyle,
            ),
            obscureText: _obsecureText,
            validator: (input) => input == null || input.length < 6 ? 'Must be at least 6 characters ': null,
            onSaved: (input) => _password = input,
          ),
        ),
      ],
    );
  }

  //Login/Submit button
//  Widget _buildSubmitBtn(){
//    return _animation
//    ? LoginAnimation(buttonController: _loginButtonController.view,)
//    :Container(
//      padding: EdgeInsets.only(
//        bottom: 10.0,
//      ),
//      width: double.infinity,
//      child: RaisedButton(
//        color: Colors.white,
//        elevation: 5.0,
//        onPressed: (){},
//        padding: EdgeInsets.all(15.0),
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(30.0),
//        ),
//        child: Text(
//          'Login',
//          style: TextStyle(
//            color: Color(0xFF6E6E6E),
//            fontSize: 18.0,
//            letterSpacing: 1.5,
//            fontWeight: FontWeight.bold,
//          ),
//        ),
//      ),
//    );
//  }

  Widget _buildSubmitBtn(){
    return Container(
      alignment: Alignment.center,
      child: _animation
          ? LoginAnimation(buttonController: _loginButtonController.view,)
          :Padding(
          padding: EdgeInsets.only(left: 40.0,right: 40.0,top: 365.0),
          child: Container(
            width: double.infinity,
            child: RaisedButton(
              color: Colors.white,
              elevation: 5.0,
              onPressed: _submit,
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  color: Color(0xFF6E6E6E),
                  fontSize: 18.0,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
      ),
    );
  }

  Widget _buildForgotPasswordButton(){
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        padding: EdgeInsets.only(right: 0),
        child: Text(
          'Forgot Password',
          style: CustomLabelStyle,
        ),
        onPressed: ()=> print("Forgot Password"),
      ),
    );
  }

  //Form
  Widget _buildInputField(){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildEmailField(),
          SizedBox(
            height: 20.0,
          ),
          _buildPasswordField(),
          _buildForgotPasswordButton(),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }

  //Other login methods
  //Hint
  Widget _buildLoginHintText(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text(
            'or',
            style: TextStyle(
              color: Colors.black45,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
  //Two methods: Facebook and Google
  Widget _buildOtherAccountButton(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ButtonTheme(
          height: 40.0,
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0),
            side: BorderSide.none,
          ),
          child: RaisedButton(
            onPressed: ()=>print("log in Google"),
            color: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    height: 38.0,
                    width: 38.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child:  Center(
                      child: Image(
                        image: AssetImage('assets/logo/google_logo.png'),
                        height: 18.0,
                        width: 18.0,
                      ),
                    )
                  ),
                ),
                SizedBox(width: 14.0,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
                  child: Text(
                    'Sign in with Google',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.54),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 10.0,),
        ButtonTheme(
          height: 40.0,
          padding: EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0),
            side: BorderSide.none,
          ),
          child: RaisedButton(
            onPressed: ()=>print("Log in Facebook"),
            color: Color(0xFF4267B2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/logo/facebook_logo.png'),
                  height: 24.0,
                  width: 24.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0,right: 10.0),
                  child: Text(
                    'Continue with Facebook',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 10.0,),
      ],
    );
  }

  //Sign up hint
  Widget _buildSignUpHint(){
    return GestureDetector(
      onTap: ()=>Navigator.pushNamed(context, SignUpPage.routeName),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an account? ',
              style: TextStyle(
                color: Colors.black54,
              )
            ),
            TextSpan(
              text: 'Sign up',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )
            ),
          ]
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginButtonController = new AnimationController(duration: new Duration(milliseconds: 3000), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFECE9E6),
                  Color(0xFFFFFFFF),
                ],
              ),
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(40.0,60.0,40.0,20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Share',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        _buildInputField(),
                        _buildLoginHintText(),
                        _buildOtherAccountButton(),
                        _buildSignUpHint(),
                      ],
                    ),
                  ),

                  _buildSubmitBtn(),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(StatefulWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _loginButtonController.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}