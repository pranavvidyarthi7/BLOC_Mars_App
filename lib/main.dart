import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mar_rover/screens/MainScreen.dart';
import 'screens/MainPage.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MarsRover());
}

User _user;

class MarsRover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: RedirectionScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        RedirectionScreen.id: (context) => RedirectionScreen(),
        MainScreen.id: (context) => MainScreen(),
      },
    );
  }
}

class RedirectionScreen extends StatefulWidget {
  static const id = 'RedirectionScreen';
  @override
  _RedirectionScreenState createState() => _RedirectionScreenState();
}

class _RedirectionScreenState extends State<RedirectionScreen> {
  void initState() {
    User user = FirebaseAuth.instance.currentUser;
    _updateUser(user);
  }

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _user == null ? WelcomeScreen() : MainScreen();
  }
}
