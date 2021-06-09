class RetornoImagesFormGenerico{

  RetornoImagesFormGenerico(){
    novasImagesRetornadas = novasImagesRetornadas ?? [];
  }

  List<dynamic> novasImagesRetornadas;

  @override
  String toString() {
    return 'RetornoImagesFormGenerico{novasImagesRetornadas: $novasImagesRetornadas}';
  }

}