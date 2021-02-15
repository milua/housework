import 'package:housework/rewards/entities/reward.dart';

class DummyRewardService {
  List<Reward> rewards;

  DummyRewardService() {
    rewards = new List<Reward>();
    initializeRewardList();
  }

  List<Reward> getRewards() {
    return rewards;
  }

  void initializeRewardList() {
    rewards.add(new Reward(1, '1 hour table soccer training', 75));
    rewards.add(new Reward(2, 'wash dishes coupon (1 day)', 50));
    rewards.add(new Reward(3, 'foot massage', 1025));
    rewards.add(new Reward(4, 'piano lesson (45 min)', 5));
  }
}
