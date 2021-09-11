import 'dart:math';
import 'package:flutter/material.dart';
import 'package:your_plan_fitness/liquid_swipe.dart';
import 'package:your_plan_fitness/hero_dialog_route.dart';
import 'package:your_plan_fitness/custom_rect_tween.dart';
import 'package:your_plan_fitness/styles.dart';

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
  var result = List(5);
  var secondResult = List(7);

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
    result[0] = -1; //no buttons chosen yet (page1)
  }

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
              pages: [
                //first page
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
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                20, 5, 20, 5),
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  height: double.infinity,
                                                  child: Builder(
                                                      builder: (context) {
                                                    return RaisedButton(
                                                      color: result[0] == 0
                                                          ? Color(0xFF00BFFF)
                                                          : Colors.white,
                                                      onPressed: () => setState(
                                                          () => result[0] = 0),
                                                      child: Text(
                                                        "Gain Muscle Mass",
                                                        style: TextStyle(
                                                            fontSize: 30,
                                                            color: result[0] ==
                                                                    0
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              ),
                                              Container(
                                                height: double.infinity,
                                                width: 60,
                                                child:
                                                    Builder(builder: (context) {
                                                  return RaisedButton(
                                                    color: result[0] == 0
                                                        ? Color(0xFF00BFFF)
                                                        : Colors.white,
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .push(HeroDialogRoute(
                                                              builder:
                                                                  (context) {
                                                        return const _GainMuscleTodoPopupCard();
                                                      }));
                                                      Hero(
                                                        tag: _heroAddTodo,
                                                        createRectTween:
                                                            (begin, end) {
                                                          return CustomRectTween(
                                                              begin: begin,
                                                              end: end);
                                                        },
                                                        child: Material(
                                                          color: Colors.white,
                                                          elevation: 2,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          32)),
                                                        ),
                                                      );
                                                    },
                                                    padding:
                                                        EdgeInsets.all(0.0),
                                                    child: Image.asset(
                                                      'assets/images/info_icon.png',
                                                      color: result[0] == 0
                                                          ? Colors.white
                                                          : Colors.black,
                                                      width: 35.0,
                                                      height: 35.0,
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ]))),
                                    Expanded(
                                        child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                20, 5, 20, 5),
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  height: double.infinity,
                                                  child: RaisedButton(
                                                    color: result[0] == 1
                                                        ? Color(0xFF00BFFF)
                                                        : Colors.white,
                                                    onPressed: () => setState(
                                                        () => result[0] = 1),
                                                    child: Text(
                                                      "Burn Fat",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color: result[0] == 1
                                                              ? Colors.white
                                                              : Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: double.infinity,
                                                width: 60,
                                                child:
                                                    Builder(builder: (context) {
                                                  return RaisedButton(
                                                    color: result[0] == 1
                                                        ? Color(0xFF00BFFF)
                                                        : Colors.white,
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .push(HeroDialogRoute(
                                                              builder:
                                                                  (context) {
                                                        return const _BurnFatTodoPopupCard();
                                                      }));
                                                      Hero(
                                                        tag: _heroAddTodo,
                                                        createRectTween:
                                                            (begin, end) {
                                                          return CustomRectTween(
                                                              begin: begin,
                                                              end: end);
                                                        },
                                                        child: Material(
                                                          color: Colors.white,
                                                          elevation: 2,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          32)),
                                                        ),
                                                      );
                                                    },
                                                    padding:
                                                        EdgeInsets.all(0.0),
                                                    child: Image.asset(
                                                      'assets/images/info_icon.png',
                                                      color: result[0] == 1
                                                          ? Colors.white
                                                          : Colors.black,
                                                      width: 35.0,
                                                      height: 35.0,
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ]))),
                                    Expanded(
                                        child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                20, 5, 20, 5),
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  height: double.infinity,
                                                  child: RaisedButton(
                                                    color: result[0] == 2
                                                        ? Color(0xFF00BFFF)
                                                        : Colors.white,
                                                    onPressed: () => setState(
                                                        () => result[0] = 2),
                                                    child: Text(
                                                      "Balanced",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color: result[0] == 2
                                                              ? Colors.white
                                                              : Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: double.infinity,
                                                width: 60,
                                                child:
                                                    Builder(builder: (context) {
                                                  return RaisedButton(
                                                    color: result[0] == 2
                                                        ? Color(0xFF00BFFF)
                                                        : Colors.white,
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .push(HeroDialogRoute(
                                                              builder:
                                                                  (context) {
                                                        return const _BalancedTodoPopupCard();
                                                      }));
                                                      Hero(
                                                        tag: _heroAddTodo,
                                                        createRectTween:
                                                            (begin, end) {
                                                          return CustomRectTween(
                                                              begin: begin,
                                                              end: end);
                                                        },
                                                        child: Material(
                                                          color: Colors.white,
                                                          elevation: 2,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          32)),
                                                        ),
                                                      );
                                                    },
                                                    padding:
                                                        EdgeInsets.all(0.0),
                                                    child: Image.asset(
                                                      'assets/images/info_icon.png',
                                                      color: result[0] == 2
                                                          ? Colors.white
                                                          : Colors.black,
                                                      width: 35.0,
                                                      height: 35.0,
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ]))),
                                    Expanded(
                                        child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                20, 5, 20, 5),
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  height: double.infinity,
                                                  child: RaisedButton(
                                                    color: result[0] == 3
                                                        ? Color(0xFF00BFFF)
                                                        : Colors.white,
                                                    onPressed: () => setState(
                                                        () => result[0] = 3),
                                                    child: Text(
                                                      "Improve Cardio",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color: result[0] == 3
                                                              ? Colors.white
                                                              : Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: double.infinity,
                                                width: 60,
                                                child:
                                                    Builder(builder: (context) {
                                                  return RaisedButton(
                                                    color: result[0] == 3
                                                        ? Color(0xFF00BFFF)
                                                        : Colors.white,
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .push(HeroDialogRoute(
                                                              builder:
                                                                  (context) {
                                                        return const _ImproveCardioTodoPopupCard();
                                                      }));
                                                      Hero(
                                                        tag: _heroAddTodo,
                                                        createRectTween:
                                                            (begin, end) {
                                                          return CustomRectTween(
                                                              begin: begin,
                                                              end: end);
                                                        },
                                                        child: Material(
                                                          color: Colors.white,
                                                          elevation: 2,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          32)),
                                                        ),
                                                      );
                                                    },
                                                    padding:
                                                        EdgeInsets.all(0.0),
                                                    child: Image.asset(
                                                      'assets/images/info_icon.png',
                                                      color: result[0] == 3
                                                          ? Colors.white
                                                          : Colors.black,
                                                      width: 35.0,
                                                      height: 35.0,
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ]))),
                                    Expanded(
                                        child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                20, 5, 20, 5),
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  height: double.infinity,
                                                  child: RaisedButton(
                                                    color: result[0] == 4
                                                        ? Color(0xFF00BFFF)
                                                        : Colors.white,
                                                    onPressed: () => setState(
                                                        () => result[0] = 4),
                                                    child: Text(
                                                      "Improve Strength",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color: result[0] == 4
                                                              ? Colors.white
                                                              : Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: double.infinity,
                                                width: 60,
                                                child:
                                                    Builder(builder: (context) {
                                                  return RaisedButton(
                                                    color: result[0] == 4
                                                        ? Color(0xFF00BFFF)
                                                        : Colors.white,
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .push(HeroDialogRoute(
                                                              builder:
                                                                  (context) {
                                                        return const _ImproveStrengthTodoPopupCard();
                                                      }));
                                                      Hero(
                                                        tag: _heroAddTodo,
                                                        createRectTween:
                                                            (begin, end) {
                                                          return CustomRectTween(
                                                              begin: begin,
                                                              end: end);
                                                        },
                                                        child: Material(
                                                          color: Colors.white,
                                                          elevation: 2,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          32)),
                                                        ),
                                                      );
                                                    },
                                                    padding:
                                                        EdgeInsets.all(0.0),
                                                    child: Image.asset(
                                                      'assets/images/info_icon.png',
                                                      color: result[0] == 4
                                                          ? Colors.white
                                                          : Colors.black,
                                                      width: 35.0,
                                                      height: 35.0,
                                                    ),
                                                  );
                                                }),
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
                //PAGE NUMBER TWO HOLY SHMOK'
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
                                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                                  child: Text(
                                    "What equipment do you have?",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500),
                                  )),
                              Text(
                                "(Select all you have available to you)",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                20, 5, 20, 5),
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  height: double.infinity,
                                                  child: Builder(
                                                      builder: (context) {
                                                    return RaisedButton(
                                                      color: secondResult[0] ==
                                                              "Dumbbells"
                                                          ? Color(0xFF00BFFF)
                                                          : Colors.white,
                                                      onPressed: () => setState(
                                                          () => secondResult[
                                                                      0] ==
                                                                  "Dumbbells"
                                                              ? secondResult[
                                                                  0] = ""
                                                              : secondResult[
                                                                      0] =
                                                                  "Dumbbells"),
                                                      child: Text(
                                                        "Dumbbells",
                                                        style: TextStyle(
                                                            fontSize: 30,
                                                            color: secondResult[
                                                                        0] ==
                                                                    "Dumbbells"
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              ),
                                            ]))),
                                    Expanded(
                                        child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                20, 5, 20, 5),
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  height: double.infinity,
                                                  child: RaisedButton(
                                                    color: secondResult[1] ==
                                                            "Barbell"
                                                        ? Color(0xFF00BFFF)
                                                        : Colors.white,
                                                    onPressed: () => setState(
                                                        () => secondResult[1] ==
                                                                "Barbell"
                                                            ? secondResult[1] =
                                                                ""
                                                            : secondResult[1] =
                                                                "Barbell"),
                                                    child: Text(
                                                      "Barbell",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color:
                                                              secondResult[1] ==
                                                                      "Barbell"
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]))),
                                    Expanded(
                                        child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                20, 5, 20, 5),
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  height: double.infinity,
                                                  child: RaisedButton(
                                                    color: secondResult[2] ==
                                                            "Bench"
                                                        ? Color(0xFF00BFFF)
                                                        : Colors.white,
                                                    onPressed: () => setState(
                                                        () => secondResult[2] ==
                                                                "Bench"
                                                            ? secondResult[2] =
                                                                ""
                                                            : secondResult[2] =
                                                                "Bench"),
                                                    child: Text(
                                                      "Bench",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color:
                                                              secondResult[2] ==
                                                                      "Bench"
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]))),
                                    Expanded(
                                        child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                20, 5, 20, 5),
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  height: double.infinity,
                                                  child: RaisedButton(
                                                    color: secondResult[3] ==
                                                            "Squat Rack"
                                                        ? Color(0xFF00BFFF)
                                                        : Colors.white,
                                                    onPressed: () => setState(
                                                        () => secondResult[3] ==
                                                                "Squat Rack"
                                                            ? secondResult[3] =
                                                                ""
                                                            : secondResult[3] =
                                                                "Squat Rack"),
                                                    child: Text(
                                                      "Squat Rack",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color: secondResult[
                                                                      3] ==
                                                                  "Squat Rack"
                                                              ? Colors.white
                                                              : Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]))),
                                    Expanded(
                                        child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                20, 5, 20, 5),
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  height: double.infinity,
                                                  child: RaisedButton(
                                                    color: secondResult[4] ==
                                                            "Resistence Bands"
                                                        ? Color(0xFF00BFFF)
                                                        : Colors.white,
                                                    onPressed: () => setState(
                                                        () => secondResult[4] ==
                                                                "Resistence Bands"
                                                            ? secondResult[4] =
                                                                ""
                                                            : secondResult[4] =
                                                                "Resistence Bands"),
                                                    child: Text(
                                                      "Resistence Bands",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color: secondResult[
                                                                      4] ==
                                                                  "Resistence Bands"
                                                              ? Colors.white
                                                              : Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]))),
                                    Expanded(
                                        child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                20, 5, 20, 5),
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  height: double.infinity,
                                                  child: RaisedButton(
                                                    color: secondResult[5] ==
                                                            "Full Gym"
                                                        ? Color(0xFF00BFFF)
                                                        : Colors.white,
                                                    onPressed: () => setState(
                                                        () => secondResult[5] ==
                                                                "Full Gym"
                                                            ? secondResult[5] =
                                                                ""
                                                            : secondResult[5] =
                                                                "Full Gym"),
                                                    child: Text(
                                                      "Full Gym",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color:
                                                              secondResult[5] ==
                                                                      "Full Gym"
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]))),
                                    Expanded(
                                        child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                20, 5, 20, 5),
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  height: double.infinity,
                                                  child: RaisedButton(
                                                    color: secondResult[6] ==
                                                            "Somewhere to Run"
                                                        ? Color(0xFF00BFFF)
                                                        : Colors.white,
                                                    onPressed: () => setState(
                                                        () => secondResult[6] ==
                                                                "Somewhere to Run"
                                                            ? secondResult[6] =
                                                                ""
                                                            : secondResult[6] =
                                                                "Somewhere to Run"),
                                                    child: Text(
                                                      "Somewhere to Run",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color: secondResult[
                                                                      6] ==
                                                                  "Somewhere to Run"
                                                              ? Colors.white
                                                              : Colors.black),
                                                    ),
                                                  ),
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
                  //page 3
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
                  //page 4
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
                  //page 5
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
              ],
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
                    children: List<Widget>.generate(5, _buildDot),
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

