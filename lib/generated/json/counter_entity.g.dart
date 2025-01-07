import 'package:flutter_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_app/kp/bean/counter_entity.dart';

CounterEntity $CounterEntityFromJson(Map<String, dynamic> json) {
  final CounterEntity counterEntity = CounterEntity();
  final int? count = jsonConvert.convert<int>(json['count']);
  if (count != null) {
    counterEntity.count = count;
  }
  return counterEntity;
}

Map<String, dynamic> $CounterEntityToJson(CounterEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['count'] = entity.count;
  return data;
}

extension CounterEntityExtension on CounterEntity {
  CounterEntity copyWith({
    int? count,
  }) {
    return CounterEntity()
      ..count = count ?? this.count;
  }
}