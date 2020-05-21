import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class RadialProgressMilesFitAtHome extends StatefulWidget {
  double walkedMiles;
  double targetMiles;
  RadialProgressMilesFitAtHome({
    @required this.targetMiles,
    @required this.walkedMiles,
  });

  @override
  _RadialProgressMilesFitAtHomeState createState() =>
      _RadialProgressMilesFitAtHomeState();
}

class _RadialProgressMilesFitAtHomeState
    extends State<RadialProgressMilesFitAtHome>
    with SingleTickerProviderStateMixin {
  AnimationController _radialProgressAnimationController;
  Animation<double> _progressAnimation;
  final Duration fadeInDuration = Duration(milliseconds: 500);
  final Duration fillDuration = Duration(seconds: 2);
  double progressDegrees = 0;

  @override
  void initState() {
    super.initState();
    _radialProgressAnimationController =
        AnimationController(vsync: this, duration: fillDuration);
    _progressAnimation = Tween(begin: 0.0, end: 360.0).animate(CurvedAnimation(
        parent: _radialProgressAnimationController, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {
          progressDegrees = (widget.walkedMiles / widget.targetMiles) *
              _progressAnimation.value;
        });
      });

    _radialProgressAnimationController.forward();
  }

  @override
  void dispose() {
    _radialProgressAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: 100.0,
        width: 100.0,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: AnimatedOpacity(
          opacity: progressDegrees > 30 ? 1.0 : 0.0,
          duration: fadeInDuration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.walkedMiles.toInt().toString(),
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    '/',
                    style:
                        TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    widget.targetMiles.toInt().toString(),
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'MILES',
                    style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.blue,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'COVERED',
                    style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.blue,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      painter: RadialPainter(progressDegrees),
    );
  }
}

class RadialPainter extends CustomPainter {
  double progressInDegrees;

  RadialPainter(this.progressInDegrees);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 2, paint);

    Paint progressPaint = Paint()
      ..shader = LinearGradient(
              colors: [Colors.red, Colors.purple, Colors.purpleAccent])
          .createShader(Rect.fromCircle(center: center, radius: size.width / 2))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90),
        math.radians(progressInDegrees),
        false,
        progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
