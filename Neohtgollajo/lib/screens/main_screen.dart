import 'package:flutterproject/screens/weather.dart';
import 'package:flutterproject/config/palette.dart';
import 'package:flutterproject/screens/googlesign.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();

}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final _authentication = FirebaseAuth.instance; //사용자의 등록과 인증에 사용
  bool isSignupScreen = true;
  final _formKey = GlobalKey<FormState>(); //텍스트폼 validation
  String username = '';
  String useremail = '';
  String userpassword = '';

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate(); //모든 텍스트 폼필드에 validation 작동
    if(isValid) {
      _formKey.currentState!.save(); //currentState에 근거해서 save를 불러올수있기때문에 null체크
    }
  }
  @override
  Widget build(BuildContext context) {
    //FirebaseAuth.instance.authStateChanges();
    return Scaffold(
      backgroundColor: Palette.backgroudColor,
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned(
              top:0,
              right: 0,
              left: 0,
              child: Container(
                height: 177,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('image/logo.png'),
                    fit: BoxFit.fill
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 100, left: 20),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                            text: '',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 25,
                              color: Color.fromARGB(255,146,168,209),
                              fontWeight: FontWeight.bold
                            ),
                          ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      /*
                      Text(
                          isSignupScreen ? 'signup to continue' : 'Signin to continue',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        color: Colors.blueAccent,
                      ),
                      ),
                      */
                    ],
                  ),
                ),
              ),
            ),
            //배경
            Positioned(
              top: 180,
              child: Container(
                padding: EdgeInsets.all(20.0),
                height: isSignupScreen ? 280.0 : 250.0,
                width: MediaQuery.of(context).size.width-40, //기종에 맞게 넓이 알아서 조절
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                isSignupScreen = false;
                              }); //사용자가 로그인을 선택
                            },
                            child: Column(
                              children: [
                                Text(
                                  '로그인',
                                  style: TextStyle(
                                    fontFamily: "JUA",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color:!isSignupScreen ? Palette.activeColor : Palette.textColor1
                                  ),
                                ),
                                if(!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top:3),
                                  height: 2,
                                  width: 55,
                                  color: Color.fromARGB(255,146,168,209),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                isSignupScreen = true;
                              }); // 사용자가 siunup을 선택함
                            },
                            child: Column(
                              children: [
                                Text(
                                  '회원가입',
                                  style: TextStyle(
                                      fontFamily: "JUA",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: isSignupScreen ? Palette.activeColor : Palette.textColor1
                                  ),
                                ),
                                if(isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top:3),
                                  height: 2,
                                  width: 55,
                                  color: Color.fromARGB(255,146,168,209),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      if(isSignupScreen)
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                key: ValueKey(1),
                                validator: (value){
                                  if(value!.isEmpty || value.length < 4) {
                                    return 'Please enter at least 4 char';
                                  }
                                  return null;
                                },
                                onSaved: (value){
                                  username = value!;
                                },
                                onChanged: (value){
                                  username = value;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    color: Palette.iconColor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Palette.textColor1
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(35.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder( //텍스트 입력할때 모양 바뀌는거 막아줌
                                    borderSide: BorderSide(
                                        color: Palette.textColor1
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(35.0),
                                    ),
                                  ),
                                  hintText: 'User name',
                                  hintStyle: TextStyle(
                                    fontFamily: "JUA",
                                    fontSize: 14,
                                    color: Palette.textColor1
                                  ),
                                  contentPadding: EdgeInsets.all(10)
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                key: ValueKey(2),
                                validator: (value){
                                  if(value!.isEmpty || !value.contains('@')) {
                                    return 'Please enter @';
                                  }
                                  return null;
                                },
                                onSaved: (value){
                                  useremail = value!;
                                },
                                onChanged: (value){
                                  useremail = value;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Palette.iconColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder( //텍스트 입력할때 모양 바뀌는거 막아줌
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0),
                                      ),
                                    ),
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                        fontFamily: "JUA",
                                        fontSize: 14,
                                        color: Palette.textColor1
                                    ),
                                    contentPadding: EdgeInsets.all(10)
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                obscureText: true, //password **** 표시
                                key: ValueKey(3),
                                validator: (value){
                                  if(value!.isEmpty || value.length < 6) {
                                    return 'Password must be at least 7';
                                  }
                                  return null;
                                },
                                onSaved: (value){
                                  userpassword = value!;
                                },
                                onChanged: (value){
                                  userpassword = value;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Palette.iconColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder( //텍스트 입력할때 모양 바뀌는거 막아줌
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0),
                                      ),
                                    ),
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                        fontFamily: "JUA",
                                        fontSize: 14,
                                        color: Palette.textColor1
                                    ),
                                    contentPadding: EdgeInsets.all(10)
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      if(!isSignupScreen)
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Form(
                           key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                key: ValueKey(4),
                                validator: (value){
                                  if(value!.isEmpty || value.length < 4) {
                                    return 'Please enter at least 4 char';
                                  }
                                  return null;
                                },
                                onSaved: (value){
                                  useremail = value!;
                                },
                                onChanged: (value){
                                  useremail = value;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Palette.iconColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder( //텍스트 입력할때 모양 바뀌는거 막아줌
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0),
                                      ),
                                    ),
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                        fontFamily: "JUA",
                                        fontSize: 14,
                                        color: Palette.textColor1
                                    ),
                                    contentPadding: EdgeInsets.all(10)
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              TextFormField(
                                key: ValueKey(5),
                                validator: (value){
                                  if(value!.isEmpty || value.length < 6) {
                                    return 'Password must be at least 7';
                                  }
                                  return null;
                                },
                                onSaved: (value){
                                  userpassword = value!;
                                },
                                onChanged: (value){
                                  userpassword = value;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Palette.iconColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder( //텍스트 입력할때 모양 바뀌는거 막아줌
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0),
                                      ),
                                    ),
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                        fontFamily: "JUA",
                                        fontSize: 14,
                                        color: Palette.textColor1
                                    ),
                                    contentPadding: EdgeInsets.all(10)
                                ),
                              )
                            ],
                          )
                      ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //텍스트폼 필드 (SIGNUP username)
            AnimatedPositioned(
              duration: Duration(microseconds: 500),
              curve: Curves.easeIn,
              top: isSignupScreen ? 430 : 390,
              right: 0,
              left: 0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(15),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: GestureDetector(
                    onTap: () async{
                      if(isSignupScreen) {
                        _tryValidation();
                        try {
                          final newuser = await _authentication.createUserWithEmailAndPassword(
                            email: useremail,
                            password: userpassword,
                          );
                          if(newuser.user != null){
                            Navigator.pushNamed(context, '/tt');
                          }
                        }catch(e) {
                          print(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                  Text('Please check your email and password'),
                                backgroundColor: Color.fromARGB(255,146,168,209),
                            ),
                          );
                        }
                      }
                      if(!isSignupScreen) { //login
                        _tryValidation();
                        try{
                          final newuser = await _authentication.signInWithEmailAndPassword(
                            email: useremail,
                            password: userpassword,
                          );
                          if(newuser.user != null){
                            Navigator.pushNamed(context, '/tt');
                          }
                        }catch(e){
                          print(e);
                        }
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color.fromARGB(255,146,168,209), Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0,1),
                          )
                        ]
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //전송버튼
            AnimatedPositioned(
                duration: Duration(microseconds: 500),
                curve: Curves.easeIn,
                top: isSignupScreen ? MediaQuery.of(context).size.height-125
                :MediaQuery.of(context).size.height-165,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Text(isSignupScreen ? 'or Signup with' : 'or Signin with',
                    style: TextStyle(
                      fontFamily: "JUA",
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                    ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton.icon(
                        onPressed: (){
                          signInWithGoogle().whenComplete(() {
                            Navigator.pushNamed(context, '/tt');
                          });
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          minimumSize: Size(155,40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          backgroundColor: Palette.googleColor
                        ),
                        icon: Icon(Icons.add),
                        label: Text(
                            '구글',
                          style: TextStyle(
                            fontFamily: "JUA",
                            fontSize: 19,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                    ),
                  ],
                ),
            ),
            //구글 로그인 버튼
          ],
        ),
      ),
    );
  }
}