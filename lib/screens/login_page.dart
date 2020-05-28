import 'package:flutter/material.dart';

import '../widgets/bezierContainer.dart';
import '../widgets/login_components.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title, this.isLogin = false}) : super(key: key);
  final String title;
  final bool isLogin;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool isLogin;
  @override
  void initState() {
    super.initState();
    isLogin = widget.isLogin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -MediaQuery.of(context).size.height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer(),
              ),
              Positioned(top: 40, left: 0, child: backButton(context)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: AnimatedSwitcher(
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) =>
                          ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                  child: isLogin
                      ? _loginBuilder(context)
                      : _signupBuilder(context),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedSwitcher(
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) =>
                          ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                  child: switchModeLabel(
                    () => setState(() => isLogin = !isLogin),
                    isLogin,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginBuilder(BuildContext context) {
    return Flex(
      key: ValueKey('login'),
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        title(context),
        SizedBox(
          height: 30,
        ),
        emailPasswordWidget(isLogin),
        SizedBox(
          height: 15,
        ),
        submitButton(
          context,
          isLogin,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.centerRight,
          child: Text(
            'Forgot Password ?',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        divider(),
        facebookButton(),
        gmailButton(),
      ],
    );
  }

  Widget _signupBuilder(BuildContext context) {
    return Flex(
      key: ValueKey('signup'),
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        title(context),
        SizedBox(
          height: 50,
        ),
        emailPasswordWidget(isLogin),
        SizedBox(
          height: 15,
        ),
        submitButton(
          context,
          isLogin,
        ),
      ],
    );
  }
}
