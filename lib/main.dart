import 'package:flutter/material.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:noteapp/inherited_widgets/note_inherited_widget.dart';
import 'package:splashscreen/splashscreen.dart';
import './app_screens/note_list.dart';


void main() {
  runApp(
    new MaterialApp (
      debugShowCheckedModeBanner: false,
      home: new _SplashScreen(),
    )
  );
}

class _SplashScreen extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<_SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: LocalAuth(),
      image: new Image.asset('assets/icon/icon.png'),
      title: new Text(
        '\t\t\t\t\t\t\t\t\t\tNoteApp\nAshutosh Chitranshi',
        style: new TextStyle(fontSize: 25.0),
      ),
      backgroundColor: Colors.white,
      photoSize: 100.0,
      loaderColor: Colors.white,
    );
  }

}

class LocalAuth extends StatefulWidget {
  @override
  _LocalAuthState createState() => _LocalAuthState();
}

class _LocalAuthState extends State<LocalAuth> {
  bool isAuth = false;
  @override
  Widget build(BuildContext context) {
   return isAuth?App():Scaffold(
     backgroundColor: Colors.white,
     body: Center(
       child: InkWell(
         onTap: () {
           _checkBiometric();
         },
         child: Container(
           height: 60,
           width: MediaQuery.of(context).size.width * 0.9,
           decoration: BoxDecoration(
           border: Border.all(color: Colors.blueAccent, width: 2.5)),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
           Icon(
            Icons.fingerprint,
            color: Colors.blueAccent,
           ),
           Text(
            "Login with Fingerprint",
            style: TextStyle(color: Colors.blueAccent),
           )
         ],
         ),
       ),
     ),
   )
   );
  }

  void _checkBiometric() async {
    // check for biometric availability
    final LocalAuthentication auth = LocalAuthentication();
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } catch (e) {
      print("error biometrics $e");
    }

    print("biometric is available: $canCheckBiometrics");

    // enumerate biometric technologies
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } catch (e) {
      print("error enumerate biometrics $e");
    }

    print("following biometrics are available");
    if (availableBiometrics.isNotEmpty) {
      availableBiometrics.forEach((ab) {
        print("\ttech: $ab");
      });
    } else {
      print("no biometrics are available");
    }

    // authenticate with biometrics
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(localizedReason: "Please authenticate to enter");
    } catch (e) {
      print("error using auth: $e");
    }
    setState(() {
      isAuth = authenticated ? true : false;
    });

    print("authenticated: $authenticated");
  }

}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return NoteInheritedWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Notes",
          home: NoteList(),
        )
    );
  }
}