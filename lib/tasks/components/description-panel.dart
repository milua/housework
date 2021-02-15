/// Flutter code sample for ExpansionPanelList

// Here is a simple example of how to implement ExpansionPanelList.

import 'package:flutter/material.dart';
import 'package:housework/tasks/entities/task.dart';

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

class DescriptionPanel extends StatefulWidget {
  final Task task;

  DescriptionPanel({Key key, @required this.task}): super(key: key);

  @override
  _DescriptionPanelState createState() => _DescriptionPanelState(this.task);
}

class _DescriptionPanelState extends State<DescriptionPanel> {
  Task task;
  PanelAttributes _data;

  _DescriptionPanelState(this.task){
    this._data = generateWidget(task.title, task.title);
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle subtitleTextStyle = TextStyle(color: Colors.grey);

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
                        this.task.title,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        this.task.points.value.toString() + ' pts.',
                        style: subtitleTextStyle,
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
                                style: subtitleTextStyle,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'description: ' + _data.expandedValue,
                                style: subtitleTextStyle,
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
