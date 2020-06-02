import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import '../../constants.dart';
import '../diet_screens/diet_generator_screen.dart';
import '../../widgets/bmi_components.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.interpretation,
      @required this.bmiResult,
      @required this.resultText,
      @required this.color});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient: LinearGradient(
          colors: [
            Color(0xffeaa448),
            Color(0xffe46b10),
            Color(0xffdd4400),
          ],
        ),
        automaticallyImplyLeading: false,
        title: FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            '👈 Do it again',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffeaa448),
              Color(0xffe46b10),
              Color(0xffdd4400),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.bottomLeft,
                child: Center(
                  child: Text(
                    'Your Result',
                    style: kTitleTextStyle,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                transparentBorder: true,
                colour: Colors.transparent,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 7),
                      child: Text(
                        resultText.toUpperCase(),
                        style: kResultTextStyle.apply(
                          color: color,
                        ),
                      ),
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonTitle: 'Get Started 🙌',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DietGeneratorScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
