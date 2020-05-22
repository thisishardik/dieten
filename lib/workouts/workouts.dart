import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:hackathoncalorie/calorie_tracker/calorie_tracker.dart';
import 'package:hackathoncalorie/dashboard/dashboard.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:hackathoncalorie/fit_at_home/fit_at_home.dart';
import 'package:hackathoncalorie/meal_planner/meal_planner.dart';
import 'package:hackathoncalorie/my_profile/my_profile.dart';
import 'package:hackathoncalorie/splash_screen/splash_screen.dart';
import 'package:hackathoncalorie/workouts/grid_workouts_tile.dart';
import 'package:hackathoncalorie/workouts/shoulder_workouts.dart';
import 'package:hackathoncalorie/workouts/upper_body_workouts.dart';
import 'package:hackathoncalorie/workouts/workouts_intro.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'lower_body_workouts.dart';

class Workouts extends StatefulWidget {
  static String id = 'workouts';

  @override
  _WorkoutsState createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {
  int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Tracker',
      style: optionStyle,
    ),
    Text(
      'Index 2: Fitness',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent) {
    Navigator.pop(context); // Do some stuff.
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: MyProfile(),
                        ));
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
        appBar: AppBar(
          primary: true,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black87),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.sort,
              color: Colors.black,
              size: 25.5,
            ),
          ),
          title: Text(
            'Dieten',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(90.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 18,
                    ),
                    Text(
                      'Workouts/Exercises',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 13.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MaterialButton(
                      padding: EdgeInsets.all(0.0),
                      splashColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: FitAtHome(),
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xff23b6e6),
                                  const Color(0xff02d39a),
                                ])),
                        width: 150.0,
                        height: 40.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Fitness',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MaterialButton(
                      padding: EdgeInsets.all(0.0),
                      splashColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: Workouts(),
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xff23b6e6),
                                  const Color(0xff02d39a),
                                ])),
                        width: 150.0,
                        height: 40.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Workouts',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
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
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                  child: Container(
                    height: 2.5,
                    width: 250.0,
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(Radius.circular(4.0))),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                GridWorkoutsTile(
                  title: 'Upper-Body Workouts',
                  image: 'assets/images/pushups.jpg',
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: UpperBodyWorkouts(),
                        ));
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                GridWorkoutsTile(
                  title: 'Lower-Body Workouts',
                  image: 'assets/images/squats.jpg',
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: LowerBodyWorkouts(),
                        ));
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                GridWorkoutsTile(
                    title: 'Shoulder Workouts',
                    image: 'assets/images/pullups.jpg',
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: ShoulderWorkouts(),
                          ));
                    }),
                SizedBox(
                  height: 15.0,
                ),
                GridWorkoutsTile(
                  title: 'Back Workouts',
                  image: 'assets/images/back-workout.jpg',
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
