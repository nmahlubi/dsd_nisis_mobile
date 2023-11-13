import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/intake/auth_token.dart';
import '../../service/intake/authenticate_user.dart';
import '../../sessions/session.dart';
import '../../shared/apierror.dart';
import '../../shared/apiresponse.dart';
import '../../shared/loading_overlay.dart';
import '../../util/app_url.dart';
import '../dashboard/welcome.dart';
import 'forgot_password.dart';

class LoginAuthenticatePage extends StatefulWidget {
  const LoginAuthenticatePage({Key? key, required String title})
      : super(key: key);

  @override
  State<LoginAuthenticatePage> createState() =>
      _LoginAuthenticatePageWidgetState();
}

class _LoginAuthenticatePageWidgetState extends State<LoginAuthenticatePage> {
  SharedPreferences? preferences;

  Future<void> initializePreference() async {
    preferences = await SharedPreferences.getInstance();
  }

  final _authenticateUserClient = AuthenticateUser();
  final _loginFormKey = GlobalKey<FormState>();
  late ApiResponse apiResponse = ApiResponse();
  late AuthToken authToken = AuthToken();

  //controls
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      initializePreference().whenComplete(() {
        // now preferences is accessible
        //print(preferences?.getKeys());
        setState(() {});
      });
      clearFields();
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  authenticateUser() async {
    final overlay = LoadingOverlay.of(context);
    final navigator = Navigator.of(context);
    overlay.show();

    // apiResponse = await _authenticateUserClient.login(usernameController.text,
    //     passwordController.text, '00000000000000', 'Model');

    int flutterVar =
        1; // declare a variable named 'flutterVar' and set its value to 1

    if (flutterVar == 1) {
      overlay.hide();
      Session session = Session();
      navigator.push(
        MaterialPageRoute(
            builder: (context) => WelcomePage(session: session, title: '')),
      );
    } else {
      showDialogMessage((apiResponse.apiError as ApiError));
      overlay.hide();
    }

    // if ((apiResponse.apiError) == null) {
    //   authToken = (apiResponse.data as AuthToken);
    //   await setTokenPreferenceSession(authToken);
    //   overlay.hide();
    //   Session session = Session();
    //   navigator.push(
    //     MaterialPageRoute(
    //         builder: (context) => WelcomePage(session: session, title: '')),
    //   );
    // } else {
    //   showDialogMessage((apiResponse.apiError as ApiError));
    //   overlay.hide();
    // }
  }

  showDialogMessage(ApiError apiError) {
    final messageDialog = ScaffoldMessenger.of(context);
    messageDialog.showSnackBar(
      SnackBar(content: Text(apiError.error!), backgroundColor: Colors.red),
    );
  }

  clearFields() async {
    usernameController.clear();
    passwordController.clear();
  }

  setTokenPreferenceSession(AuthToken authToken) async {
    await preferences?.setInt('userId', authToken.userId!);
    await preferences?.setString('firstname', authToken.firstname!);
    await preferences?.setString('username', authToken.username!);
    await preferences?.setString('token', authToken.token!);
    await preferences?.setBool('supervisor', authToken.supervisor!);
    await preferences?.setBool(
        'datacapture', authToken.nisisRoleDto!.dataCapture!);
    await preferences?.setBool('manager', authToken.nisisRoleDto!.manager!);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xFFFEF9F4),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child:
                      Image.asset('images/2dsd.png', width: 350), // Logo image
                ),
                SizedBox(height: 30),
                Text(
                  'Welcome to DSD Training Site',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE3C263),
                  ),
                ),
                Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: usernameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Username',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter username';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle Cancel action
                          },
                          child: Text('Cancel'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            side: BorderSide(color: Colors.black, width: 1.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_loginFormKey.currentState!.validate()) {
                              authenticateUser();
                            }
                          },
                          child: Text('Log In'),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFE3C263),
                            onPrimary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PasswordResetPage()),
                    );
                  },
                  child: Text(
                    'Forgot/Reset Password',
                    style: TextStyle(
                      color: Color(0xFFE3C263),
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
