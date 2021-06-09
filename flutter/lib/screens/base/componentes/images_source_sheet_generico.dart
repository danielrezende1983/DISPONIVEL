import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheetGenerico extends StatelessWidget {

  ImageSourceSheetGenerico(this.onImageSelected);

  final Function(File) onImageSelected;
  final ImagePicker picker = ImagePicker();

  Future<void> editImage(String path, BuildContext context) async {

    final File croppedFile = await ImageCropper.cropImage(
      sourcePath: path,
      aspectRatio: const CropAspectRatio( // trava em uma imagem quadrada
          ratioX: 1.0,
          ratioY: 1.0
      ),
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Editar Imagem',
        toolbarColor: Theme.of(context).primaryColor,
        toolbarWidgetColor: Colors.white,
      ),
      iosUiSettings: const IOSUiSettings(
        title: 'Editar Imagem',
        cancelButtonTitle: 'Cancelar',
        doneButtonTitle: 'Concluir',
      ),
    );

    if(croppedFile != null){
      onImageSelected(croppedFile);
    }

  }

  @override
  Widget build(BuildContext context) {

    if (Platform.isIOS){

      return CupertinoActionSheet(
        title: const Text('Selecionar foto para o item'),
        message: const Text('Escolha a origem da foto'),
        cancelButton: CupertinoActionSheetAction(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        actions: <Widget>[
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () async {
              final PickedFile file = await picker.getImage(source: ImageSource.camera);
              //onImageSelected(File(file.path));
              editImage(file.path, context);
            },
            child: const Text('Câmera'),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              final PickedFile file = await picker.getImage(source: ImageSource.gallery);
              //onImageSelected(File(file.path));
              editImage(file.path, context);
            },
            child: const Text('Galeria'),
          ),
        ],
      );

    }else{

      return BottomSheet(
        onClosing: (){
          // função que será chamada quando fechar bottomSheet
        },
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FlatButton(
              onPressed: () async {
                final PickedFile file = await picker.getImage(source: ImageSource.camera);
                //onImageSelected(File(file.path));
                editImage(file.path, context);
              },
              child: const Text('Câmera'),
            ),
            FlatButton(
              onPressed: () async {
                final PickedFile file = await picker.getImage(source: ImageSource.gallery);
                //onImageSelected(File(file.path));
                editImage(file.path, context);
              },
              child: const Text('Galeria'),
            ),
          ],
        ),
      );
    }

  }
}
