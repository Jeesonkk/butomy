import 'package:butomy/app/data/Models/cart_model.dart';
import 'package:butomy/app/data/Models/home_screen_model.dart';
import 'package:butomy/app/data/home_module/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement HomeController
  final homemodelproductsmodel = HomeScreenModel().obs;
  final productlsititems = <Product?>[].obs;
  final cartList = <CartProduct>[].obs;
  final itemqty = 0.obs;
  late TabController tabController;
  final idex = 0.obs;
  final deafaultcartlist = <CartProduct>[];
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 5, initialIndex: 1);
    productlist();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void productlist() async {
    try {
      var resp = await Reposiry().getproductlist();
      print(resp);
      if (resp.status == "200") {
        homemodelproductsmodel(resp);
      }
    } catch (e) {
      Get.snackbar('Error', "Something Went Wrong");
    }
  }

  void addquatity() {}

  void addToCart(
      {required String productname,
      required String productimage,
      required String producttype,
      required String productprice,
      required String productqty,
      required String productid}) {
    if (cartList.isEmpty) {
      deafaultcartlist.add(CartProduct(
          productname: '',
          productimage: '',
          productprice: '',
          productqty: '0',
          producttype: '',
          productid: ''));
      cartList.add(CartProduct(
          productname: productname,
          productimage: productimage,
          productprice: productprice,
          productqty: '1',
          producttype: producttype,
          productid: productid));
    } else {
      final index =
          cartList.indexWhere((element) => element.productname == productname);
      if (index != -1) {
        if (cartList[index].productname == productname) {
          cartList[index] = CartProduct(
              productname: cartList[index].productname,
              productimage: cartList[index].productimage,
              productprice: cartList[index].productprice,
              productqty:
                  (int.parse(cartList[index].productqty) + 1).toString(),
              producttype: cartList[index].producttype,
              productid: cartList[index].productid);
        }
      } else {
        cartList.add(CartProduct(
            productname: productname,
            productimage: productimage,
            productprice: productprice,
            productqty: '1',
            producttype: producttype,
            productid: productid));
      }
    }
  }
}
