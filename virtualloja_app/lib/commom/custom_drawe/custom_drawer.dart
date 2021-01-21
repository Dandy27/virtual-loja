import 'package:flutter/material.dart';
import 'package:virtualloja_app/commom/custom_drawe/custom_drawer_header.dart';
import 'package:virtualloja_app/commom/custom_drawe/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          CustomDrawerHeader(),
          DrawerTile(
            iconData: Icons.home,
            title: 'Início',
            page: 0,
          ),
          DrawerTile(
            iconData: Icons.list,
            title: 'Produtos',
            page: 1,
          ),
          DrawerTile(
            iconData: Icons.playlist_add_check,
            title: 'Meus Pedidos',
            page: 2,
          ),
          DrawerTile(
            iconData: Icons.location_on,
            title: 'Lojas',
            page: 3,
          ),
        ],
      ),
    );
  }
}
