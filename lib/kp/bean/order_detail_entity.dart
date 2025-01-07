import 'package:flutter_app/generated/json/base/json_field.dart';
import 'package:flutter_app/generated/json/order_detail_entity.g.dart';
import 'dart:convert';
export 'package:flutter_app/generated/json/order_detail_entity.g.dart';

@JsonSerializable()
class OrderDetailEntity {
	@JSONField(name: 'order_id')
	late String orderId;
	@JSONField(name: 'serial_id')
	late String serialId;
	@JSONField(name: 'create_time')
	late String createTime;
	@JSONField(name: 'payment_time')
	late String paymentTime;
	@JSONField(name: 'delivery_time')
	late String deliveryTime;
	late int state;
	late String currency;
	late double total;
	late int tips;
	late double product;
	late List<OrderDetailProducts> products;

	OrderDetailEntity();

	factory OrderDetailEntity.fromJson(Map<String, dynamic> json) => $OrderDetailEntityFromJson(json);

	Map<String, dynamic> toJson() => $OrderDetailEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderDetailProducts {
	@JSONField(name: 'product_id')
	late String productId;
	@JSONField(name: 'product_name')
	late String productName;
	@JSONField(name: 'product_price')
	late double productPrice;
	@JSONField(name: 'product_currency_symbol')
	late String productCurrencySymbol;
	late int count;
	@JSONField(name: 'product_img')
	late String productImg;

	OrderDetailProducts();

	factory OrderDetailProducts.fromJson(Map<String, dynamic> json) => $OrderDetailProductsFromJson(json);

	Map<String, dynamic> toJson() => $OrderDetailProductsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}