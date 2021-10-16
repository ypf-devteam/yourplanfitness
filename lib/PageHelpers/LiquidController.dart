import 'package:flutter/material.dart';
import 'package:your_plan_fitness/Provider/iamariderprovider.dart';
import 'package:provider/provider.dart';

class LiquidController {
  IAmARiderProvider provider;

  LiquidController();

  setContext(BuildContext context) {
    provider = Provider.of<IAmARiderProvider>(context, listen: false);
  }

  jumpToPage({int page}) {
    provider.jumpToPage(page);
  }

  animateToPage({int page, int duration = 650}) {
    provider.animateToPage(page, duration);
  }

  int get currentPage => provider.activePageIndex;

  shouldDisableGestures({bool disable}) {
    provider.setUserGesture = disable;
  }

  bool get isUserGestureDisabled => provider.isUserGestureDisabled;
}
