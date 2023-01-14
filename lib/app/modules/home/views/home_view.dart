import 'package:butomy/app/modules/cart/views/cart_view.dart';
import 'package:butomy/app/modules/home/views/home_view_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final HomeController homectrl = Get.put(HomeController());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: HomePageWidgets()
            .searchAppBar(leadingonpress: () => Navigator.pop(context)),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: () {},
          label: Row(
            children: [Icon(Icons.menu), Text('Brows Menu')],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomSheet: BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Obx(() => homectrl.cartList.isNotEmpty
                  ? Container(
                      height: 60,
                      padding: EdgeInsets.only(top: 20),
                      color: Colors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text(
                                homectrl.cartList.length.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Items',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          InkWell(
                            child: Row(
                              children: [
                                Text(
                                  'AddToCart',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.shopping_cart_checkout,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartView()));
                            },
                          )
                        ],
                      ),
                    )
                  : SizedBox());
            }),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: HomePageWidgets().restaurantDetailsCard(
                      restaurantname: 'Taza Kitchen',
                      restaurantimag: 'assets/restaurant.jpeg',
                      place: 'From Peyad',
                      address:
                          'Member since Aug 16,2021\nFSSAINO:21321137000400'),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: HomePageWidgets().PostandFollowerCard(),
                ),
                HomePageWidgets().tabSection(context)
              ],
            ),
          ),
        ));
  }
}
