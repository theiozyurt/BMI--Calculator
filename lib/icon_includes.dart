import 'package:flutter/material.dart';
import 'constants.dart';

class iconIncludes extends StatelessWidget {
  final IconData icon1;
  final String label;

  //final String? label;

  //*** Description of nullable ***
  //If I want to make the data type optional then I can put a question mark end of the variable,
  //But also we need to use (!) when we are trying to use our variable as a normal type of it
  iconIncludes({required this.icon1, required this.label}) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon1,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(label,
            //label! (Alternative, for make it nullable)
            style: kLabelTextStyle),
      ],
    );
  }
}
