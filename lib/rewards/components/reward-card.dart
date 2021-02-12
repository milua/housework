import 'package:flutter/material.dart';

class RewardCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const TextStyle labelTextStyle = TextStyle(color: Colors.grey);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Table soccer training',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'points: 1005',
                      style: labelTextStyle,
                    ),
                    Text(
                      'estimated time: 1 hour',
                      style: labelTextStyle,
                    ),
                    SizedBox(height: 10),
                  ]),
              Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          child: Text("CLAIM"),
                          onPressed: () {},
                          textColor: Colors.green,
                        ),
                      ]),
                ],
              ),
            ]),
      ),
      margin: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 15.0),
    );
  }
}
