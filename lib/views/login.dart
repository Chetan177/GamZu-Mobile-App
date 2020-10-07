import 'package:GameZooApp/model/colors.dart';
import 'package:GameZooApp/widgets/extra.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Primary,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
              child: Text(
                'Gam',
                style: GoogleFonts.openSans(
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70),
              )),
          Container(
              padding: EdgeInsets.fromLTRB(20.0, 175.0, 0.0, 0.0),
              child: Text(
                'Zu',
                style: GoogleFonts.openSans(
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                    color: Secondary),
              )),
          getSpacing(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Sign-in with Google',
                    style: GoogleFonts.openSans(
                        color: Colors.white70, fontSize: 24),
                  ),
                ),
                onPressed: _handleSignIn,
                color: Secondary,
              ),
            ],
          ),
        ],
      ),
    );
  }
  Future<FirebaseUser> _handleSignIn() async {
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user = (await firebaseAuth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }
  _signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    final FirebaseUser user = (await firebaseAuth.signInWithCredential(credential)).user;
  }
}


