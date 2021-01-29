import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ImageSourceSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(Platform.isAndroid)
    return BottomSheet(
      onClosing: (){},
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FlatButton(
            onPressed: (){

            },
            child: const Text('Câmera'),
          ),
          FlatButton(
            onPressed: (){

            },
            child: const Text('Galeria'),
          ),
        ],
      ),
    );
    else
      return CupertinoActionSheet(
        title: const Text('Selecionar foto para o Item'),
        message: const Text('Escolha  aorigem da foto'),
        cancelButton: CupertinoActionSheetAction(
          onPressed: Navigator.of(context).pop,
          child: const Text('Cancelar'),
        ),
        actions: [
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: (){

            },
            child: const Text('Câmera'),
          ),
          CupertinoActionSheetAction(
            onPressed: (){

            },
            child: const Text('Galeria'),
          )
        ],
      );
  }
}
