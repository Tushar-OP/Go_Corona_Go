import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gocoronago/StatsData.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  String selectedValue = 'IN';

  static List<bool> isSelected = [true, false];
  static List<bool> isDaySelected = [true, false, false];

  List<DropdownMenuItem<String>> items = [];

  void buildDropDownItems() {
    for (int i = 0; i < Countries.length; i++) {
      var newItem = DropdownMenuItem(
        child: Text(
          Countries[i],
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'OpenSans',
          ),
        ),
        value: countryCode[i],
      );
      items.add(newItem);
    }
  }

  //Gets the stats from StatsData.dart
  Map<String, String> coronaValues = {};

  var chartData = [];

  bool isWaiting = false;
  bool isGlobal = false;
  bool isTotal = true;

  void getGlobalResult() async {
    isWaiting = true;
    try {
      var data = await CoronaData().getGlobalData();
      isWaiting = false;
      setState(() {
        coronaValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  void getCountryTotalResult(String countryCode) async {
    isWaiting = true;
    try {
      var data = await CoronaData().getCountryTotalData(countryCode);
      isWaiting = false;
      setState(() {
        coronaValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  void getCountryDayResult(String countryCode, String day) async {
    isWaiting = true;
    try {
      var data = await CoronaData().getCountryDayData(countryCode, day);
      isWaiting = false;
      setState(() {
        coronaValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    buildDropDownItems();
    getCountryTotalResult(selectedValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      width: double.infinity,
//      height: double.infinity,
      color: Color.fromRGBO(71, 63, 151, 1),
      child: Padding(
        padding: EdgeInsets.only(top: 80, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Statistics',
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                letterSpacing: 0.6,
                fontFamily: 'OpenSans',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SearchableDropdown.single(
                items: items,
                iconSize: 28,
                displayClearIcon: true,
                iconDisabledColor: Colors.white,
                iconEnabledColor: Colors.white,
                value: selectedValue,
                hint: Text(
                  "Select Country",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
                searchHint: Text(
                  "Select your Country",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                    isSelected = [true, false];
                    isDaySelected = [true, false, false];
                    isGlobal = false;
                    getCountryTotalResult(value);
                  });
                },
                isExpanded: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Color.fromRGBO(108, 101, 172, 1),
              ),
              width: double.infinity,
              height: 60,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: ToggleButtons(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'OpenSans',
                      color: Colors.black,
                      fontSize: 6,
                    ),
                    selectedColor: Colors.black,
                    fillColor: Colors.white,
                    children: <Widget>[
                      Text('My country'),
                      Text('Global'),
                    ],
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < isSelected.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            isSelected[buttonIndex] = true;
                          } else {
                            isSelected[buttonIndex] = false;
                          }
                        }

                        if (index == 1) {
                          getGlobalResult();
                          isGlobal = true;
                          isTotal = true;
                        } else {
                          getCountryTotalResult(selectedValue);
                          isGlobal = false;
                          isTotal = true;
                          isDaySelected = [true, false, false];
                        }
                      });
                    },
                    isSelected: isSelected,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: isGlobal
                    ? Container(height: 50)
                    : ToggleButtons(
                        textStyle: TextStyle(
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                          fontSize: 15,
                          letterSpacing: 0.4,
                        ),
                        fillColor: Color.fromRGBO(71, 63, 151, 1),
                        selectedColor: Colors.white,
                        color: Color.fromRGBO(108, 101, 172, 1),
                        renderBorder: false,
                        disabledColor: Color.fromRGBO(108, 101, 172, 1),
                        children: <Widget>[
                          Text('Total'),
                          Text('Today'),
                          Text('Yesterday'),
                        ],
                        onPressed: (int index) {
                          setState(() {
                            for (int buttonIndex = 0;
                                buttonIndex < isDaySelected.length;
                                buttonIndex++) {
                              if (buttonIndex == index) {
                                isDaySelected[buttonIndex] = true;
                              } else {
                                isDaySelected[buttonIndex] = false;
                              }
                            }

                            if (index == 0) {
                              getCountryTotalResult(selectedValue);
                              isTotal = true;
                            } else if (index == 1) {
                              getCountryDayResult(selectedValue, 'Today');
                              isTotal = false;
                            } else {
                              getCountryDayResult(selectedValue, 'Yesterday');
                              isTotal = false;
                            }
                          });
                        },
                        isSelected: isDaySelected,
                      ),
              ),
            ),
            isTotal
                ? Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          StatCard(
                            title: 'Affected',
                            number: isWaiting
                                ? 'Loading..'
                                : coronaValues['Affected'],
                            color: Color.fromRGBO(255, 178, 89, 1),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          StatCard(
                            title: 'Death',
                            number:
                                isWaiting ? 'Loading..' : coronaValues['Death'],
                            color: Color.fromRGBO(255, 89, 89, 1),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          StatCard(
                            title: 'Recovered',
                            number: isWaiting
                                ? 'Loading..'
                                : coronaValues['Recovered'],
                            color: Color.fromRGBO(76, 217, 123, 1),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          StatCard(
                            title: 'Active',
                            number: isWaiting
                                ? 'Loading..'
                                : coronaValues['Active'],
                            color: Color.fromRGBO(76, 181, 255, 1),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          StatCard(
                            title: 'Serious',
                            number: isWaiting
                                ? 'Loading..'
                                : coronaValues['Serious'],
                            color: Color.fromRGBO(144, 89, 255, 1),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                : Column(
                    children: <Widget>[
                      Text(
                        'Note: Only new deaths and new cases are shown here',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'OpenSans'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          StatCard(
                            title: 'New Affected',
                            number: isWaiting
                                ? 'Loading..'
                                : coronaValues['new_affected'],
                            color: Color.fromRGBO(255, 178, 89, 1),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          StatCard(
                            title: 'New Death',
                            number: isWaiting
                                ? 'Loading..'
                                : coronaValues['new_death'],
                            color: Color.fromRGBO(255, 89, 89, 1),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          StatCard(
                            title: 'Total\nRecovered',
                            number: isWaiting
                                ? 'Loading..'
                                : coronaValues['Recovered'],
                            color: Color.fromRGBO(76, 217, 123, 1),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          StatCard(
                            title: 'Total\nAffected',
                            number: isWaiting
                                ? 'Loading..'
                                : coronaValues['Affected'],
                            color: Color.fromRGBO(76, 181, 255, 1),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          StatCard(
                            title: 'Total\nDeath',
                            number:
                                isWaiting ? 'Loading..' : coronaValues['Death'],
                            color: Color.fromRGBO(144, 89, 255, 1),
                          ),
                        ],
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  StatCard({@required this.title, @required this.number, @required this.color});

  final String title;
  final String number;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: color,
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                ),
              ),
              Text(
                number,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatsButton extends StatefulWidget {
  StatsButton({@required this.title});

  final String title;

  @override
  _StatsButtonState createState() => _StatsButtonState();
}

class _StatsButtonState extends State<StatsButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: FlatButton(
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'OpenSans',
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        color: isSelected ? Colors.white : Color.fromRGBO(108, 101, 172, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      height: 50,
      minWidth: 171,
    );
  }
}
