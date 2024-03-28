import 'package:apna_advocate/constant/assets.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

class stepper extends StatefulWidget {
  stepper({Key? key, required this.step}) : super(key: key);
final step ;
  @override
  State<stepper> createState() => _stepperState();
}

class _stepperState extends State<stepper> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    activeStep = widget.step;
  }
  int activeStep = 0;
  int activeStep2 = 0;
  int reachedStep = 0;
  int upperBound = 5;
  double progress = 0.2;
  Set<int> reachedSteps = <int>{0, 2, 4, 5};

  final dashImages = [
    assets.logo,
    assets.logo,
    assets.logo,
    assets.logo,
    assets.logo,
  ];

  void increaseProgress() {
    if (progress < 1) {
      setState(() => progress += 0.2);
    } else {
      setState(() => progress = 0);
    }
  }

  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      child: EasyStepper(
        activeStep: activeStep,
        stepShape: StepShape.rRectangle,
        stepBorderRadius: 15,
        borderThickness: 2,
        stepRadius: 28,
        finishedStepBorderColor: Colors.deepOrange,
        finishedStepTextColor: Colors.deepOrange,
        finishedStepBackgroundColor: Colors.deepOrange,
        activeStepIconColor: Colors.deepOrange,
        showLoadingAnimation: false,
        steps: [
          EasyStep(
            customStep: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Opacity(
                opacity: activeStep >= 0 ? 1 : 0.3,
                child: Image.asset(assets.logo),
              ),
            ),
            customTitle: const Text(
              'Dash 1',
              textAlign: TextAlign.center,
            ),
          ),
          EasyStep(
            customStep: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Opacity(
                opacity: activeStep >= 1 ? 1 : 0.3,
                child: Image.asset(assets.logo),
              ),
            ),
            customTitle: const Text(
              'Dash 2',
              textAlign: TextAlign.center,
            ),
          ),
          EasyStep(
            customStep: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Opacity(
                opacity: activeStep >= 2 ? 1 : 0.3,
                child: Image.asset(assets.logo),
              ),
            ),
            customTitle: const Text(
              'Dash 3',
              textAlign: TextAlign.center,
            ),
          ),
          EasyStep(
            customStep: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Opacity(
                opacity: activeStep >= 3 ? 1 : 0.3,
                child: Image.asset(assets.logo),
              ),
            ),
            customTitle: const Text(
              'Dash 4',
              textAlign: TextAlign.center,
            ),
          ),
          EasyStep(
            customStep: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Opacity(
                opacity: activeStep >= 4 ? 1 : 0.3,
                child: Image.asset(assets.logo),
              ),
            ),
            customTitle: const Text(
              'Dash 5',
              textAlign: TextAlign.center,
            ),
          ),
        ],
        onStepReached: (index) => setState(() => activeStep = index),
      ),
    );
  }
}
