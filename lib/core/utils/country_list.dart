
import 'package:goldinia_app/core/models/country_model.dart';
import 'package:goldinia_app/core/utils/assets.dart';

abstract class CountryList {
static Map<String, CountryModel> countries = {
  'united-arab-emirates': CountryModel('united-arab-emirates', 'United Arab Emirates (UAE)', 'Dirham', 'AED', Assets.aeFlag),
  'bahrain': CountryModel('bahrain', 'Bahrain', 'Bahraini Dinar', 'BHD', Assets.bhFlag),
  'algeria': CountryModel('algeria', 'Algeria', 'Algerian Dinar', 'DZD', Assets.dzFlag),
  'egypt': CountryModel('egypt', 'Egypt', 'Egyptian Pound', 'EGP', Assets.egFlag),
  'iraq': CountryModel('iraq', 'Iraq', 'Iraqi Dinar', 'IQD', Assets.iqFlag),
  'jordan': CountryModel('jordan', 'Jordan', 'Jordanian Dinar', 'JOD', Assets.joFlag),
  'kuwait': CountryModel('kuwait', 'Kuwait', 'Kuwaiti Dinar', 'KWD', Assets.kwFlag),
  'lebanon': CountryModel('lebanon', 'Lebanon', 'Lebanese Pound', 'LBP', Assets.lbFlag),
  'morocco': CountryModel('morocco', 'Morocco', 'Moroccan Dirham', 'MAD', Assets.maFlag),
  'oman': CountryModel('oman', 'Oman', 'Omani Rial', 'OMR', Assets.omFlag),
  'palestine': CountryModel('palestine', 'Palestine', 'Israeli New Shekel', 'ILS', Assets.psFlag),
  'qatar': CountryModel('qatar', 'Qatar', 'Qatari Riyal', 'QAR', Assets.qaFlag),
  'saudi-arabia': CountryModel('saudi-arabia', 'Saudi Arabia', 'Saudi Riyal', 'SAR', Assets.saFlag),
  'yemen': CountryModel('yemen', 'Yemen', 'Yemeni Rial', 'YER', Assets.yeFlag),
};
}