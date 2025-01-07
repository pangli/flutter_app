import 'package:flutter/cupertino.dart';
import '../model/base_model.dart';

class BaseViewModel<T extends BaseModel> extends ChangeNotifier {
  final T model;

  BaseViewModel(this.model);
}
