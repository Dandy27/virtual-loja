import 'package:flutter/material.dart';
import 'package:virtualloja_app/commom/custom_icon_button.dart';
import 'package:virtualloja_app/models/item_size.dart';

class EditItemSize extends StatelessWidget {
  const EditItemSize({Key key, this.size, this.onRemove, this.onMoveUp,
    this.onMoveDown }) : super(key: key);

  final ItemSize size;
  final VoidCallback onRemove;
  final VoidCallback onMoveUp;
  final VoidCallback onMoveDown;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 30,
          child: TextFormField(
            initialValue: size.name,
            decoration: const InputDecoration(
              labelText: 'Título',
              isDense: true,
            ),
            validator: (name){
              if(name.isEmpty)
                return 'Inválido';
              return null;
            },
            onChanged: (name) => size.name = name,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          flex: 30,
          child: TextFormField(
            initialValue: size.stock?.toString(),
            decoration: const InputDecoration(
              labelText: 'Estoque',
              isDense: true,
            ),
            keyboardType: TextInputType.number,
            validator: (stock){
              if(int.tryParse(stock) == null)
                return 'Inválido';
              return null;
            },
            onChanged: (stock) => size.stock = int.tryParse(stock),
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          flex: 40,
          child: TextFormField(
            initialValue: size.price?.toStringAsFixed(2),
            decoration: const InputDecoration(
                labelText: 'Preço', isDense: true, prefixText: 'R\$'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: (price){
              if(num.tryParse(price) == null)
                return 'Inválido';
              return null;
            },
            onChanged: (price) => size.price = num.tryParse(price),
          ),
        ),
        CustomIconButton(
          iconData: Icons.remove,
          color: Colors.red,
          onTap: onRemove,
        ),
        CustomIconButton(
          iconData: Icons.arrow_drop_up,
          onTap: onMoveUp,
          color: Colors.black,
        ),
        CustomIconButton(
          iconData: Icons.arrow_drop_down,
          onTap: onMoveDown,
          color: Colors.black,
        )
      ],
    );
  }
}
