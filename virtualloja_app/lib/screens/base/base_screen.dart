import 'package:flutter/material.dart';
import 'package:virtualloja_app/commom/custom_drawe/custom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:virtualloja_app/models/page_manager.dart';
import 'package:virtualloja_app/screens/base/login/login_screen.dart';

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
          Scaffold(
            drawer: CustomDrawer() ,
            appBar: AppBar(
              title: const Text('Home1'),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer() ,
            appBar: AppBar(
              title: const Text('Home1'),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer() ,
            appBar: AppBar(
              title: const Text('Home2'),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer() ,
            appBar: AppBar(
              title: const Text('Home3'),
            ),
          ),
          Container(color: Colors.red,),
          Container(color: Colors.yellow,),
          Container(color: Colors.green,),
        ],
      ),
    );
  }
}
