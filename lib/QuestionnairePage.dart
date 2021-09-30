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

  static final popupTitle = TextStyle(
    fontSize: 24,
    fontFamily: "Billy",
    fontWeight: FontWeight.bold,
  );

  static final popupSubLabel = TextStyle(
    fontSize: 22,
    fontFamily: "Billy",
    fontWeight: FontWeight.bold,
  );

  @override
  _QuestionnairePageState createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;
  var equipmentResults = Map();
  var results = Map();

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
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
                //second page
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
                                    "What is your experience with exercise/training?",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500),
                                  )),
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
                                                      color: results[
                                                                  'secondQuestion'] ==
                                                              "Beginner"
                                                          ? Color(0xFF00BFFF)
                                                          : Colors.white,
                                                      onPressed: () => setState(
                                                          () => results[
                                                                  'secondQuestion'] =
                                                              "Beginner"),
                                                      child: Text(
                                                        "Beginner",
                                                        style: TextStyle(
                                                            fontSize: 30,
                                                            color: results[
                                                                        'secondQuestion'] ==
                                                                    "Beginner"
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              ),
                                              // Container(
                                              //   height: double.infinity,
                                              //   width: 60,
                                              //   child:
                                              //       Builder(builder: (context) {
                                              //     return RaisedButton(
                                              //       color: result[0] == 0
                                              //           ? Color(0xFF00BFFF)
                                              //           : Colors.white,
                                              //       onPressed: () {
                                              //         Navigator.of(context)
                                              //             .push(HeroDialogRoute(
                                              //                 builder:
                                              //                     (context) {
                                              //           return const _GainMuscleTodoPopupCard();
                                              //         }));
                                              //         Hero(
                                              //           tag: _heroAddTodo,
                                              //           createRectTween:
                                              //               (begin, end) {
                                              //             return CustomRectTween(
                                              //                 begin: begin,
                                              //                 end: end);
                                              //           },
                                              //           child: Material(
                                              //             color: Colors.white,
                                              //             elevation: 2,
                                              //             shape: RoundedRectangleBorder(
                                              //                 borderRadius:
                                              //                     BorderRadius
                                              //                         .circular(
                                              //                             32)),
                                              //           ),
                                              //         );
                                              //       },
                                              //       padding:
                                              //           EdgeInsets.all(0.0),
                                              //       child: Image.asset(
                                              //         'assets/images/info_icon.png',
                                              //         color: result[0] == 0
                                              //             ? Colors.white
                                              //             : Colors.black,
                                              //         width: 35.0,
                                              //         height: 35.0,
                                              //       ),
                                              //     );
                                              //   }),
                                              // ),
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
                                                    color:
                                                        results['secondQuestion'] ==
                                                                "Intermediate"
                                                            ? Color(0xFF00BFFF)
                                                            : Colors.white,
                                                    onPressed: () => setState(
                                                        () => results[
                                                                'secondQuestion'] =
                                                            "Intermediate"),
                                                    child: Text(
                                                      "Intermediate",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color: results[
                                                                      'secondQuestion'] ==
                                                                  "Intermediate"
                                                              ? Colors.white
                                                              : Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // Container(
                                              //   height: double.infinity,
                                              //   width: 60,
                                              //   child:
                                              //       Builder(builder: (context) {
                                              //     return RaisedButton(
                                              //       color: result[0] == 1
                                              //           ? Color(0xFF00BFFF)
                                              //           : Colors.white,
                                              //       onPressed: () {
                                              //         Navigator.of(context)
                                              //             .push(HeroDialogRoute(
                                              //                 builder:
                                              //                     (context) {
                                              //           return const _BurnFatTodoPopupCard();
                                              //         }));
                                              //         Hero(
                                              //           tag: _heroAddTodo,
                                              //           createRectTween:
                                              //               (begin, end) {
                                              //             return CustomRectTween(
                                              //                 begin: begin,
                                              //                 end: end);
                                              //           },
                                              //           child: Material(
                                              //             color: Colors.white,
                                              //             elevation: 2,
                                              //             shape: RoundedRectangleBorder(
                                              //                 borderRadius:
                                              //                     BorderRadius
                                              //                         .circular(
                                              //                             32)),
                                              //           ),
                                              //         );
                                              //       },
                                              //       padding:
                                              //           EdgeInsets.all(0.0),
                                              //       child: Image.asset(
                                              //         'assets/images/info_icon.png',
                                              //         color: result[0] == 1
                                              //             ? Colors.white
                                              //             : Colors.black,
                                              //         width: 35.0,
                                              //         height: 35.0,
                                              //       ),
                                              //     );
                                              //   }),
                                              // ),
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
                                                    color:
                                                        results['secondQuestion'] ==
                                                                "Advanced"
                                                            ? Color(0xFF00BFFF)
                                                            : Colors.white,
                                                    onPressed: () => setState(
                                                        () => results[
                                                                'secondQuestion'] =
                                                            "Advanced"),
                                                    child: Text(
                                                      "Advanced",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color:
                                                              results['secondQuestion'] ==
                                                                      "Advanced"
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // Container(
                                              //   height: double.infinity,
                                              //   width: 60,
                                              //   child:
                                              //       Builder(builder: (context) {
                                              //     return RaisedButton(
                                              //       color: result[0] == 2
                                              //           ? Color(0xFF00BFFF)
                                              //           : Colors.white,
                                              //       onPressed: () {
                                              //         Navigator.of(context)
                                              //             .push(HeroDialogRoute(
                                              //                 builder:
                                              //                     (context) {
                                              //           return const _BalancedTodoPopupCard();
                                              //         }));
                                              //         Hero(
                                              //           tag: _heroAddTodo,
                                              //           createRectTween:
                                              //               (begin, end) {
                                              //             return CustomRectTween(
                                              //                 begin: begin,
                                              //                 end: end);
                                              //           },
                                              //           child: Material(
                                              //             color: Colors.white,
                                              //             elevation: 2,
                                              //             shape: RoundedRectangleBorder(
                                              //                 borderRadius:
                                              //                     BorderRadius
                                              //                         .circular(
                                              //                             32)),
                                              //           ),
                                              //         );
                                              //       },
                                              //       padding:
                                              //           EdgeInsets.all(0.0),
                                              //       child: Image.asset(
                                              //         'assets/images/info_icon.png',
                                              //         color: result[0] == 2
                                              //             ? Colors.white
                                              //             : Colors.black,
                                              //         width: 35.0,
                                              //         height: 35.0,
                                              //       ),
                                              //     );
                                              //   }),
                                              // ),
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
                //third page
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
                                                      color: results[
                                                                  'thirdQuestion'] ==
                                                              'Gain Muscle Mass'
                                                          ? Color(0xFF00BFFF)
                                                          : Colors.white,
                                                      onPressed: () => setState(
                                                          () => results[
                                                                  'thirdQuestion'] =
                                                              'Gain Muscle Mass'),
                                                      child: Text(
                                                        "Gain Muscle Mass",
                                                        style: TextStyle(
                                                            fontSize: 30,
                                                            color: results[
                                                                        'thirdQuestion'] ==
                                                                    'Gain Muscle Mass'
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
                                                    color: results[
                                                                'thirdQuestion'] ==
                                                            'Gain Muscle Mass'
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
                                                      color: results[
                                                                  'thirdQuestion'] ==
                                                              'Gain Muscle Mass'
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
                                                    color:
                                                        results['thirdQuestion'] ==
                                                                'Burn Fat'
                                                            ? Color(0xFF00BFFF)
                                                            : Colors.white,
                                                    onPressed: () => setState(
                                                        () => results[
                                                                'thirdQuestion'] =
                                                            'Burn Fat'),
                                                    child: Text(
                                                      "Burn Fat",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color:
                                                              results['thirdQuestion'] ==
                                                                      'Burn Fat'
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black),
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
                                                    color:
                                                        results['thirdQuestion'] ==
                                                                'Burn Fat'
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
                                                      color:
                                                          results['thirdQuestion'] ==
                                                                  'Burn Fat'
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
                                                    color:
                                                        results['thirdQuestion'] ==
                                                                'Balanced'
                                                            ? Color(0xFF00BFFF)
                                                            : Colors.white,
                                                    onPressed: () => setState(
                                                        () => results[
                                                                'thirdQuestion'] =
                                                            'Balanced'),
                                                    child: Text(
                                                      "Balanced",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color:
                                                              results['thirdQuestion'] ==
                                                                      'Balanced'
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black),
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
                                                    color:
                                                        results['thirdQuestion'] ==
                                                                'Balanced'
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
                                                      color:
                                                          results['thirdQuestion'] ==
                                                                  'Balanced'
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
                                                    color:
                                                        results['thirdQuestion'] ==
                                                                'Improve Cardio'
                                                            ? Color(0xFF00BFFF)
                                                            : Colors.white,
                                                    onPressed: () => setState(
                                                        () => results[
                                                                'thirdQuestion'] =
                                                            'Improve Cardio'),
                                                    child: Text(
                                                      "Improve Cardio",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color: results[
                                                                      'thirdQuestion'] ==
                                                                  'Improve Cardio'
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
                                                    color:
                                                        results['thirdQuestion'] ==
                                                                'Improve Cardio'
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
                                                      color: results[
                                                                  'thirdQuestion'] ==
                                                              'Improve Cardio'
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
                                                    color: results[
                                                                'thirdQuestion'] ==
                                                            'Improve Strength'
                                                        ? Color(0xFF00BFFF)
                                                        : Colors.white,
                                                    onPressed: () => setState(
                                                        () => results[
                                                                'thirdQuestion'] =
                                                            'Improve Strength'),
                                                    child: Text(
                                                      "Improve Strength",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color: results[
                                                                      'thirdQuestion'] ==
                                                                  'Improve Strength'
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
                                                    color: results[
                                                                'thirdQuestion'] ==
                                                            'Improve Strength'
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
                                                      color: results[
                                                                  'thirdQuestion'] ==
                                                              'Improve Strength'
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
                //fifth page
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
                                    "Do you follow any specialty diets?",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500),
                                  )),
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
                                                      color: results[
                                                                  'fifthQuestion'] ==
                                                              'Vegan'
                                                          ? Color(0xFF00BFFF)
                                                          : Colors.white,
                                                      onPressed: () => setState(
                                                          () => results[
                                                                  'fifthQuestion'] =
                                                              'Vegan'),
                                                      child: Text(
                                                        "Vegan",
                                                        style: TextStyle(
                                                            fontSize: 30,
                                                            color: results[
                                                                        'fifthQuestion'] ==
                                                                    'Vegan'
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
                                                    color:
                                                        results['fifthQuestion'] ==
                                                                'Vegetarian'
                                                            ? Color(0xFF00BFFF)
                                                            : Colors.white,
                                                    onPressed: () => setState(
                                                        () => results[
                                                                'fifthQuestion'] =
                                                            'Vegetarian'),
                                                    child: Text(
                                                      "Vegetarian",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color: results[
                                                                      'fifthQuestion'] ==
                                                                  'Vegetarian'
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
                                                    color:
                                                        results['fifthQuestion'] ==
                                                                'None'
                                                            ? Color(0xFF00BFFF)
                                                            : Colors.white,
                                                    onPressed: () => setState(
                                                        () => results[
                                                                'fifthQuestion'] =
                                                            'None'),
                                                    child: Text(
                                                      "None",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color:
                                                              results['fifthQuestion'] ==
                                                                      'None'
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black),
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
                //seventh page
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
                                                      color: equipmentResults[
                                                                  0] ==
                                                              "Dumbbells"
                                                          ? Color(0xFF00BFFF)
                                                          : Colors.white,
                                                      onPressed: () => {
                                                        setState(() => equipmentResults
                                                                .containsValue(
                                                                    "Dumbbells")
                                                            ? equipmentResults
                                                                .remove(0)
                                                            : equipmentResults[
                                                                    0] =
                                                                "Dumbbells"),
                                                        results['seventhQuestion'] =
                                                            equipmentResults,
                                                      },
                                                      child: Text(
                                                        "Dumbbells",
                                                        style: TextStyle(
                                                            fontSize: 30,
                                                            color: equipmentResults[
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
                                                    color:
                                                        equipmentResults[1] ==
                                                                "Barbell"
                                                            ? Color(0xFF00BFFF)
                                                            : Colors.white,
                                                    onPressed: () => {
                                                      setState(() =>
                                                          equipmentResults
                                                                  .containsValue(
                                                                      "Barbell")
                                                              ? equipmentResults
                                                                  .remove(1)
                                                              : equipmentResults[
                                                                      1] =
                                                                  "Barbell"),
                                                      results['seventhQuestion'] =
                                                          equipmentResults
                                                    },
                                                    child: Text(
                                                      "Barbell",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color:
                                                              equipmentResults[
                                                                          1] ==
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
                                                    color:
                                                        equipmentResults[2] ==
                                                                "Bench"
                                                            ? Color(0xFF00BFFF)
                                                            : Colors.white,
                                                    onPressed: () => {
                                                      setState(() =>
                                                          equipmentResults
                                                                  .containsValue(
                                                                      "Bench")
                                                              ? equipmentResults
                                                                  .remove(2)
                                                              : equipmentResults[
                                                                  2] = "Bench"),
                                                      results['seventhQuestion'] =
                                                          equipmentResults
                                                    },
                                                    child: Text(
                                                      "Bench",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color:
                                                              equipmentResults[
                                                                          2] ==
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
                                                    color:
                                                        equipmentResults[3] ==
                                                                "Squat Rack"
                                                            ? Color(0xFF00BFFF)
                                                            : Colors.white,
                                                    onPressed: () => {
                                                      setState(() => equipmentResults
                                                              .containsValue(
                                                                  "Squat Rack")
                                                          ? equipmentResults
                                                              .remove(3)
                                                          : equipmentResults[
                                                                  3] =
                                                              "Squat Rack"),
                                                      results['seventhQuestion'] =
                                                          equipmentResults
                                                    },
                                                    child: Text(
                                                      "Squat Rack",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color: equipmentResults[
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
                                                    color: equipmentResults[
                                                                4] ==
                                                            "Resistence Bands"
                                                        ? Color(0xFF00BFFF)
                                                        : Colors.white,
                                                    onPressed: () => {
                                                      setState(() => equipmentResults
                                                              .containsValue(
                                                                  "Resistence Bands")
                                                          ? equipmentResults
                                                              .remove(4)
                                                          : equipmentResults[
                                                                  4] =
                                                              "Resistence Bands"),
                                                      results['seventhQuestion'] =
                                                          equipmentResults
                                                    },
                                                    child: Text(
                                                      "Resistence Bands",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color: equipmentResults[
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
                                                    color:
                                                        equipmentResults[5] ==
                                                                "Full Gym"
                                                            ? Color(0xFF00BFFF)
                                                            : Colors.white,
                                                    onPressed: () => {
                                                      setState(() =>
                                                          equipmentResults
                                                                  .containsValue(
                                                                      "Full Gym")
                                                              ? equipmentResults
                                                                  .remove(5)
                                                              : equipmentResults[
                                                                      5] =
                                                                  "Full Gym"),
                                                      results['seventhQuestion'] =
                                                          equipmentResults
                                                    },
                                                    child: Text(
                                                      "Full Gym",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color:
                                                              equipmentResults[
                                                                          5] ==
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
                                                    color: equipmentResults[
                                                                6] ==
                                                            "Somewhere to Run"
                                                        ? Color(0xFF00BFFF)
                                                        : Colors.white,
                                                    onPressed: () => {
                                                      setState(() => equipmentResults
                                                              .containsValue(
                                                                  "Somewhere to Run")
                                                          ? equipmentResults
                                                              .remove(6)
                                                          : equipmentResults[
                                                                  6] =
                                                              "Somewhere to Run"),
                                                      results['seventhQuestion'] =
                                                          equipmentResults
                                                    },
                                                    child: Text(
                                                      "Somewhere to Run",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color: equipmentResults[
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
                //eighth page
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
                                    "How many days do you want to workout per week?",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500),
                                  )),
                              Text(
                                "(You can change this once your plan is made)",
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
                                                      color: results[
                                                                  'eighthQuestion'] ==
                                                              '3'
                                                          ? Color(0xFF00BFFF)
                                                          : Colors.white,
                                                      onPressed: () => setState(
                                                          () => results[
                                                                  'eighthQuestion'] =
                                                              '3'),
                                                      child: Text(
                                                        "3",
                                                        style: TextStyle(
                                                            fontSize: 30,
                                                            color: results[
                                                                        'eighthQuestion'] ==
                                                                    '3'
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
                                                    color:
                                                        results['eighthQuestion'] ==
                                                                '4'
                                                            ? Color(0xFF00BFFF)
                                                            : Colors.white,
                                                    onPressed: () => setState(
                                                        () => results[
                                                                'eighthQuestion'] =
                                                            '4'),
                                                    child: Text(
                                                      "4",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color:
                                                              results['eighthQuestion'] ==
                                                                      '4'
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
                                                    color:
                                                        results['eighthQuestion'] ==
                                                                '5'
                                                            ? Color(0xFF00BFFF)
                                                            : Colors.white,
                                                    onPressed: () => setState(
                                                        () => results[
                                                                'eighthQuestion'] =
                                                            '5'),
                                                    child: Text(
                                                      "5",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color:
                                                              results['eighthQuestion'] ==
                                                                      '5'
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
                                                    color:
                                                        results['eighthQuestion'] ==
                                                                '6'
                                                            ? Color(0xFF00BFFF)
                                                            : Colors.white,
                                                    onPressed: () => setState(
                                                        () => results[
                                                                'eighthQuestion'] =
                                                            '6'),
                                                    child: Text(
                                                      "6",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color:
                                                              results['eighthQuestion'] ==
                                                                      '6'
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Gain Muscle Mass",
                      style: QuestionnairePage.popupTitle,
                    ),
                    Text(
                      "Overview:",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.popupSubLabel,
                    ),
                    Text(
                      "+ Build Strength\n+ Add Muscle\n+ Increase Weight\n - Add Fat\n",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.style,
                    ),
                    Text(
                      "Workout:",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.popupSubLabel,
                    ),
                    Text(
                      "- Muscular Hypertrophy\n",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.style,
                    ),
                    Text(
                      "Nutrition:",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.popupSubLabel,
                    ),
                    Text(
                      "- Calroic Surplus\n- High Carbs\n- Moderate Protein\n- Low Fats\n",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.style,
                    ),
                    TextButton(
                      // color: Color(0xFF00BFFF),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        primary: Color(0xFF00BFFF),
                      ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Burn Fat",
                      style: QuestionnairePage.popupTitle,
                    ),
                    Text(
                      "Overview:",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.popupSubLabel,
                    ),
                    Text(
                      "+ Lose Weight\n+ Lose Fat\n - Lose Muscle\n",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.style,
                    ),
                    Text(
                      "Workout:",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.popupSubLabel,
                    ),
                    Text(
                      "- High Intensity Training\n- Cadriovascular Training\n",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.style,
                    ),
                    Text(
                      "Nutrition:",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.popupSubLabel,
                    ),
                    Text(
                      "- Calroic Surplus\n- Low Carbs\n- High Protein\n- High Fats\n",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.style,
                    ),
                    TextButton(
                      // color: Color(0xFF00BFFF),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        primary: Color(0xFF00BFFF),
                      ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Balanced Training",
                      style: QuestionnairePage.popupTitle,
                    ),
                    Text(
                      "Overview:",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.popupSubLabel,
                    ),
                    Text(
                      "+ Build Strength\n+ Lose Fat\n - Increased Duration\n",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.style,
                    ),
                    Text(
                      "Workout:",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.popupSubLabel,
                    ),
                    Text(
                      "- Muscular Hypertrophy\n- High Intensity Training\n",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.style,
                    ),
                    Text(
                      "Nutrition:",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.popupSubLabel,
                    ),
                    Text(
                      "- Slight Calroic Surplus\n- Low Carbs\n- High Protein\n- High Fats\n",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.style,
                    ),
                    TextButton(
                      // color: Color(0xFF00BFFF),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        primary: Color(0xFF00BFFF),
                      ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Improve Cardio",
                      style: QuestionnairePage.popupTitle,
                    ),
                    Text(
                      "Overview:",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.popupSubLabel,
                    ),
                    Text(
                      "+ Increase Endurance\n+ Lose Weight\n+ Lose Fat\n - Lose Muscle\n",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.style,
                    ),
                    Text(
                      "Workout:",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.popupSubLabel,
                    ),
                    Text(
                      "- Cardiovascular Training\n",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.style,
                    ),
                    Text(
                      "Nutrition:",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.popupSubLabel,
                    ),
                    Text(
                      "- Slight Calroic Surplus\n- High Carbs\n- Moderate Protein\n- Low Fats\n",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.style,
                    ),
                    TextButton(
                      // color: Color(0xFF00BFFF),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        primary: Color(0xFF00BFFF),
                      ),
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
                      "Flexibility Info\n- Hello",
                      style: QuestionnairePage.style,
                    ),
                    TextButton(
                      // color: Color(0xFF00BFFF),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        primary: Color(0xFF00BFFF),
                      ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Improve Strength",
                      style: QuestionnairePage.popupTitle,
                    ),
                    Text(
                      "Overview:",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.popupSubLabel,
                    ),
                    Text(
                      "+ Build Strength\n+ Add Muscle\n+ Increase Weight\n - Add Fat\n",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.style,
                    ),
                    Text(
                      "Workout:",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.popupSubLabel,
                    ),
                    Text(
                      "- Strength Training\n",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.style,
                    ),
                    Text(
                      "Nutrition:",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.popupSubLabel,
                    ),
                    Text(
                      "- Caloric Surplus\n- High Carbs\n- Moderate Protein\n- Low Fats\n",
                      textAlign: TextAlign.left,
                      style: QuestionnairePage.style,
                    ),
                    TextButton(
                      // color: Color(0xFF00BFFF),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        primary: Color(0xFF00BFFF),
                      ),
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
