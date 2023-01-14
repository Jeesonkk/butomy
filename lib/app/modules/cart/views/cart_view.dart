import 'package:butomy/app/modules/cart/views/cart_widget.dart';
import 'package:butomy/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final HomeController homectrl = Get.put(HomeController());
    return Scaffold(
        appBar: CartWidget().cartappBar(context),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.yellow,
          onPressed: () {
            if (homectrl.cartList.isNotEmpty) {
              Get.snackbar('Success', 'Your Order Place Successfully',
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                  snackPosition: SnackPosition.BOTTOM);

              homectrl.addToCart(
                  productname: '',
                  productimage: '',
                  producttype: '',
                  productprice: '0',
                  productqty: '0',
                  productid: '');
              homectrl.cartList.clear();
              homectrl.itemqty(0);
              Navigator.pop(context);
            }
          },
          label: Text(
            'Place Order',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CartWidget().CartProductWidget(
                      cartlist: homectrl.cartList,
                      onminimiseqty: () {},
                      onaddqty: () {}),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Bill Details',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CartWidget().billDetails(cartlist: homectrl.cartList),
                )
              ],
            )));
  }
}
