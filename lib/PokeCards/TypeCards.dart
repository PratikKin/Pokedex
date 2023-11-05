import 'package:flutter/material.dart';

class TypeCard extends StatelessWidget {
  final String type;
  const TypeCard({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.greenAccent.shade200,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(),
        ),
        height: 30.0,
        width: 70.0,
        child: Center(
          child: Text(
            type,
            style: TextStyle(fontFamily: "Play", color: Colors.black),
          ),
        ),
      ),
    );
  }
}
