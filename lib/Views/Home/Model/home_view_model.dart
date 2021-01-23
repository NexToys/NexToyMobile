import 'package:flutter/material.dart';
import '../../Service/toys_service.dart';
import '../../Detail/View/detail_view.dart';
import '../../../Core/Base/base_view_model.dart';
import '../../../Core/Network/Response/response_model.dart';
import '../Model/toyModel.dart';

class HomeViewModel extends BaseViewModel {
  Future<ResponseModel<Toy>> toy;
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  ScrollController _scrollCont = ScrollController();

  @override
  void init() {}

  GlobalKey<ScaffoldState> get globalKey => _globalKey;
  ScrollController get scrollController => _scrollCont;

  void toys() {
    toy = ToyService().fetchToys();
  }

  void navigateToDetailPage(Toy toy) {
    navigator.navigateTo(DetailView(
      toy: toy,
    ));
  }
}