/// Tag-value used for the add todo popup button.
const String _heroAddTodo = 'add-todo-hero';

/// {@template add_todo_popup_card}
/// Popup card to add a new [Todo]. Should be used in conjuction with
/// [HeroDialogRoute] to achieve the popup effect.
///
/// Uses a [Hero] with tag [_heroAddTodo].
/// {@endtemplate}
class _GainMuscleTodoPopupCard extends StatelessWidget {
  /// {@macro add_todo_popup_card}
  const _GainMuscleTodoPopupCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Gain Muscle Mass Info",
                      style: QuestionnairePage.style,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
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

class _BurnFatTodoPopupCard extends StatelessWidget {
  /// {@macro add_todo_popup_card}
  const _BurnFatTodoPopupCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Burn Fat Info",
                      style: QuestionnairePage.style,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
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

class _BalancedTodoPopupCard extends StatelessWidget {
  /// {@macro add_todo_popup_card}
  const _BalancedTodoPopupCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Balanced Info",
                      style: QuestionnairePage.style,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
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

class _ImproveCardioTodoPopupCard extends StatelessWidget {
  /// {@macro add_todo_popup_card}
  const _ImproveCardioTodoPopupCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Improve Cardio Info",
                      style: QuestionnairePage.style,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
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

class _FlexibilityTodoPopupCard extends StatelessWidget {
  /// {@macro add_todo_popup_card}
  const _FlexibilityTodoPopupCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Flexibility Info",
                      style: QuestionnairePage.style,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
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

class _ImproveStrengthTodoPopupCard extends StatelessWidget {
  /// {@macro add_todo_popup_card}
  const _ImproveStrengthTodoPopupCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Improve Strength Info",
                      style: QuestionnairePage.style,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
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
