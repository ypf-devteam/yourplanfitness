import 'dart:math';
import 'package:flutter/material.dart';
import 'package:your_plan_fitness/liquid_swipe.dart';

class QuestionnairePage extends StatefulWidget {
  static final style = TextStyle(
    fontSize: 30,
    fontFamily: "Billy",
    fontWeight: FontWeight.w600,
  );

  @override
  _QuestionnairePageState createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  //pat gay

  final pages = [
    SizedBox.expand(
      child: Container(
        color: Colors.pink,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            Column(
              children: <Widget>[
                Text(
                  "Welcome",
                  style: QuestionnairePage.style,
                ),
                Text(
                  "To",
                  style: QuestionnairePage.style,
                ),
                Text(
                  "Your Plan Fitness",
                  style: QuestionnairePage.style,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    SizedBox.expand(
      child: Container(
        color: Colors.deepPurpleAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            Column(
              children: <Widget>[
                Text(
                  "Question 1:",
                  style: QuestionnairePage.style,
                ),
                Text(
                  "Does Patrick get bitches?",
                  style: QuestionnairePage.style,
                ),
                Text(
                  "(hint: it's yes)",
                  style: QuestionnairePage.style,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    SizedBox.expand(
      child: Container(
        color: Colors.greenAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            Column(
              children: <Widget>[
                Text(
                  "Question 2:",
                  style: QuestionnairePage.style,
                ),
                Text(
                  "____",
                  style: QuestionnairePage.style,
                ),
                Text(
                  "____",
                  style: QuestionnairePage.style,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    SizedBox.expand(
      child: Container(
        color: Colors.yellowAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            Column(
              children: <Widget>[
                Text(
                  "Question 3: ",
                  style: QuestionnairePage.style,
                ),
                Text(
                  "_____",
                  style: QuestionnairePage.style,
                ),
                Text(
                  "______",
                  style: QuestionnairePage.style,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    SizedBox.expand(
      child: Container(
        color: Colors.redAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            Column(
              children: <Widget>[
                Text(
                  "Question 4: ",
                  style: QuestionnairePage.style,
                ),
                Text(
                  "______",
                  style: QuestionnairePage.style,
                ),
                Text(
                  "_______",
                  style: QuestionnairePage.style,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ];

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            LiquidSwipe(
              pages: pages,
              onPageChangeCallback: pageChangeCallback,
              waveType: WaveType.liquidReveal,
              liquidController: liquidController,
              ignoreUserGestureWhileAnimating: true,
              enableLoop: false,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(pages.length, _buildDot),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
