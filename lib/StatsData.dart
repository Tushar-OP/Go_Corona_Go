import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> Countries = [
  'Afghanistan',
  'Albania',
  'Algeria',
  'Angola',
  'Argentina',
  'Armenia',
  'Australia',
  'Austria',
  'Azerbaijan',
  'Bahamas',
  'Bangladesh',
  'Belarus',
  'Belgium',
  'Belize',
  'Benin',
  'Bhutan',
  'Bolivia',
  'Bosnia and Herzegovina',
  'Botswana',
  'Brazil',
  'Brunei Darussalam',
  'Bulgaria',
  'BurkinaFaso',
  'Burundi',
  'Cambodia',
  'Cameroon',
  'Canada',
  'Central African Republic',
  'Chad',
  'Chile',
  'China',
  'Colombia',
  'Congo',
  'CostaRica',
  'Croatia',
  'Cuba',
  'Cyprus',
  'Czechia',
  'Democratic Republic of Congo',
  'Denmark',
  'Diamond Princess',
  'Djibouti',
  'Dominican Republic',
  'DRCongo',
  'Ecuador',
  'Egypt',
  'ElSalvador',
  'Equatorial Guinea',
  'Eritrea',
  'Estonia',
  'Ethiopia',
  'Falkland Islands',
  'Fiji',
  'Finland',
  'France',
  'French Guiana',
  'French Southern Territories',
  'Gabon',
  'Gambia',
  'Georgia',
  'Germany',
  'Ghana',
  'Greece',
  'Greenland',
  'Guatemala',
  'Guinea',
  'Guinea-Bissau',
  'Guyana',
  'Haiti',
  'Honduras',
  'HongKong',
  'Hungary',
  'Iceland',
  'India',
  'Indonesia',
  'Iran',
  'Iraq',
  'Ireland',
  'Israel',
  'Italy',
  'IvoryCoast',
  'Jamaica',
  'Japan',
  'Jordan',
  'Kazakhstan',
  'Kenya',
  'Korea',
  'Kosovo',
  'Kuwait',
  'Kyrgyzstan',
  'Lao',
  'Latvia',
  'Lebanon',
  'Lesotho',
  'Liberia',
  'Libya',
  'Lithuania',
  'Luxembourg',
  'Macedonia',
  'Madagascar',
  'Malawi',
  'Malaysia',
  'Mali',
  'Mauritania',
  'Mexico',
  'Moldova',
  'Mongolia',
  'Montenegro',
  'Morocco',
  'Mozambique',
  'Myanmar',
  'Namibia',
  'Nepal',
  'Netherlands',
  'New Caledonia',
  'NewZealand',
  'Nicaragua',
  'Niger',
  'Nigeria',
  'NorthKorea',
  'Norway',
  'Oman',
  'Pakistan',
  'Palestine',
  'Panama',
  'Papua New Guinea',
  'Paraguay',
  'Peru',
  'Philippines',
  'Poland',
  'Portugal',
  'PuertoRico',
  'Qatar',
  'Republic of Kosovo',
  'Romania',
  'Russia',
  'Rwanda',
  'Saudi Arabia',
  'Senegal',
  'Serbia',
  'Sierra Leone',
  'Singapore',
  'Slovakia',
  'Slovenia',
  'Solomon Islands',
  'Somalia',
  'South Africa',
  'South Korea',
  'South Sudan',
  'Spain',
  'SriLanka',
  'Sudan',
  'Suriname',
  'Svalbard and JanMayen',
  'Swaziland',
  'Sweden',
  'Switzerland',
  'Syrian Arab Republic',
  'Taiwan',
  'Tajikistan',
  'Tanzania',
  'Thailand',
  'Timor-Leste',
  'Togo',
  'Trinidad and Tobago',
  'Tunisia',
  'Turkey',
  'Turkmenistan',
  'UAE',
  'Uganda',
  'Ukraine',
  'United Kingdom',
  'Uruguay',
  'USA',
  'Uzbekistan',
  'Vanuatu',
  'Venezuela',
  'Vietnam',
  'Western Sahara',
  'Yemen',
  'Zambia',
  'Zimbabwe',
];

