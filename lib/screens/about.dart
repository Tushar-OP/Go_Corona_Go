import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  Future<void> _launchInBrowser(String _toLaunch) async {
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
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(33, 212, 253, 1),
              Color.fromRGBO(183, 33, 255, 1),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 80),
          child: Column(
            children: <Widget>[
              Text(
                'About',
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: 'OpenSans',
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Dev',
                style: TextStyle(
                  fontSize: 26,
                  fontFamily: 'OpenSans',
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.amberAccent,
                child: CircleAvatar(
                  radius: 63,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('images/tushar.jpg'),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Tushar Patil',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'OpenSans',
                  color: Colors.white,
                ),
              ),
              Text(
                'Mumbai',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'OpenSans',
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () =>
                        _launchInBrowser('https://github.com/Tushar-OP'),
                    child: SocialButton(
                      title: 'GitHub',
                      image: 'images/GitHub.png',
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        _launchInBrowser('https://twitter.com/Tushar_OP'),
                    child: SocialButton(
                      title: 'Twitter',
                      image: 'images/Twitter.png',
                      color: Color.fromRGBO(29, 161, 242, 1),
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Credits',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'OpenSans',
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'UI Design - @simantOo',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'OpenSans',
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Note from the Dev!',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'OpenSans',
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'In this age of such a pandemic disease outbreak we need to help each other. I know most of us are bored till death, but there are people who are working for us, people such as doctors, the police and much more, so to help them and ourself, lets stay at home! Try to do something in this time, I was also bored, so I made this app!',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'OpenSans',
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  SocialButton({
    @required this.title,
    @required this.image,
    @required this.color,
    @required this.textColor,
  });

  final String image;
  final String title;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5 - 20,
      child: Card(
        color: color,
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                image,
                width: 34,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 24,
                  color: textColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
