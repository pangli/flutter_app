import 'package:flutter_app/base/model/base_model.dart';
import 'package:flutter_app/kp/bean/counter_entity.dart';

import '../net/net_api.dart';

class CounterModel extends BaseModel {
  Future<CounterEntity> loadCountFromServer() async {
    final response = await dio.get('count');
    if (response.statusCode != 200) {
      throw ('Failed to update resource');
    }

    return CounterEntity.fromJson(response.data);
  }

  Future<CounterEntity> updateCountOnServer(int newCount) async {
    final response = await dio.get('count');
    if (response.statusCode != 200) {
      throw ('Failed to update resource');
    }
    response.data["count"] = newCount + 1;
    return CounterEntity.fromJson(response.data);
  }
}
