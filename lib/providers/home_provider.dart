import 'package:dhh_client/sql/home_sql.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier {
  bool _allFinished;
  bool get allFinished => _allFinished;

  Future<void> setAllFinished() async {
    final homeData = await HomeSql.getHomeData();
    _allFinished = homeData[0]['all_finished'] == 1 ? true : false;
  }
}
