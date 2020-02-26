import 'package:ins_like_app/page/feed_home.dart';
import 'package:ins_like_app/page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginAnimation extends StatelessWidget{
  final AnimationController buttonController;
  final Animation _buttonSqueezeAnimation,_buttonZoomOutAnimation;
  final Animation<EdgeInsets> _containerCircleAnimation;

  LoginAnimation({Key key,this.buttonController}):_buttonSqueezeAnimation = Tween(
    begin: 320.0,
    end: 70.0,
  ).animate(
    CurvedAnimation(
      parent: buttonController,
      curve: Interval(0.0,0.25),
    ),
  ),
  _buttonZoomOutAnimation = Tween(
    begin: 70.0,
    end: 1300.0,
  ).animate(
    CurvedAnimation(
      parent: buttonController,
      curve: Interval(
          0.550,0.999,
        curve: Curves.bounceOut,
      ),
    ),
  ),
  _containerCircleAnimation = EdgeInsetsTween(
    begin: const EdgeInsets.only(top: 365.0),
    end: const EdgeInsets.only(top: 0.0),
  ).animate(
    CurvedAnimation(
      parent: buttonController,
      curve: Interval(
        0.530,0.900,
        curve: Curves.ease,
      )
    )
  ),
  super(key:key);

  Future<Null> _playAnimation() async
  {
    try{
      await buttonController.forward();
      await buttonController.reverse();
    }on TickerCanceled {}
  }

  Widget _buildAnimation(BuildContext context,Widget child)
  {
    return Padding(
      padding: _buttonZoomOutAnimation.value == 70 ? const EdgeInsets.only(top: 365.0) : _containerCircleAnimation.value,
      child: InkWell(
        onTap: (){
          _playAnimation();
        },
        child: Hero(
          tag: "fade",
          child: _buttonZoomOutAnimation.value <= 300
              ? Container(
                  width: _buttonZoomOutAnimation.value == 70 ? _buttonSqueezeAnimation.value : _buttonZoomOutAnimation.value,
                  height: _buttonZoomOutAnimation.value == 70 ? 60.0 : _buttonZoomOutAnimation.value,
                  alignment: FractionalOffset.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: _buttonZoomOutAnimation.value < 400
                        ? BorderRadius.all(const Radius.circular(30.0))
                        : BorderRadius.all(const Radius.circular(0)),
                  ),
                  child: _buttonSqueezeAnimation.value > 75.0
                    ? Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF6E6E6E),
                          fontSize: 18.0,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                        )
                      )
                    : _buttonZoomOutAnimation.value < 300.0
                      ? CircularProgressIndicator(
                          value: null,
                          strokeWidth: 1.0,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                        )
                      : null
              )
              : Container(
                  width: _buttonZoomOutAnimation.value,
                  height: _buttonZoomOutAnimation.value,
                  decoration: BoxDecoration(
                    shape: _buttonZoomOutAnimation.value < 500 ? BoxShape.circle : BoxShape.rectangle,
                    color: Colors.white,
                  ),
              )

        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    buttonController.addListener((){
      if(buttonController.isCompleted){
        Navigator.pushNamed(context, HomeScreen.routeName);
      }
    });
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: buttonController,
    );
  }

}