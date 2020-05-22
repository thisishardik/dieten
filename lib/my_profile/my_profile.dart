import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hackathoncalorie/calorie_tracker/calorie_tracker.dart';
import 'package:hackathoncalorie/dashboard/dashboard.dart';
import 'package:hackathoncalorie/dashboard/line_chart.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:hackathoncalorie/dashboard/radial_progress_consumed.dart';
import 'package:hackathoncalorie/dashboard/radial_progress_steps.dart';
import 'package:hackathoncalorie/dashboard/radial_progress_burnt.dart';
import 'package:hackathoncalorie/dashboard/water_level_indicator.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:hackathoncalorie/fit_at_home/fit_at_home.dart';
import 'package:hackathoncalorie/login_screen/login_screen.dart';
import 'package:hackathoncalorie/meal_planner/meal_planner.dart';
import 'package:hackathoncalorie/my_profile/my_profile.dart';
import 'package:hackathoncalorie/splash_screen/splash_screen.dart';
import 'package:hackathoncalorie/tools/calculator_brain.dart';
import 'package:hackathoncalorie/workouts/workouts_intro.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/foundation.dart';
import 'package:flippo_navigation/flippo_navigation.dart';
import 'package:hackathoncalorie/tools/constants.dart';

class MyProfile extends StatefulWidget {
  static String id = 'my_profile';

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  int _selectedIndex = 3;

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Do you really want to exit Dieten?"),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () =>
                      Navigator.popAndPushNamed(context, Dashboard.id),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          drawer: Drawer(
            elevation: 20.0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          const Color(0xff23b6e6).withOpacity(0.7),
                          const Color(0xff02d39a).withOpacity(0.5),
                        ])),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Dieten',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Plan It. Achieve It.',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Text(
                      "Home",
                      style: TextStyle(
                          color: Color(0xFF12947f),
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.home,
                      color: Color(0xff23b6e6),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: Dashboard(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: Text(
                      "Calorie Tracker",
                      style: TextStyle(
                          color: Color(0xFF12947f),
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.fastfood,
                      color: Colors.purple,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: CalorieTracker(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: Text(
                      "Meal Planner",
                      style: TextStyle(
                          color: Color(0xFF12947f),
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.local_dining,
                      color: Colors.pinkAccent,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: MealPlanner(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: Text(
                      "Fit@Home",
                      style: TextStyle(
                          color: Color(0xFF12947f),
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.fitness_center,
                      color: Color(0xFFffd31d),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: FitAtHome(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: Text(
                      "Profile",
                      style: TextStyle(
                          color: Color(0xFF12947f),
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.account_circle,
                      color: Colors.green,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(
                    width: 60.0,
                    height: 50,
                    child: Divider(
                      height: 30.0,
                      thickness: 1.2,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(height: 15.0),
                      MaterialButton(
                        padding: EdgeInsets.all(0.0),
                        splashColor: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: SplashScreen(),
                              ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    const Color(0xff23b6e6),
                                    const Color(0xff02d39a),
                                  ])),
                          width: 100.0,
                          height: 40.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                'Logout',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: Text(
                            'Version: 1.0.0',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.white,
          bottomNavigationBar: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
              ]),
              child: SafeArea(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                    gap: 5,
                    activeColor: Colors.white,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    duration: Duration(milliseconds: 800),
                    tabBackgroundColor: Colors.grey[800],
                    tabs: [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                        backgroundColor: Colors.pink,
                      ),
                      GButton(
                        icon: Icons.local_dining,
                        text: 'Tracking',
                        backgroundColor: Color(0xFFffd31d),
                      ),
                      GButton(
                        icon: Icons.fitness_center,
                        text: 'Fitness',
                        backgroundColor: Colors.blue,
                      ),
                      GButton(
                        icon: Icons.person,
                        text: 'Profile',
                        backgroundColor: Colors.green,
                      ),
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                        if (index == 0) {
                          Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: Dashboard(),
                              ));
                        }
                        if (index == 1) {
                          Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: CalorieTracker(),
                              ));
                        }
                        if (index == 2) {
                          Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: FitAtHome(),
                              ));
                        }
                        if (index == 3) {
                          Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: MyProfile(),
                              ));
                        }
                      });
                    }),
              ))),
          body: Stack(
            children: <Widget>[
              Container(
                height: 250,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [startColor, endColor])),
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Text(
                          'Dieten User Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Jost',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: ListView(
                  children: <Widget>[
                    new CardHolder(),
                    SizedBox(
                      height: 200,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardHolder extends StatelessWidget {
  const CardHolder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 135, right: 20, left: 20),
      height: 600,
      width: 350,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: titleColor.withOpacity(.1),
                blurRadius: 20,
                spreadRadius: 10),
          ]),
      child: InfoCard(),
    );
  }
}

class InfoCard extends StatelessWidget {
  final int id = 1025201;
  final int age = 20;
  final double height = 5.08;
  final int weight = 75;
  final String gender = 'Male';
  final String email = 'utkarsh78@gmail.com';

  InfoCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CalculatorBrain calculatorBrain =
        CalculatorBrain(height: height, weight: weight);
    String bmi = calculatorBrain.calculateBMI();
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/app-logo.png'),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                  color: Colors.blueAccent.withOpacity(.2), width: 1)),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Utkarsh Shukla',
          style: TextStyle(
            color: titleColor,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Dieten id: $id',
              style: TextStyle(color: textColor, fontSize: 15),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.only(left: 20, right: 20, top: 8),
          width: 320,
          height: 280,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 30,
                    spreadRadius: 5)
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Age',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '$age',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Gender',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '$gender',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Email',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '$email',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Weight',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '$weight',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Height',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '$height',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Body Mass Index',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '$bmi',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
