import 'package:butomy/app/data/Models/home_screen_model.dart';
import 'package:butomy/app/data/home_module/productlist_provider.dart';

class Reposiry {
  final homepageproducts = ProductListApi();
  Future<HomeScreenModel> getproductlist() => homepageproducts.getProductList();
}
