
String cityCodeUrl(String cityName) {
  return 'http://servicos.cptec.inpe.br/XML/listaCidades?city=$cityName';
}

String cityForecastsUrl(int cityCode) {
  return 'http://servicos.cptec.inpe.br/XML/cidade/7dias/$cityCode/previsao.xml';
}
