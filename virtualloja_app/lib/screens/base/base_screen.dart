import 'package:flutter/material.dart';
import 'package:virtualloja_app/commom/custom_drawe/custom_drawer.dart';

class BaseScreen extends StatelessWidget {

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      children: [
        Scaffold(
          drawer: CustomDrawer() ,
          appBar: AppBar(
            title: const Text('Home'),
          ),
        ),
        Container(color: Colors.red,),
        Container(color: Colors.yellow,),
        Container(color: Colors.green,),
      ],
    );
  }
}
