import 'package:housework/rewards/valueobjects/reward-status.dart';

class Reward {
  int id;
  String author;
  String title;
  int points;
  RewardStatus status;
  String claimer;
  DateTime claimedDate;

  Reward(int id, String title, int points, String author) {
    this.id = id;
    this.author = author;
    this.title = title;
    this.points = points;
    this.status = RewardStatus.OPEN;
  }

  void claimReward(String claimer) {
    this.status = RewardStatus.PENDING;
    this.claimer = claimer;
    this.claimedDate = DateTime.now();
  }

  void executedReward(String author, DateTime doneDate) {
    if (author != this.author) {
      // TODO shouldn't happen. Only the author can give the reward to the claimer. Show error message or user feedback here
    } else {
      this.status = RewardStatus.OPEN;
    }
  }
}
