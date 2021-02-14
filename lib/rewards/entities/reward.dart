import 'package:housework/rewards/valueobjects/reward-status.dart';

class Reward {
  int id;
  String author;
  String title;
  int points;
  RewardStatus status;
  String claimer;
  DateTime claimedDate;
  DateTime doneDate;
  DateTime plannedDate;

  Reward(int id, String author, String title, int points) {
    this.id = id;
    this.author = author;
    this.title = title;
    this.points = points;
    this.status = RewardStatus.OPEN;
  }

  void claimReward(String claimer) {
    this.status = RewardStatus.CLAIMED;
    this.claimer = claimer;
    this.claimedDate = DateTime.now();
  }

  void planReward(String author, DateTime plannedDate) {
    if (author != this.author) {
      // TODO shouldn't happen. Only the author can give the reward to the claimer. Show error message or user feedback here
    } else {
      this.status = RewardStatus.PLANNED;
      this.plannedDate = plannedDate;
    }
  }

  void executedReward(String author, DateTime doneDate) {
    if (author != this.author) {
      // TODO shouldn't happen. Only the author can give the reward to the claimer. Show error message or user feedback here
    } else {
      this.status = RewardStatus.DONE;
      this.doneDate = doneDate;
    }
  }
}
