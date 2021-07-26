import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Quote extends StatelessWidget {
  const Quote({
    Key? key,
    required this.quote,
    required this.author,
  }) : super(key: key);

  @required
  final String quote;
  @required
  final String author;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 150,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(20)),
      child: Scaffold(),
    );
  }
}
