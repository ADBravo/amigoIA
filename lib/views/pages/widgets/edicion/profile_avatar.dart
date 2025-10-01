import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.blue[50],
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.person_outline,
          size: 40,
          color: Colors.blue[700],
        ),
      ),
    );
  }
}