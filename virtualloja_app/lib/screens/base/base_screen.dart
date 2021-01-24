import 'package:flutter/material.dart';
import 'package:virtualloja_app/commom/custom_drawe/custom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:virtualloja_app/models/page_manager.dart';
import 'package:virtualloja_app/screens/home/home_screen.dart';
import 'package:virtualloja_app/screens/products/products_screen.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomeScreen(),
          ProductsScreen(),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Meus Pedidos'),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Lojas'),
            ),
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
