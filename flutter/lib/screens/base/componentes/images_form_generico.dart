import 'dart:io';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:evento_gerente/models/retorno_images_form_generico.dart';
import 'package:evento_gerente/screens/base/componentes/images_source_sheet_generico.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagesFormGenerico extends StatelessWidget {

  const ImagesFormGenerico(this.listaImagesUrl, this.quantidadeMaximaFotos, this.retorno);

  final List<String> listaImagesUrl;
  final int quantidadeMaximaFotos;
  final RetornoImagesFormGenerico retorno;

  @override
  Widget build(BuildContext context) {

    return FormField<List<dynamic>>(
      initialValue: List.from(listaImagesUrl), // state passará a ter lista de images strings criando um nova lista de imagens
      validator: (images){
        if(images.isEmpty){
          return 'Insira ao menos uma imagem';
        }else{
          return null;
        }
      },
      onSaved: (images){
        retorno.novasImagesRetornadas = images;
      },
      builder: (state){ // adiciona ou remove qualquer imagem no estado
        // para que tenha acesso ao state
        void onImageSelected(File file){
          state.value.add(file);
          state.didChange(state.value);
          Navigator.of(context).pop();
        }
        Material _mostreFotoAdicionar(){
          return Material(
            color: Colors.grey[100],
            child: IconButton(
              icon: const Icon(Icons.add_a_photo),
              color: Theme.of(context).primaryColor,
              iconSize: 100,
              onPressed: (){
                if (Platform.isIOS) {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (_) => ImageSourceSheetGenerico(onImageSelected)
                  );
                } else {
                  showModalBottomSheet(
                      context: context,
                      builder: (_) => ImageSourceSheetGenerico(onImageSelected)
                  );
                }
              },
            ),
          );
        }
        Stack _corpoCarousel(dynamic image){
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              if(image is String)
                Image.network(
                  image,
                  fit: BoxFit.cover,
                )
              else
                Image.file(
                  image as File,
                  fit: BoxFit.cover,
                ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.remove_circle),
                  color: Colors.red,
                  iconSize: 30,
                  onPressed: (){
                    state.value.remove(image);
                    state.didChange(state.value); // informando o builder que teve alteração
                  },
                ),
              ),
            ],
          );
        }
        List<dynamic> _listaImagens(){
          if (state.value.length < quantidadeMaximaFotos){
            return state.value.map<Widget>((image){
              return _corpoCarousel(image);
            }).toList()..add(_mostreFotoAdicionar()); // .. é o operador de cascata
          }else{
            return state.value.map<Widget>((image){
              return _corpoCarousel(image);
            }).toList();
          }
        }
        return Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: Carousel(
                images: _listaImagens(),
                dotSize: 4,
                dotBgColor: Colors.transparent,
                dotColor: Theme.of(context).primaryColor,
                dotIncreasedColor: Theme.of(context).primaryColor,
                dotSpacing: 15,
                autoplay: false,
              ),
            ),
            if(state.hasError)
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 16, left: 16),
                child: Text(
                  state.errorText,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

}
