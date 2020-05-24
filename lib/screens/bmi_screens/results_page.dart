import 'package:flutter/material.dart';
import 'package:work_space/widgets/bmi_components/bottom_button.dart';
import 'package:work_space/widgets/bmi_components/reusable_card.dart';

import '../../constants.dart';



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
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        title: FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            '👈 Do it again',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 20,
            ),
          ),
        ),
        elevation: 0.2,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle.apply(color: color),
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
            buttonTitle: 'get Started 🙌',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
