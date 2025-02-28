import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final IconData icon;
  final Color color;
  const RoundIconButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon,
          color: Colors
              .white), //Icon(Icons.facebook, color: Colors.white)// ,icon: Icon(Icons.g_mobiledata, color: Colors.white),
      label: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadowColor: Colors.black.withOpacity(0.2),
        elevation: 5,
        padding: EdgeInsets.symmetric(vertical: 15),
        minimumSize: Size(double.infinity, 50),
      ),
    );
  }
}
