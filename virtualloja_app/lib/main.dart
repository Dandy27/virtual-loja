
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualloja_app/models/user_manager.dart';
import 'package:virtualloja_app/screens/base/base_screen.dart';
import 'package:virtualloja_app/screens/base/login/login_screen.dart';
import 'package:virtualloja_app/screens/base/signup/signup_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserManager(),
      lazy: false,
      child: MaterialApp(
        title: 'RR BEBIDAS ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 4, 125, 141),
          scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
          appBarTheme: const AppBarTheme(
            elevation: 0
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: 'base',
        onGenerateRoute: (settings){
          switch(settings.name){
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginScreen());

            case '/signup':
              return MaterialPageRoute(builder: (_) => SignUpScreen());
            case '/base':
            default:
            return MaterialPageRoute(builder: (_) => BaseScreen());
          }
        },
      ),
    );
  }
}
