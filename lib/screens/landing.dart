import 'package:flutter/material.dart';
import 'package:gocoronago/Components/CustomFlatButton.dart';
import 'package:gocoronago/Components/CustomImageWithTitle.dart';
import 'package:gocoronago/Components/CustomSymptomCard.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String _url = 'tel:+91-11-23978046';
  String _toLaunch = 'https://www.google.com/';

  Future<void> _makePhoneCall() async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  Future<void> _launchInBrowser() async {
    if (await canLaunch(_toLaunch)) {
      await launch(
        _toLaunch,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $_toLaunch';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.1,
            decoration: BoxDecoration(
              color: Color.fromRGBO(71, 63, 151, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Covid 19',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      letterSpacing: 0.6,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Are you feeling sick?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      letterSpacing: 0.6,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "If you feel sick with any of covid-19 symptoms please call or SMS for help immediately!\nIf in India, use call now else search for your country's helpline number",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      height: 1.8,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CustomFlatButton(
                        icon: Icons.phone,
                        text: 'Call Now',
                        buttonColor: Colors.red,
                        func: () {
                          setState(() {
                            _makePhoneCall();
                          });
                        },
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      CustomFlatButton(
                        icon: Icons.search,
                        text: 'Search Now',
                        buttonColor: Color.fromRGBO(76, 121, 255, 1),
                        func: () {
                          setState(() {
                            _launchInBrowser();
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Prevention',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.8,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomImageWithTitle(
                  imagePath: 'images/SocialDistancing.png',
                  titleText: 'Avoid Close\nContact'),
              CustomImageWithTitle(
                  imagePath: 'images/HandWash.png',
                  titleText: 'Clean your hands\noften'),
              CustomImageWithTitle(
                  imagePath: 'images/FaceMask.png',
                  titleText: 'Wear a\nfacemask'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Symptoms',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.8,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          CustomSymptomCard(
            imagePath: 'images/Cough.png',
            title: 'Cough',
            note:
                'A new, continuous cough – this means coughing a lot for more than an hour, or 3 or more coughing episodes in 24 hours ',
          ),
          CustomSymptomCard(
            imagePath: 'images/Fever.png',
            title: 'Fever',
            note:
                'A high temperature – this means you feel hot to touch on your chest or back ',
          ),
          CustomSymptomCard(
              imagePath: 'images/Headache.png',
              title: 'Headache',
              note:
                  'This is not a major symptom but it is seen in various cases that headache follows fever.')
        ],
      ),
    );
  }
}
