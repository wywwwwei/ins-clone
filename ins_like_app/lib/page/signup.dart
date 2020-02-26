import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ins_like_app/utilities/constraints.dart';

class SignUpPage extends StatefulWidget{
  static const routeName = '/SignUpPage';

  @override
  State<StatefulWidget> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage>{
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  String _email,_password;
  bool _obsecureText = true;

  //Submit form and log in
  _submit(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print(_email);
      print(_password);
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
            validator: (input) => input.isEmpty || !input.contains('@') ? 'Please enter a valid email' : null,
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
          //alignment: Alignment.centerLeft,
          child: TextFormField(
            controller: _controller,
            style: TextStyle(
              color: Colors.black,
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
            validator: (input) => input.isEmpty || input.length < 6 ? 'Must be at least 6 characters': null,
            onSaved: (input) => _password = input,
          ),
        ),
      ],
    );
  }

  //Repeat password input field
  Widget _buildRepeatPasswordField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: CustomLabelStyle,
        ),
        Container(
          height: 70.0,
          //alignment: Alignment.centerLeft,
          child: TextFormField(
            style: TextStyle(
              color: Colors.black,
            ),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              hintText: 'Confirm your password',
              hintStyle:CustomHintStyle,
            ),
            obscureText: _obsecureText,
            validator: (input) => input.isEmpty || input != _controller.text? 'Those passwords didn\'t match.': null,
          ),
        ),
      ],
    );
  }

  //Username input field
  Widget _buildUsernameField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username',
          style: CustomLabelStyle,
        ),
        Container(
          height: 70.0,
          //alignment: Alignment.centerLeft,
          child: TextFormField(
            style: TextStyle(
              color: Colors.black,
            ),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
                onPressed: () =>_formKey.currentState.reset(),
              ),
              hintText: 'Enter your username',
              hintStyle:CustomHintStyle,
            ),
            validator: (input) => input.isEmpty|| input.length < 2 || input.length > 12  ? 'Must be at least 2 and at most 12 characters' : null,
            onSaved: (input) => _email = input,
          ),
        ),
      ],
    );
  }

  Widget _buildInputField(){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildEmailField(),
          SizedBox(
            height: 10.0,
          ),
          _buildPasswordField(),
          SizedBox(
            height: 10.0,
          ),
          _buildRepeatPasswordField(),
          SizedBox(
            height: 10.0,
          ),
          _buildUsernameField(),
        ],
      ),
    );
  }

  Widget _buildSubmitBtn() {
    return Padding(
        padding: EdgeInsets.only(left: 40.0,right: 40.0,top: 25.0,bottom: 15.0),
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
              'Sign Up',
              style: TextStyle(
                color: Color(0xFF6E6E6E),
                fontSize: 18.0,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
    );
  }

  //Login hint
  Widget _buildLoginHint(){
    return GestureDetector(
      onTap: ()=>Navigator.pop(context),
      child: RichText(
        text: TextSpan(
            children: [
              TextSpan(
                  text: 'Already have ',
                  style: TextStyle(
                    color: Colors.black54,
                  )
              ),
              TextSpan(
                  text: 'an account',
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
                child:
                    Padding(
                      padding: EdgeInsets.fromLTRB(40.0,60.0,40.0,10.0),
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
                          _buildSubmitBtn(),
                          _buildLoginHint(),
                        ],
                      ),
                    ),
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