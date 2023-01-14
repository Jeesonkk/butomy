import 'package:butomy/app/data/Models/home_screen_model.dart';
import 'package:butomy/app/data/rest_service.dart';

class ProductListApi {
  Future<HomeScreenModel> getProductList({String? from, String? to}) async {
    var response = await RestApiService().get(Uri.parse(
        '${Apis.baseUrl.toString()}${Apis.productlisturl.toString()}?business_type=1&page_id=351&user_id=367&offset=0&products_type=all&placeorder_type=all'));

    print(response);
    if (response.toString() !=
        "{status: error, response: {msg: No Records found}, code: 404}") {
      return HomeScreenModel.fromJson(response);
    } else {
      return response;
    }
  }
}
