import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

const activeColor = Color(0xFF1D1E33);
const inactiveColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }
enum Type {weight,age}

class _InputPageState extends State<InputPage> {
  @override
  Color maleBttnColor = inactiveColor;
  Color femalebttnColor = inactiveColor;
  var height = 180;
  var weight = 60;
  var age = 20;

  void Dec_Function(Type selctedType,){
    if(selctedType == Type.weight){
      this.setState(() {
        weight--;
      });
    }

    if(selctedType == Type.age){
      this.setState(() {
        age--;
      });
    }
  }

  void Inc_Function(Type selctedType,){
    if(selctedType == Type.weight){
      this.setState(() {
        weight++;
      });
    }
    if(selctedType == Type.age){
      this.setState(() {
        age++;
      });
    }
  }
  void bttnpressed(Gender SelectedGender) {
    if (SelectedGender == Gender.male) {
      maleBttnColor = activeColor;
      femalebttnColor = inactiveColor;
      print('male pressed');
    } else {
      femalebttnColor = activeColor;
      maleBttnColor = inactiveColor;
      print('female pressed');
    }
  }

  Function onTapFunc(Gender gend) {
    setState(() {
      bttnpressed(gend);
      print('bttn called');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ReusableCardWidget(
                      colour: maleBttnColor,
                      child: ImageWithTextWidget(
                        FontAwesomeIcons.mars,
                        'MALE',
                      ),
                      onTapCalled: () => onTapFunc(Gender.male),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ReusableCardWidget(
                      colour: femalebttnColor,
                      child:
                          ImageWithTextWidget(FontAwesomeIcons.venus, 'FEMALE'),
                      onTapCalled: () => onTapFunc(Gender.female),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ReusableCardWidget(
                colour: Color(0xFF1D1E33),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: kLabelTextStyle,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: numberTextStyle,
                          ),
                          Text('cm')
                        ]),
                    Slider(
                      value: height.toDouble(),
                      max: 300,
                      label: height.round().toString(),
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ReusableCardWidget(
                      colour: Color(0xFF1D1E33),
                      child: Inc_Dec_widget('Weight',Type.weight),
                    ),
                  ),
                  Expanded(
                    child: ReusableCardWidget(
                      colour: Color(0xFF1D1E33),
                        child: Inc_Dec_widget('Age',Type.age)
                    ),
                  ),
                ],
              ),
            ),

            InkWell(
              onTap: ()=>{Navigator.pushNamed(context, '/result_page')},
              child: Container(
                child:
                Center(child: Text('CALCULATE'),),

                color: Color(0xFFEB1555),
                height: 70,
                width: double.infinity,
                margin:  EdgeInsets.fromLTRB(0.0, 10, 0.0, 0.0),
              ),
            )

          ],
        ));
  }

  Column Inc_Dec_widget(String text,Type type) {



    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          text,
                          style: kLabelTextStyle,
                        ),
                        Text(
                        (type == Type.weight ? weight : age).toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(iconData: Icons.remove,onPress: ()=>this.Dec_Function(type == Type.weight ? Type.weight : Type.age)),
                            RoundIconButton(iconData: Icons.add,onPress: ()=>this.Inc_Function(type == Type.weight ? Type.weight : Type.age))
                          ],
                        )

                        //,onPress: ()=>this.Dec_Function(Type.weight)
                        //()=>this.Inc_Function(Type.weight)
                      ],
                    );
  }
}

class ImageWithTextWidget extends StatelessWidget {
  final IconData iconData;
  final String strngText;

  ImageWithTextWidget(this.iconData, this.strngText);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80,
        ),
        SizedBox(height: 10),
        Text(strngText)
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.iconData,this.onPress});
  final IconData iconData;
  Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: (){onPress();},
      elevation: 0,
      child: Icon(iconData),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 40, height: 40),
      fillColor: Colors.grey,
    );
  }
}

//Color(0xFF1D1E33)
class ReusableCardWidget extends StatelessWidget {
  Color colour;
  Widget child;
  Function onTapCalled;
  ReusableCardWidget({@required this.colour, this.child, this.onTapCalled});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapCalled();
      },

      child: Container(
        child: child,
        decoration: BoxDecoration(
          color: colour,
          border: Border.all(
            color: colour,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(15.0),
      ),
      // height: 200,
    );
  }
}
