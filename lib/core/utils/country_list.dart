
import 'package:goldinia_app/core/models/country_model.dart';
import 'package:goldinia_app/core/utils/assets.dart';

abstract class CountryList {
  static  List<CountryModel> countries =[
  CountryModel('United Arab Emirates (UAE)', 'Dirham', 'AED', Assets.aeFlag),
  CountryModel('Bahrain', 'Bahraini Dinar', 'BHD', Assets.bhFlag),
  CountryModel('Algeria', 'Algerian Dinar', 'DZD', Assets.dzFlag),
  CountryModel('Egypt', 'Egyptian Pound', 'EGP', Assets.egFlag),
  CountryModel('Iraq', 'Iraqi Dinar', 'IQD', Assets.iqFlag),
  CountryModel('Jordan', 'Jordanian Dinar', 'JOD', Assets.joFlag),
  CountryModel('Kuwait', 'Kuwaiti Dinar', 'KWD', Assets.kwFlag),
  CountryModel('Lebanon', 'Lebanese Pound', 'LBP', Assets.lbFlag),
  CountryModel('Morocco', 'Moroccan Dirham', 'MAD', Assets.maFlag),
  CountryModel('Oman', 'Omani Rial', 'OMR', Assets.omFlag),
  CountryModel('Palestine', 'Israeli New Shekel', 'ILS', Assets.psFlag),
  CountryModel('Qatar', 'Qatari Riyal', 'QAR', Assets.qaFlag),
  CountryModel('Saudi Arabia', 'Saudi Riyal', 'SAR', Assets.saFlag),
  CountryModel('United States of America (USA)', 'United States Dollar', 'USD', Assets.usFlag),
  CountryModel('Yemen', 'Yemeni Rial', 'YER', Assets.yeFlag),
  ];
}