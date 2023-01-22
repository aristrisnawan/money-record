import 'package:get/get.dart';
import 'package:money_record/data/model/user.dart';

class CUser extends GetxController{
  final _data = User().obs;
  //Getter
  User get data => _data.value;
  setData(n) => _data.value = n; 
}