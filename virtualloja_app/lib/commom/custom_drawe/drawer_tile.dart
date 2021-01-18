import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualloja_app/models/page_manager.dart';
class DrawerTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final int page;

  const DrawerTile({Key key, this.iconData, this.title, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // quando for utilizar dentro do "build para modificar o estado conforme um valor interno você vai colocr o tipo "watch""
    final int curPage = context.watch<PageManager>().page;
    final Color primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: (){
        // sempre que for utilizar o "context" e for buscar um objeto pelo o "Provider"dentro de uma função, tem que utilizar o "read"
        context.read<PageManager>().setPage(page);
        
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                iconData,
                size: 32,
                color: curPage == page ? primaryColor : Colors.grey[700],
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16,
                color: curPage == page ? primaryColor : Colors.grey[700]),
            )
          ],
        ),
      ),
    );
  }
}
