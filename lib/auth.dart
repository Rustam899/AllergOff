import 'package:allerg_off_prototype/home/Navigation/bottom_bar.dart';
import 'package:allerg_off_prototype/domain/UserLocal.dart';
import 'package:provider/provider.dart';
import 'services/auth.dart';
import 'package:flutter/material.dart';
import 'domain/User.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthorizationPage extends StatefulWidget {
  AuthorizationPage({Key key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email;
  String _password;
  bool showLogin = true;

  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              height: 24,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment(0.8, 0.0),
                  colors: [
                    const Color.fromRGBO(56, 183, 157, 1),
                    const Color.fromRGBO(58, 167, 177, 1),
                  ],
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: 230,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/BackOnRegAuthTop.png'),
                  )),
                ),
                Container(
                  padding: EdgeInsets.only(top: 65),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Image.asset('assets/icons/AllergAuth.png'),
                      Image.asset('assets/icons/OFFAuth.png'),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget _input(Icon icon, String hint, TextEditingController controller,
        bool obscure) {
      return Container(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          style: TextStyle(fontSize: 20, color: Colors.grey),
          decoration: InputDecoration(
            hintStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
                color: Colors.grey),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: IconTheme(
                data: IconThemeData(color: Colors.white),
                child: icon,
              ),
            ),
          ),
        ),
      );
    }

    Widget _button(String text, void func()) {
      return RaisedButton(
        elevation: 0.0,
        splashColor: Color.fromRGBO(58, 177, 155, 1),
        highlightColor: Color.fromRGBO(58, 177, 155, 1),
        color: Color.fromRGBO(58, 177, 155, 1),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          func();
        },
      );
    }

    Widget _form(String label, void func()) {
      return Container(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 20, top: 10),
                      child: _input(
                          Icon(
                            Icons.email,
                            color: Color.fromRGBO(58, 177, 155, 1),
                          ),
                          Provider.of<UserLocal>(context, listen: true)
                                      .language ==
                                  1
                              ? "Почта"
                              : "Email",
                          _emailController,
                          false),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: _input(
                          Icon(Icons.lock,
                              color: Color.fromRGBO(58, 177, 155, 1)),
                          Provider.of<UserLocal>(context, listen: true)
                                      .language ==
                                  1
                              ? "Пароль"
                              : "Password",
                          _passwordController,
                          true),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 16,
                ),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: _button(label, func),
                ),
              ),
            ],
          ),
        ),
      );
    }

    void _loginButtonAction() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email.isEmpty || _password.isEmpty) return;
      User user = await _authService.signinwithEmailandPassword(
          _email.trim(), _password.trim());
      if (user == null) {
        Fluttertoast.showToast(
            msg: Provider.of<UserLocal>(context, listen: true).language == 1
                ? "Неверный логин и/или пароль!"
                : "Icorrect email and/or password!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        _emailController.clear();
        _passwordController.clear();
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => BottomBar()));
      }
    }

    void _registerButtonAction() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email.isEmpty || _password.isEmpty) return;
      User user = await _authService.createUserWithEmailAndPassword(
          _email.trim(), _password.trim());
      if (user == null) {
        Fluttertoast.showToast(
            msg: Provider.of<UserLocal>(context, listen: true).language == 1
                ? "Слишком короткий пароль!"
                : "The password is too short!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _logo(),
          SizedBox(
            height: 41,
          ),
          (showLogin
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _form(
                          Provider.of<UserLocal>(context, listen: true)
                                      .language ==
                                  1
                              ? "Войти"
                              : "Login",
                          _loginButtonAction),
                      Padding(
                        padding: EdgeInsets.only(bottom: 36),
                        child: GestureDetector(
                          child: Text.rich(TextSpan(
                            text: Provider.of<UserLocal>(context, listen: true)
                                        .language ==
                                    1
                                ? "Впервые?"
                                : "Fisrt time here?",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: Provider.of<UserLocal>(context,
                                                listen: true)
                                            .language ==
                                        1
                                    ? " Зарегестрируйтесь! "
                                    : " Rerister now! ",
                                style: TextStyle(
                                    color: Color.fromRGBO(58, 177, 155, 1)),
                              ),
                            ],
                          )),
                          onTap: () {
                            setState(() {
                              showLogin = false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: Column(
                    children: <Widget>[
                      _form(
                          Provider.of<UserLocal>(context, listen: true)
                                      .language ==
                                  1
                              ? "Зарегестрироваться"
                              : "Register",
                          _registerButtonAction),
                      Padding(
                        padding: EdgeInsets.only(bottom: 36),
                        child: GestureDetector(
                          child: Text(
                              Provider.of<UserLocal>(context, listen: true)
                                          .language ==
                                      1
                                  ? "Войти"
                                  : "Login",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              )),
                          onTap: () {
                            setState(() {
                              showLogin = true;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )),
        ],
      ),
    );
  }
}
