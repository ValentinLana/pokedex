import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'An error ocurred',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 28,
            color: Color.fromARGB(255, 118, 116, 116),
          ),
        ),
        Text(
          'Please try again later',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 28,
            color: Color.fromARGB(255, 118, 116, 116),
          ),
        ),
      ],
    ));
  }
}
