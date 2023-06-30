import 'package:flutter/material.dart';
import 'package:bmi_flutter_test/constants/constants.dart';

class ReusableChildCard extends StatelessWidget {
  const ReusableChildCard({super.key, required this.label, required this.icon});

  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 80.0),
        const SizedBox(height: 15.0),
        Text(label,
            style: labelTextStyle,
        ),
      ],
    );
  }
}
