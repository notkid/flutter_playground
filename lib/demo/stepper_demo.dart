import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  static const String routeName = '/stepperDemo';
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int currentStep = 0;
  List<Step> steps = [
    Step(title: Text('0'), isActive: true, content: Text('11')),
    Step(title: Text('2'), isActive: true, content: Text('2')),
    Step(title: Text('3'), isActive: true, content: Text('2323233')),
    Step(title: Text('4'), isActive: true, content: Text('4')),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Stepper(
          currentStep: currentStep,
          type: StepperType.horizontal,
          steps: steps,
          onStepContinue: () {
            setState(() {
              currentStep < steps.length - 1
                  ? currentStep += 1
                  : currentStep = 0;
            });
          },
        ),
      ),
    );
  }
}
