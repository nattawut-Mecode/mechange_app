class Exchanger{
  static const String _basePath = "assets/exchangers/";

  static List<ExchangerModel> listexchanger = [
    new ExchangerModel(sortName:"12vic",fullName:"Twelve Victory Exchange",svgAssets:_basePath+"ven_12vic.png"),
    new ExchangerModel(sortName:"bbl",fullName:"Bangkok Bank",svgAssets:_basePath+"ven_bbl.png"), 
    new ExchangerModel(sortName:"cb",fullName:"Co-operative Bank",svgAssets:_basePath+"ven_cb.png"),
    new ExchangerModel(sortName:"gsb", fullName:"Government Savings Bank",svgAssets: _basePath+"ven_gsb.png"),
    new ExchangerModel(sortName:"gsr",fullName: "GSR Markets", svgAssets:_basePath+"ven_gsr.png"),
    new ExchangerModel(sortName:"isbt",fullName: "International Society of Blood Transfusion",svgAssets: _basePath+"ven_isbt.png"),
    new ExchangerModel(sortName:"k79",fullName: "K79 Money Exchange",svgAssets: _basePath+"ven_k79.png"),
    new ExchangerModel(sortName: "ven_tg",fullName: "Thaniya Gold Money",svgAssets: _basePath+"ven_tg.png"),
    new ExchangerModel(sortName: "ven_srt",fullName: "Superrich thailand",svgAssets: _basePath+"ven_srt.png"),
    new ExchangerModel(sortName: "ven_gsr",fullName: "Grand Super Rich",svgAssets: _basePath+"ven_gsr.png"),
    new ExchangerModel(sortName: "ven_sr",fullName: "SuperRich Currency",svgAssets: _basePath+"ven_sr.png"),
    new ExchangerModel(sortName: "ven_ve",fullName: "Vasu",svgAssets: _basePath+"ven_ve.png"),
  ];

  static String getPngfromSortName(String sortExchanger){
    String result;
    listexchanger.forEach((f){
      if(f.sortName == sortExchanger){
        result = f.svgAssets;
      }
    });
    return result;
  }


  static String getFullNamefromSortName(String sortExchanger){
    String result;
    listexchanger.forEach((f){
      if(f.sortName == sortExchanger){
        result = f.fullName;
      }
    });
    return result;
  }

}

class ExchangerModel{
  final String sortName; 
  final fullName;
  final svgAssets;
  
  ExchangerModel({
    this.sortName,
    this.fullName,
    this.svgAssets
  });
}

class ExchangerJson{
  final int id;
  final String currency;
  final double buy;
  final double sell;
  final String datetime;
  final String exchanger;

  ExchangerJson({this.id,this.currency,this.buy,this.sell,this.datetime,this.exchanger});

  factory ExchangerJson.fromJson(Map<String,dynamic> json){
    return ExchangerJson(
      id: json['id'] as int,
      currency: json['currency'] as String,
      buy: json['buy'] as double,
      sell: json['sell'] as double,
      datetime: json['datetime'] as String,
      exchanger: json['exchanger'] as String
    );
  }
}