import 'dart:math';
import 'package:flutter/material.dart';
import 'package:your_plan_fitness/liquid_swipe.dart';

class QuestionnairePage extends StatefulWidget {
  static final style = TextStyle(
    fontSize: 20,
    fontFamily: "Billy",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    "Awesome. Now that your account is created, let's start building YourPlan.",
                    style: QuestionnairePage.style,
                  ),
                  Text(
                    "What is your main fitness goal?",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "(choose one)",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: RaisedButton(
                              onPressed: () {},
                              child: Text(
                                "Gain Muscle Mass",
                                style: TextStyle(fontSize: 30),
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: RaisedButton(
                              onPressed: () {},
                              child: Text(
                                "Burn Fat",
                                style: TextStyle(fontSize: 30),
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: RaisedButton(
                              onPressed: () {},
                              child: Text(
                                "Balanced",
                                style: TextStyle(fontSize: 30),
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: RaisedButton(
                              onPressed: () {},
                              child: Text(
                                "Improve Cardio",
                                style: TextStyle(fontSize: 30),
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: RaisedButton(
                              onPressed: () {},
                              child: Text(
                                "Improve Strength",
                                style: TextStyle(fontSize: 30),
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                            child: RaisedButton(
                              onPressed: () {},
                              child: Text(
                                "Flexibility",
                                style: TextStyle(fontSize: 30),
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 55,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
