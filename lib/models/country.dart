class Country{
  static const String _basePath = "assets/flags/";

  static List<CountryData> listcountry = [
    new CountryData(countryName: "Thailand",fullCurrency:"Thai Baht",shortCurrency: "THB",svgAssets: _basePath+"238-thailand.svg"),
    new CountryData(countryName: "Mauritius",fullCurrency: "Mauritian rupee",shortCurrency: "MUR",svgAssets: _basePath+"001-mauritius.svg"),
    new CountryData(countryName:"Oman", fullCurrency:"Omani Rial", shortCurrency:"OMR",svgAssets: _basePath+"004-oman.svg"),
    new CountryData(countryName:"Ethiopia", fullCurrency:"Ethiopian Birr",shortCurrency: "ETB",svgAssets: _basePath+"005-ethiopia.svg"),
    new CountryData(countryName:"Tanzania", fullCurrency:"Tanzanian Shilling",shortCurrency: "TZS",svgAssets: _basePath+"006-Tanzania.svg"),
    new CountryData(countryName:"Nicaragua",fullCurrency: "Nicaraguan cordoba",shortCurrency:"NIO",svgAssets: _basePath+"007-nicaragua.svg"),
    new CountryData(countryName:"Uganda", fullCurrency:"Ugandan shilling",shortCurrency:"UGX",svgAssets: _basePath+"009-uganda.svg"),
    new CountryData(countryName:"Sao Tome and Principe",fullCurrency: "Sao Tome and Principe dobra",shortCurrency:"STN",svgAssets: _basePath+"012-sao-tome-and-prince.svg"),
    new CountryData(countryName:"Nepal",fullCurrency: "Nepalese rupee",shortCurrency:"NPR",svgAssets: _basePath+"016-nepal.svg"),
    new CountryData(countryName:"Australia",fullCurrency: "Australian dollar",shortCurrency:"AUD",svgAssets: _basePath+"017-christmas-island.svg"),
    new CountryData(countryName:"Japan",fullCurrency: "Japanese yen",shortCurrency:"JPY",svgAssets: _basePath+"063-japan.svg"),
    new CountryData(countryName: "United States",fullCurrency:"United States dollar",shortCurrency: "USD",svgAssets: _basePath+"226-united-states.svg"),
    new CountryData(countryName: "European Union",fullCurrency:"European euro",shortCurrency: "EUR",svgAssets: _basePath+"259-european-union.svg"),
    new CountryData(countryName: "United Kingdom",fullCurrency:"Pound sterling",shortCurrency: "GBP",svgAssets: _basePath+"260-united-kingdom.svg"),
    new CountryData(countryName: "Singapore",fullCurrency:"Singapore dollar",shortCurrency: "SGD",svgAssets: _basePath+"230-singapore.svg"),
    new CountryData(countryName: "Hong Kong",fullCurrency:"Hong Kong dollar",shortCurrency: "HKD",svgAssets: _basePath+"183-hong-kong.svg"),
    new CountryData(countryName: "Malaysia",fullCurrency:"Malaysian ringgit",shortCurrency: "MYR",svgAssets: _basePath+"118-malasya.svg"),
    new CountryData(countryName: "China",fullCurrency:"Chinese Yuan Renminbi",shortCurrency: "CNY",svgAssets: _basePath+"034-china.svg"),
    new CountryData(countryName: "India",fullCurrency:"Indian rupee",shortCurrency: "INR",svgAssets: _basePath+"246-india.svg"),
    new CountryData(countryName: "South Korea",fullCurrency:"South Korean won",shortCurrency: "KRW",svgAssets: _basePath+"094-south-korea.svg"),
    new CountryData(countryName: "Taiwan",fullCurrency:"New Taiwan dollar",shortCurrency: "TWD",svgAssets: _basePath+"202-taiwan.svg"),
    new CountryData(countryName: "Philippines",fullCurrency:"Philippine peso",shortCurrency: "PHP",svgAssets: _basePath+"192-philippines.svg"),
    new CountryData(countryName: "United Arab Emirates",fullCurrency:"UAE dirham",shortCurrency: "AED",svgAssets: _basePath+"151-united-arab-emirates.svg"),
    new CountryData(countryName: "Switzerland",fullCurrency:"Swiss franc",shortCurrency: "CHF",svgAssets: _basePath+"205-switzerland.svg"),
    new CountryData(countryName: "Sweden",fullCurrency:"Swedish krona",shortCurrency: "SEK",svgAssets: _basePath+"184-sweden.svg"),
    new CountryData(countryName: "Denmark",fullCurrency:"Danish krone",shortCurrency: "DKK",svgAssets: _basePath+"174-denmark.svg"),
    new CountryData(countryName:"Norway",fullCurrency: "Norwegian krone",shortCurrency:"NOK",svgAssets: _basePath+"143-norway.svg"),
    new CountryData(countryName:"Canada",fullCurrency: "Canadian dollar",shortCurrency:"CAD",svgAssets: _basePath+"243-canada.svg"),
    new CountryData(countryName:"New Zealand",fullCurrency: "New Zealand dollar",shortCurrency:"NZD",svgAssets: _basePath+"121-new-zealand.svg"),
    new CountryData(countryName:"Russia",fullCurrency: "Russian ruble",shortCurrency:"RUB",svgAssets: _basePath+"248-russia.svg"),
    new CountryData(countryName:"Vietnam",fullCurrency: "Vietnamese dong",shortCurrency:"VND",svgAssets: _basePath+"220-vietnam.svg"),
    new CountryData(countryName:"Laos",fullCurrency: "Lao kip",shortCurrency:"LAK",svgAssets: _basePath+"112-laos.svg"),
    new CountryData(countryName:"Indonesia",fullCurrency: "Indonesian rupiah",shortCurrency:"IDR",svgAssets: _basePath+"209-indonesia.svg"),
    new CountryData(countryName:"Saudi Arabia",fullCurrency: "Saudi Arabian riyal",shortCurrency:"SAR",svgAssets: _basePath+"133-saudi-arabia.svg"),
    new CountryData(countryName:"Qatar",fullCurrency: "Qatari riyal",shortCurrency:"QAR",svgAssets: _basePath+"026-qatar.svg"),
    new CountryData(countryName:"Bahrain",fullCurrency: "Bahraini dinar",shortCurrency:"BHD",svgAssets: _basePath+"138-bahrain.svg"),
    new CountryData(countryName:"South Africa",fullCurrency: "South African rand",shortCurrency:"ZAR",svgAssets: _basePath+"200-south-africa.svg"),
    new CountryData(countryName:"Myanmar",fullCurrency: "Myanmar kyat",shortCurrency:"MMK",svgAssets: _basePath+"058-myanmar.svg"),
    new CountryData(countryName:"Pakistan",fullCurrency: "Pakistani rupee",shortCurrency:"PKR",svgAssets: _basePath+"100-pakistan.svg"),
    ///new CountryData("Thailand", "Thai Baht", "THB", _basePath+"238-thailand.svg"),
  ];

  static String getSVGfromshortCurrency(String shortCurrency){
    String result;
    listcountry.forEach((f){
      if(f.shortCurrency == shortCurrency){
        result = f.svgAssets;
      }
    });
    return result;
  }

  static String getFullCurrencyfromshortCurrency(String shortCurrency){
    String result;
    listcountry.forEach((f){
      if(f.shortCurrency == shortCurrency){
        result = f.fullCurrency;
      }
    });
    return result;
  }

    static String getFullNamefromshortCurrency(String shortCurrency){
    String result;
    listcountry.forEach((f){
      if(f.shortCurrency == shortCurrency){
        result = f.fullCurrency;
      }
    });
    return result;
  }
}

class CountryData{
 final String shortCurrency;
 final String svgAssets;
 final String countryName;
 final String fullCurrency;
  
  const CountryData({
    this.shortCurrency,
    this.countryName,
    this.svgAssets,
    this.fullCurrency
  });
}