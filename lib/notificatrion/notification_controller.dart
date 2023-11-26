import 'package:doctor_app/notificatrion/count_model.dart';
import 'package:get/get.dart';

import 'notification_repo.dart';

class NotificationController extends GetxController{


  var count = Count().obs;
   Notifcationrepo  repo = Notifcationrepo();
  getData()async{
    var api = await  repo.getData();
    count.value = api!;
    update();

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }


}