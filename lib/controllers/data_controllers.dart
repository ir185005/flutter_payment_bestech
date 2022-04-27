import 'package:flutter_payment_bestech/services/data_services.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  var list = [].obs;
  final service = DataServices();
  var _loading = false.obs;

  get loading {
    return _loading.value;
  }

  get newList {
    return list.where((e) => e['status']).map((e) => e).toList();
  }

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  _loadData() async {
    _loading.value = false;
    try {
      var info = await service.getUsers();
      list.addAll(info);
    } catch (e) {
      print('Error occurred!');
      print(e);
    } finally {
      _loading.value = true;
    }
  }
}
