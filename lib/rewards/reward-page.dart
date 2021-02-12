import 'package:flutter/material.dart';
import 'package:housework/rewards/components/reward-card.dart';

class RewardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[RewardCard()],
    );
  }
}
