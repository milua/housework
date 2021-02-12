import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const TextStyle labelTextStyle = TextStyle(color: Colors.grey);
    const TextStyle textStyle = TextStyle(fontSize: 16);

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Fold laundry',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Divider(),
            Text(
              'estimated time',
              style: labelTextStyle,
            ),
            Text(
              '30minutes',
              style: textStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'description',
              style: labelTextStyle,
            ),
            Text(
              'Take the laundry out of the drying machine, fold it and put it in its rightful place in the closet, the drawer or underneath the bed.',
              style: textStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'points',
              style: labelTextStyle,
            ),
            Text(
              '75',
              style: textStyle,
            ),
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }
}
