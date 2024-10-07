import 'package:flutter/material.dart';

class Erode extends StatelessWidget {
  const Erode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     
      margin: const EdgeInsets.only(top: 50, bottom: 100, left: 20),
      child: Center(
        child: Text(
          "Crafted in Erode 🧡",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}