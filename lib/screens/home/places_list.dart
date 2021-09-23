import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/apps_controllers.dart';
import 'package:trip_pal_null_safe/controllers/model_list_view_controller.dart';
import 'package:trip_pal_null_safe/models/abstract_model.dart';
import 'package:trip_pal_null_safe/models/hotel.dart';
import 'package:trip_pal_null_safe/services/api_view.dart';
import 'package:trip_pal_null_safe/services/backend_service.dart';
import 'package:trip_pal_null_safe/widgets/extendable/model_view.dart';
import 'package:trip_pal_null_safe/widgets/simple/dbplace_card.dart';

class PlacesDBListController extends HotelsViewController {
  @override
  ApiView<Place> get api =>
      Get.find<BackendService>().getApiView(name: 'places');
}

class PlacesDBList extends IModelView {
  @override
  // TODO: implement controller
  IModelViewController<IModel> get controller =>
      Get.find<PlacesDBListController>();

  @override
  Widget buildViewTile(int index, IModel model, BuildContext context) {
    return DBPlaceCard(
      place: model as Place,
    );
  }

  @override
  IconData get tileIcon => Icons.map;

  @override
  String get title => 'Places List';
}