const List<String> countryCode = [
  'AF',
  'AL',
  'DZ',
  'AO',
  'AR',
  'AM',
  'AU',
  'AT',
  'AZ',
  'BS',
  'BD',
  'BY',
  'BE',
  'BZ',
  'BJ',
  'BT',
  'BO',
  'BA',
  'BW',
  'BR',
  'BN',
  'BG',
  'BF',
  'BI',
  'KH',
  'CM',
  'CA',
  'CF',
  'TD',
  'CL',
  'CN',
  'CO',
  'CG',
  'CR',
  'HR',
  'CU',
  'CY',
  'CZ',
  'CD',
  'DK',
  'DP',
  'DJ',
  'DO',
  'CD',
  'EC',
  'EG',
  'SV',
  'GQ',
  'ER',
  'EE',
  'ET',
  'FK',
  'FJ',
  'FI',
  'FR',
  'GF',
  'TF',
  'GA',
  'GM',
  'GE',
  'DE',
  'GH',
  'GR',
  'GL',
  'GT',
  'GN',
  'GW',
  'GY',
  'HT',
  'HN',
  'HK',
  'HU',
  'IS',
  'IN',
  'ID',
  'IR',
  'IQ',
  'IE',
  'IL',
  'IT',
  'CI',
  'JM',
  'JP',
  'JO',
  'KZ',
  'KE',
  'KP',
  'XK',
  'KW',
  'KG',
  'LA',
  'LV',
  'LB',
  'LS',
  'LR',
  'LY',
  'LT',
  'LU',
  'MK',
  'MG',
  'MW',
  'MY',
  'ML',
  'MR',
  'MX',
  'MD',
  'MN',
  'ME',
  'MA',
  'MZ',
  'MM',
  'NA',
  'NP',
  'NL',
  'NC',
  'NZ',
  'NI',
  'NE',
  'NG',
  'KP',
  'NO',
  'OM',
  'PK',
  'PS',
  'PA',
  'PG',
  'PY',
  'PE',
  'PH',
  'PL',
  'PT',
  'PR',
  'QA',
  'XK',
  'RO',
  'RU',
  'RW',
  'SA',
  'SN',
  'RS',
  'SL',
  'SG',
  'SK',
  'SI',
  'SB',
  'SO',
  'ZA',
  'KR',
  'SS',
  'ES',
  'LK',
  'SD',
  'SR',
  'SJ',
  'SZ',
  'SE',
  'CH',
  'SY',
  'TW',
  'TJ',
  'TZ',
  'TH',
  'TL',
  'TG',
  'TT',
  'TN',
  'TR',
  'TM',
  'AE',
  'UG',
  'UA',
  'GB',
  'UY',
  'US',
  'UZ',
  'VU',
  'VE',
  'VN',
  'EH',
  'YE',
  'ZM',
  'ZW',
];

const coronaAPIUrl = 'https://api.thevirustracker.com/free-api';

class CoronaData {
  Future getCountryTotalData(String countryCode) async {
    String apiUrl = '$coronaAPIUrl?countryTotal=$countryCode';
    http.Response response = await http.get(apiUrl);

    Map<String, String> responseData = {};

    if (response.statusCode == 200) {
      String body = response.body;
      var decodedData = jsonDecode(body);
      responseData['Affected'] =
          decodedData['countrydata'][0]['total_cases'].toStringAsFixed(0);
      responseData['Recovered'] =
          decodedData['countrydata'][0]['total_recovered'].toStringAsFixed(0);
      responseData['Death'] =
          decodedData['countrydata'][0]['total_deaths'].toStringAsFixed(0);
      responseData['Serious'] = decodedData['countrydata'][0]
              ['total_serious_cases']
          .toStringAsFixed(0);
      responseData['Active'] = decodedData['countrydata'][0]
              ['total_active_cases']
          .toStringAsFixed(0);
    } else {
      print(response.statusCode);
    }

    return responseData;
  }

  Future getGlobalData() async {
    String apiUrl = '$coronaAPIUrl?global=stats';
    http.Response response = await http.get(apiUrl);

    Map<String, String> responseData = {};

    if (response.statusCode == 200) {
      String body = response.body;
      var decodedData = jsonDecode(body);
      responseData['Affected'] =
          decodedData['results'][0]['total_cases'].toStringAsFixed(0);
      responseData['Recovered'] =
          decodedData['results'][0]['total_recovered'].toStringAsFixed(0);
      responseData['Death'] =
          decodedData['results'][0]['total_deaths'].toStringAsFixed(0);
      responseData['Serious'] =
          decodedData['results'][0]['total_serious_cases'].toStringAsFixed(0);
      responseData['Active'] =
          decodedData['results'][0]['total_active_cases'].toStringAsFixed(0);
    } else {
      print(response.statusCode);
    }

    return responseData;
  }

  Future getCountryDayData(String countryCode, String day) async {
    String apiUrl = '$coronaAPIUrl?countryTimeline=$countryCode';
    http.Response response = await http.get(apiUrl);

    Map<String, String> responseData = {};

    if (response.statusCode == 200) {
      String body = response.body;
      var decodedData = jsonDecode(body);

      var item = decodedData['timelineitems'][0];

      var keyList = item.keys.toList();

      var len = keyList.length;

      if (day == 'Today') {
        responseData['new_affected'] =
            item[keyList[len - 2]]['new_daily_cases'].toString();
        responseData['new_death'] =
            item[keyList[len - 2]]['new_daily_death'].toString();
        responseData['Affected'] =
            item[keyList[len - 2]]['total_cases'].toString();
        responseData['Recovered'] =
            item[keyList[len - 2]]['total_recoveries'].toString();
        responseData['Death'] =
            item[keyList[len - 2]]['total_deaths'].toString();
      } else {
        responseData['new_affected'] =
            item[keyList[len - 3]]['new_daily_cases'].toString();
        responseData['new_death'] =
            item[keyList[len - 3]]['new_daily_death'].toString();
        responseData['Affected'] =
            item[keyList[len - 3]]['total_cases'].toString();
        responseData['Recovered'] =
            item[keyList[len - 3]]['total_recoveries'].toString();
        responseData['Death'] =
            item[keyList[len - 3]]['total_deaths'].toString();
      }
    } else {
      print(response.statusCode);
    }
    return responseData;
  }
}
