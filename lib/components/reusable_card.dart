import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {super.key, required this.colour, required this.cardChild, this.onPress});
  final Color
      colour; //add final that can't be changed, colour can be changed at runtime, not at compile time.
  final Widget cardChild;
  // final onPress;
  final VoidCallback? onPress; // Add the type annotation VoidCallback(takes no arguments and returns no value)
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardChild,
      ),
    );
  }
}
