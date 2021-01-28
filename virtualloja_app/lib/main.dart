import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualloja_app/models/admin_users_manager.dart';
import 'package:virtualloja_app/models/cart_manager.dart';
import 'package:virtualloja_app/models/home_manager.dart';
import 'package:virtualloja_app/models/product.dart';
import 'package:virtualloja_app/models/product_manager.dart';
import 'package:virtualloja_app/models/user_manager.dart';
import 'package:virtualloja_app/screens/base/base_screen.dart';
import 'package:virtualloja_app/screens/base/login/login_screen.dart';
import 'package:virtualloja_app/screens/base/signup/signup_screen.dart';
import 'package:virtualloja_app/screens/product/product_screen.dart';
import 'screens/cart/cart_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProxyProvider<UserManager, CartManager>(
          create: (_) => CartManager(),
          lazy: false,
          update: (_, userManager, cartManager) =>
              cartManager..updateUser(userManager),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => HomeManager(),
          lazy: false,
        ),
        ChangeNotifierProxyProvider<UserManager, AdminUsersManager>(
            create: (_) => AdminUsersManager(),
            update: (_, userManager, adminUsersManager) =>
        adminUsersManager..updateUser(userManager)
        ),
      ],
      child: MaterialApp(
        title: 'DANDY 27 STORE ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 4, 125, 141),
          scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
          appBarTheme: const AppBarTheme(elevation: 0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: 'base',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginScreen());

            case '/signup':
              return MaterialPageRoute(builder: (_) => SignUpScreen());
            case '/product':
              return MaterialPageRoute(
                  builder: (_) => ProductScreen(settings.arguments as Product));
            case '/cart':
              return MaterialPageRoute(builder: (_) => CartScreen());
            case '/base':
            default:
              return MaterialPageRoute(builder: (_) => BaseScreen());
          }
        },
      ),
    );
  }
}
