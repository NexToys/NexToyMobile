import '../../Core/Network/Response/response_model.dart';
import '../../Core/Network/network_service.dart';
import '../../Views/Home/Model/toyModel.dart';

class ToyService {
  static const _baseUrl = "http://localhost:3000/api/";

  final networkService = NetworkService.instance;
  Future<ResponseModel<Toy>> fetchToys() async {
    ResponseModel<Toy> fetchtoys = await NetworkService.instance
        .httpGet<Toy>(url: "${_baseUrl}toys", model: Toy());
    return fetchtoys;
  }
}
