import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.settings,
                size: 50.0,
              ),
              Text(
                'Settings',
                style: TextStyle(fontSize: 50.0),
              ),
            ],
          ),
        )
      ],
    );
  }
}