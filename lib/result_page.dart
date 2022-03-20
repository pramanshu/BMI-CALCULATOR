import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Result',
                style: numberTextStyle,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(15.0),
                  //  rgba
                  color: Color(0xFF1D1E33),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'OVERWEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        '26.5',
                        style: numberTextStyle,
                      ),
                      Text(
                        'you have higher weight try to excercise more',
                        style: kLabelTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      // Container(
                      //   margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
                      //   child:Text('you have higher weight try to excercise more',style: numberTextStyle,)
                      //   ,
                      // )
                    ],
                  ),

                  //  color: Color.fromARGB(28,28,44,255),
                ),
              ),
              InkWell(
                onTap: () => {Navigator.pushNamed(context, '/result_page')},
                child: Container(
                  child: Center(
                    child: Text('RE-CALCULATE'),
                  ),
                  color: Color(0xFFEB1555),
                  height: 70,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(0.0, 10, 0.0, 0.0),
                ),
              )
            ]));
  }
}
