import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:hello_there_animation/signup.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup':(BuildContext context)=> new SignupPage()
      },
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {

  Animation animation, delayedAnimation, muchDelayedAnimation, dotDelayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0.5, 1.0, curve:Curves.fastOutSlowIn))
    );

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0.8, 1.0, curve:Curves.fastOutSlowIn))
    );

    dotDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0.9, 1.0, curve:Curves.easeIn))
    );


    animationController.forward();

  }
  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                Container(
                  child: Stack(
                    children: <Widget>[
                    Transform(
                      transform: Matrix4.translationValues(animation.value *width, 0.0, 0.0),

                     child: Container(
                        padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                        child: Text('Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 80.0,
                          color: Color(getColorHexFromStr('055B5C'))
                        ),
                        ),
                      ),
                    ),
          Transform(
          transform: Matrix4.translationValues(dotDelayedAnimation.value *width, 0.0, 0.0),

                  child: Container(
                        padding: EdgeInsets.fromLTRB(225.0, 120.0, 0.0, 0.0),
                        child: Text('.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 80.0,
                              color: Color(getColorHexFromStr('6EC6CA'))
                          ),
                        ),
                      ),
          ),
                    ],

                  ),
                ),

          Transform (
          transform: Matrix4.translationValues(delayedAnimation.value *width, 0.0, 0.0),
               child: Container(
                        padding: EdgeInsets.only(top: 35.0,left: 20.0,right: 20.0),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                  labelText: 'EMAILL',
                              labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(getColorHexFromStr('6EC6CA'))
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'PASSWORD',
                                labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(getColorHexFromStr('6EC6CA'))
                                  ),
                                ),
                              ),
                              obscureText: true,
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              alignment: Alignment(1.0, 0.0),
                              padding: EdgeInsets.only(right: 130.0, top: 20.0),
                              child: InkWell(
                                child: Text(
                                  'Forget Password',
                                style: TextStyle(
                                    color: Color(getColorHexFromStr('055B5C')),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.underline
                                ),
                                ) ,
                              ),
                            ),
                            SizedBox(height: 40.0),
                            Container(
                              height: 40.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Color(getColorHexFromStr('8474A1')),
                                color: Color(getColorHexFromStr('8474A1')),
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: (){},
                                  child: Center(
                                    child: Text('LOGIN', style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            Container(
                              height: 40.0,
                              color: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(getColorHexFromStr('CCABD8')),
                                    style: BorderStyle.solid,
                                    width: 1.0
                                  ),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: ImageIcon(
                                        AssetImage('assets/facebook.png'),

                                      ),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Center(
                                      child: Text('Login with facebook',
                                      style: TextStyle(
                                          fontWeight:FontWeight.bold,
                                      fontFamily: 'Montserrat',

                                      ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
          ),
                      SizedBox(height: 15.0,),
          Transform (
          transform: Matrix4.translationValues(muchDelayedAnimation.value *width, 0.0, 0.0),
                     child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('New account ?',
                          style: TextStyle(
                            fontFamily: 'Montserrat'
                          ),
                          ),
                          SizedBox(width: 5.0,),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pushNamed('/signup');
                            },
                            child: Text('Register',
                            style: TextStyle(
                                color: Color(getColorHexFromStr('055B5C')),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline
                            ),
                            ),
                          ),
                        ],
                      ),
          ),

              ],
            ),
          );
        });
  }
}


