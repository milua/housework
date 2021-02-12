/// Flutter code sample for ExpansionPanelList

// Here is a simple example of how to implement ExpansionPanelList.

import 'package:flutter/material.dart';

// stores ExpansionPanel state information
class PanelAttributes {
  PanelAttributes({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

PanelAttributes generateWidget(String header, String content) {
  return PanelAttributes(
    headerValue: header,
    expandedValue: content,
  );
}

/// This is the stateful widget that the main application instantiates.
class DescriptionPanel extends StatefulWidget {
  DescriptionPanel({Key key}) : super(key: key);

  @override
  _DescriptionPanelState createState() => _DescriptionPanelState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _DescriptionPanelState extends State<DescriptionPanel> {
  PanelAttributes _data = generateWidget('description', 'some content');

  @override
  Widget build(BuildContext context) {
    const TextStyle subtitleTExtStyle = TextStyle(color: Colors.grey);

    return ExpansionPanelList(
        elevation: 1,
        expandedHeaderPadding: EdgeInsets.zero,
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data.isExpanded = !isExpanded;
          });
        },
        children: <ExpansionPanel>[
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Washing dishes',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'points: 30',
                        style: subtitleTExtStyle,
                      ),
                    ]),
              );
            },
            body: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 5.0),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'estimated time: 1 hour',
                                style: subtitleTExtStyle,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'description: ' + _data.expandedValue,
                                style: subtitleTExtStyle,
                              ),
                            ]),
                        Column(
                          children: <Widget>[
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  FlatButton(
                                    child: Text("DONE"),
                                    onPressed: () {},
                                    textColor: Colors.green,
                                  ),
                                ]),
                          ],
                        ),
                      ]),
                ])),
            isExpanded: _data.isExpanded,
          )
        ]);
  }
}
