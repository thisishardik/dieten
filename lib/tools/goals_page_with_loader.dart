import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hackathoncalorie/tools/constants.dart';
import 'package:flutter/rendering.dart';
import 'package:hackathoncalorie/height_and_weight/reusable_card.dart';
import 'package:hackathoncalorie/dashboard/dashboard.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GoalsPageWithLoader extends StatefulWidget {
  static String id = 'goals_page_with_loader';
  int counter = 1;

  @override
  _GoalsPageWithLoaderState createState() => _GoalsPageWithLoaderState();
}

class _GoalsPageWithLoaderState extends State<GoalsPageWithLoader> {
  int selectedPurpose = 0;
  int currentIntGoalWeightValue = 75;
  NumberPicker integerNumberGoalWeightPicker;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var duration = Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context,
        PageTransition(type: PageTransitionType.fade, child: Dashboard()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xFFe3fdfd),
                Color(0xFFcbf1f5),
                Color(0xFFa6e3e9),
                Color(0xFF71c9ce),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 45.0,
              ),
              Text(
                'Your Goals',
                style: TextStyle(
                  color: Color(0xFF12947f).withOpacity(0.5),
                  fontSize: 33.0,
                  fontFamily: 'Jost',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text(
                  'To help you achieve and help us understand your goals, we need this information.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF27ab30).withOpacity(0.5),
                    fontSize: 16.0,
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    top: 0.0,
                    left: 12.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Color(0xFF3d84a8).withOpacity(0.5),
                        elevation: 10.0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF3d84a8).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          width: 350.0,
                          height: 80.0,
                          child: MaterialButton(
                            padding: EdgeInsets.all(0.0),
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 20.0,
                                ),
                                Text("Desired Weight",
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 17.5)),
                                SizedBox(
                                  width: 120.0,
                                ),
                                Text(' $currentIntGoalWeightValue Kgs',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 17.5)),
                                SizedBox(width: 4.0),
                                Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white70.withOpacity(0.5),
                                  size: 16.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SpinKitDoubleBounce(
                    color: Colors.white,
                    size: 60.0,
                  ),
                  Positioned(
                    top: 113.0,
                    left: 45.0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
                      child: FlatButton(
                        padding: EdgeInsets.all(0.0),
                        child: Container(
                            height: 75.0,
                            width: 280.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xFF3d84a8).withOpacity(0.3),
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text('Achieve in 4 Weeks',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white.withOpacity(0.5))),
                                SizedBox(width: 50.0),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white70,
                                  size: 22.0,
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 205,
                    left: 45.0,
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                      child: FlatButton(
                        padding: EdgeInsets.all(0.0),
                        child: Container(
                            height: 75.0,
                            width: 280.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xFF3d84a8).withOpacity(0.3),
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text('Achieve in 8 Weeks',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white.withOpacity(0.5))),
                                SizedBox(width: 50.0),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white70,
                                  size: 22.0,
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 310,
                    left: 45.0,
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                      child: FlatButton(
                        padding: EdgeInsets.all(0.0),
                        child: Container(
                            height: 75.0,
                            width: 280.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xFF3d84a8).withOpacity(0.3),
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text('Achieve in 12 Weeks',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white.withOpacity(0.5))),
                                SizedBox(width: 35.0),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white70.withOpacity(0.5),
                                  size: 22.0,
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future showIntGoalWeightDialog() async {
    await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return NumberPickerDialog.integer(
          minValue: 30,
          maxValue: 150,
          step: 1,
          initialIntegerValue: currentIntGoalWeightValue,
        );
      },
    ).then((num value) {
      if (value != null) {
        setState(() => currentIntGoalWeightValue = value);
        integerNumberGoalWeightPicker.animateInt(value);
      }
    });
  }
}
