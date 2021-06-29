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
        color: Colors.grey[50],
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
                  Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Text(
                        "Awesome. Now that your account is created, let's start building YourPlan.",
                        textAlign: TextAlign.center,
                        style: QuestionnairePage.style,
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Text(
                        "What is your main fitness goal?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      )),
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
                                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                child: Row(children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      height: double.infinity,
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
                                  Container(
                                    height: double.infinity,
                                    width: 60,
                                    child: RaisedButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.all(0.0),
                                      child: Image.asset(
                                        'assets/images/info_icon.png',
                                        width: 35.0,
                                        height: 35.0,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ]))),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                child: Row(children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      height: double.infinity,
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
                                  Container(
                                    height: double.infinity,
                                    width: 60,
                                    child: RaisedButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.all(0.0),
                                      child: Image.asset(
                                        'assets/images/info_icon.png',
                                        width: 35.0,
                                        height: 35.0,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ]))),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                child: Row(children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      height: double.infinity,
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
                                  Container(
                                    height: double.infinity,
                                    width: 60,
                                    child: RaisedButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.all(0.0),
                                      child: Image.asset(
                                        'assets/images/info_icon.png',
                                        width: 35.0,
                                        height: 35.0,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ]))),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                child: Row(children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      height: double.infinity,
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
                                  Container(
                                    height: double.infinity,
                                    width: 60,
                                    child: RaisedButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.all(0.0),
                                      child: Image.asset(
                                        'assets/images/info_icon.png',
                                        width: 35.0,
                                        height: 35.0,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ]))),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                child: Row(children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      height: double.infinity,
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
                                  Container(
                                    height: double.infinity,
                                    width: 60,
                                    child: RaisedButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.all(0.0),
                                      child: Image.asset(
                                        'assets/images/info_icon.png',
                                        width: 35.0,
                                        height: 35.0,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ]))),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                child: Row(children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      height: double.infinity,
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
                                  Container(
                                    height: double.infinity,
                                    width: 60,
                                    child: RaisedButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.all(0.0),
                                      child: Image.asset(
                                        'assets/images/info_icon.png',
                                        width: 35.0,
                                        height: 35.0,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ]))),
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
        color: Colors.grey[50],
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
        color: Colors.grey[50],
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
        color: Colors.grey[50],
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
        color: Colors.grey[50],
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
          color: Color(0xFF00BFFF),
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

const String _heroAddTodo = 'add-todo-hero';

class _AddTodoPopupCard extends StatelessWidget {
  /// {@macro add_todo_popup_card}
  const _AddTodoPopupCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return Tween(begin: begin, end: end);
          },
          child: Material(
            color: Color(0xFFef8354),
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'New todo',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Write a note',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                      maxLines: 6,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
