
import 'package:goldinia_app/core/models/country_model.dart';
import 'package:goldinia_app/core/utils/assets.dart';

abstract class CountryList {
  static  List<CountryModel> countries =[
    //https://united-arab-emirates.gold-price-today.com/
    //https://egypt.gold-price-today.com/
CountryModel('united-arab-emirates', 'United Arab Emirates (UAE)', 'Dirham', 'AED', Assets.aeFlag),
CountryModel('bahrain', 'Bahrain', 'Bahraini Dinar', 'BHD', Assets.bhFlag),
CountryModel('algeria', 'Algeria', 'Algerian Dinar', 'DZD', Assets.dzFlag),
CountryModel('egypt', 'Egypt', 'Egyptian Pound', 'EGP', Assets.egFlag),
CountryModel('iraq', 'Iraq', 'Iraqi Dinar', 'IQD', Assets.iqFlag),
CountryModel('jordan', 'Jordan', 'Jordanian Dinar', 'JOD', Assets.joFlag),
CountryModel('kuwait', 'Kuwait', 'Kuwaiti Dinar', 'KWD', Assets.kwFlag),
CountryModel('lebanon', 'Lebanon', 'Lebanese Pound', 'LBP', Assets.lbFlag),
CountryModel('morocco', 'Morocco', 'Moroccan Dirham', 'MAD', Assets.maFlag),
CountryModel('oman', 'Oman', 'Omani Rial', 'OMR', Assets.omFlag),
CountryModel('palestine', 'Palestine', 'Israeli New Shekel', 'ILS', Assets.psFlag),
CountryModel('qatar', 'Qatar', 'Qatari Riyal', 'QAR', Assets.qaFlag),
CountryModel('saudi-arabia', 'Saudi Arabia', 'Saudi Riyal', 'SAR', Assets.saFlag),
//CountryModel('united-states', 'United States of America (USA)', 'United States Dollar', 'USD', Assets.usFlag),
CountryModel('yemen', 'Yemen', 'Yemeni Rial', 'YER', Assets.yeFlag)
  ];
}