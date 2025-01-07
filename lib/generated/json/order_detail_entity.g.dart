import 'package:flutter_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_app/kp/bean/order_detail_entity.dart';

OrderDetailEntity $OrderDetailEntityFromJson(Map<String, dynamic> json) {
  final OrderDetailEntity orderDetailEntity = OrderDetailEntity();
  final String? orderId = jsonConvert.convert<String>(json['order_id']);
  if (orderId != null) {
    orderDetailEntity.orderId = orderId;
  }
  final String? serialId = jsonConvert.convert<String>(json['serial_id']);
  if (serialId != null) {
    orderDetailEntity.serialId = serialId;
  }
  final String? createTime = jsonConvert.convert<String>(json['create_time']);
  if (createTime != null) {
    orderDetailEntity.createTime = createTime;
  }
  final String? paymentTime = jsonConvert.convert<String>(json['payment_time']);
  if (paymentTime != null) {
    orderDetailEntity.paymentTime = paymentTime;
  }
  final String? deliveryTime = jsonConvert.convert<String>(
      json['delivery_time']);
  if (deliveryTime != null) {
    orderDetailEntity.deliveryTime = deliveryTime;
  }
  final int? state = jsonConvert.convert<int>(json['state']);
  if (state != null) {
    orderDetailEntity.state = state;
  }
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    orderDetailEntity.currency = currency;
  }
  final double? total = jsonConvert.convert<double>(json['total']);
  if (total != null) {
    orderDetailEntity.total = total;
  }
  final int? tips = jsonConvert.convert<int>(json['tips']);
  if (tips != null) {
    orderDetailEntity.tips = tips;
  }
  final double? product = jsonConvert.convert<double>(json['product']);
  if (product != null) {
    orderDetailEntity.product = product;
  }
  final List<OrderDetailProducts>? products = (json['products'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<OrderDetailProducts>(e) as OrderDetailProducts)
      .toList();
  if (products != null) {
    orderDetailEntity.products = products;
  }
  return orderDetailEntity;
}

Map<String, dynamic> $OrderDetailEntityToJson(OrderDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['order_id'] = entity.orderId;
  data['serial_id'] = entity.serialId;
  data['create_time'] = entity.createTime;
  data['payment_time'] = entity.paymentTime;
  data['delivery_time'] = entity.deliveryTime;
  data['state'] = entity.state;
  data['currency'] = entity.currency;
  data['total'] = entity.total;
  data['tips'] = entity.tips;
  data['product'] = entity.product;
  data['products'] = entity.products.map((v) => v.toJson()).toList();
  return data;
}

extension OrderDetailEntityExtension on OrderDetailEntity {
  OrderDetailEntity copyWith({
    String? orderId,
    String? serialId,
    String? createTime,
    String? paymentTime,
    String? deliveryTime,
    int? state,
    String? currency,
    double? total,
    int? tips,
    double? product,
    List<OrderDetailProducts>? products,
  }) {
    return OrderDetailEntity()
      ..orderId = orderId ?? this.orderId
      ..serialId = serialId ?? this.serialId
      ..createTime = createTime ?? this.createTime
      ..paymentTime = paymentTime ?? this.paymentTime
      ..deliveryTime = deliveryTime ?? this.deliveryTime
      ..state = state ?? this.state
      ..currency = currency ?? this.currency
      ..total = total ?? this.total
      ..tips = tips ?? this.tips
      ..product = product ?? this.product
      ..products = products ?? this.products;
  }
}

OrderDetailProducts $OrderDetailProductsFromJson(Map<String, dynamic> json) {
  final OrderDetailProducts orderDetailProducts = OrderDetailProducts();
  final String? productId = jsonConvert.convert<String>(json['product_id']);
  if (productId != null) {
    orderDetailProducts.productId = productId;
  }
  final String? productName = jsonConvert.convert<String>(json['product_name']);
  if (productName != null) {
    orderDetailProducts.productName = productName;
  }
  final double? productPrice = jsonConvert.convert<double>(
      json['product_price']);
  if (productPrice != null) {
    orderDetailProducts.productPrice = productPrice;
  }
  final String? productCurrencySymbol = jsonConvert.convert<String>(
      json['product_currency_symbol']);
  if (productCurrencySymbol != null) {
    orderDetailProducts.productCurrencySymbol = productCurrencySymbol;
  }
  final int? count = jsonConvert.convert<int>(json['count']);
  if (count != null) {
    orderDetailProducts.count = count;
  }
  final String? productImg = jsonConvert.convert<String>(json['product_img']);
  if (productImg != null) {
    orderDetailProducts.productImg = productImg;
  }
  return orderDetailProducts;
}

Map<String, dynamic> $OrderDetailProductsToJson(OrderDetailProducts entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['product_id'] = entity.productId;
  data['product_name'] = entity.productName;
  data['product_price'] = entity.productPrice;
  data['product_currency_symbol'] = entity.productCurrencySymbol;
  data['count'] = entity.count;
  data['product_img'] = entity.productImg;
  return data;
}

extension OrderDetailProductsExtension on OrderDetailProducts {
  OrderDetailProducts copyWith({
    String? productId,
    String? productName,
    double? productPrice,
    String? productCurrencySymbol,
    int? count,
    String? productImg,
  }) {
    return OrderDetailProducts()
      ..productId = productId ?? this.productId
      ..productName = productName ?? this.productName
      ..productPrice = productPrice ?? this.productPrice
      ..productCurrencySymbol = productCurrencySymbol ??
          this.productCurrencySymbol
      ..count = count ?? this.count
      ..productImg = productImg ?? this.productImg;
  }
}