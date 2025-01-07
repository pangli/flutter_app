import 'package:flutter_app/generated/json/base/json_field.dart';
import 'package:flutter_app/generated/json/counter_entity.g.dart';
import 'dart:convert';
export 'package:flutter_app/generated/json/counter_entity.g.dart';

@JsonSerializable()
class CounterEntity {
	late int count;

	CounterEntity();

	factory CounterEntity.fromJson(Map<String, dynamic> json) => $CounterEntityFromJson(json);

	Map<String, dynamic> toJson() => $CounterEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}