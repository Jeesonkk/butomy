import 'package:butomy/app/data/Models/home_screen_model.dart';
import 'package:butomy/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePageWidgets {
  AppBar searchAppBar({required Function() leadingonpress}) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: leadingonpress,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          )),
      title: TextFormField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search Dish',
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            )),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              color: Colors.black,
            ))
      ],
    );
  }

  Widget restaurantDetailsCard(
      {required String restaurantimag,
      required String restaurantname,
      required String place,
      required String address}) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(
                    restaurantimag,
                  ),
                  fit: BoxFit.fill)),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurantname,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              place,
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black38,
                  fontSize: 14),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              address,
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black38,
                  fontSize: 14),
              maxLines: 2,
            ),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Know more',
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
            )
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              padding: const EdgeInsets.all(5),
              child: Row(
                children: const [
                  Icon(
                    Icons.person_add,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('follow',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 14))
                ],
              ),
            ),
            Row(
              children: const [
                Text('4.6'),
                SizedBox(
                  width: 7,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                )
              ],
            )
          ],
        )
      ],
    );
  }

  Widget PostandFollowerCard() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text(
                  '14',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Post',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  '37',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Followers',
                  style: TextStyle(fontSize: 16),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget tabSection(BuildContext context) {
    final HomeController homectrl = Get.put(HomeController());
    return DefaultTabController(
      length: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: TabBar(
                indicator: SolidIndicator(),
                indicatorColor: Colors.white,
                controller: homectrl.tabController,
                tabs: [
                  tab(
                      icon: Icon(
                        Icons.wallet,
                        color: Colors.black,
                      ),
                      icontext: 'Wall'),
                  tab(
                      icon: Icon(
                        Icons.food_bank,
                        color: Colors.black,
                      ),
                      icontext: 'Menu'),
                  tab(
                      icon: Icon(
                        Icons.video_call,
                        color: Colors.black,
                      ),
                      icontext: 'Videos'),
                  tab(
                      icon: Icon(
                        Icons.star,
                        color: Colors.black,
                      ),
                      icontext: 'Reviews'),
                  tab(
                      icon: Icon(
                        Icons.note_add,
                        color: Colors.black,
                      ),
                      icontext: 'Blog')
                ]),
          ),
          Divider(
            color: Colors.grey,
            height: 10,
            thickness: 5,
          ),
          Container(
            //Add this to give height
            height: MediaQuery.of(context).size.height,
            child: TabBarView(controller: homectrl.tabController, children: [
              Container(),
              tabBarPage(),
              Container(),
              Container(),
              Container(),
            ]),
          ),
        ],
      ),
    );
  }

  Tab tab({required Icon icon, required String icontext}) {
    return Tab(
      height: 100,
      child: Container(
        height: 80,
        width: 100,
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            icon,
            SizedBox(
              height: 10,
            ),
            Text(
              icontext,
              style: TextStyle(color: Colors.black, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }

  Widget tabBarPage() {
    final HomeController homectrl = Get.put(HomeController());
    List<Widget> productlist = [];
    return Obx(() => Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        producttypefilter(producttype: 'Veg'),
                        SizedBox(
                          width: 10,
                        ),
                        producttypefilter(producttype: 'Non Veg')
                      ],
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 6, bottom: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.yellow,
                            ),
                            child: Text(
                              'All',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              'Buy Now',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              'Pre Order',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: homectrl.homemodelproductsmodel.value.data != null
                      ? homectrl.homemodelproductsmodel.value.data!.length
                      : 0,
                  itemBuilder: (context, index) {
                    return expansionTile(
                      title: (homectrl.homemodelproductsmodel.value.data?[index]
                              ?.categoryName)
                          .toString(),
                      productlist:
                          homectrl.homemodelproductsmodel.value.data?[index],
                      index: index,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      thickness: 5,
                      color: Colors.grey,
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }

  Widget producttypefilter(
      {Function(bool)? onChanged, required String producttype}) {
    return Row(
      children: [
        Text(
          producttype,
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
            height: 30,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                border: Border.all(color: Colors.green, width: 1)),
            child: Switch(
                activeColor: Colors.green, value: true, onChanged: onChanged))
      ],
    );
  }

  Widget expansionTile(
      {required String title,
      required Datum? productlist,
      required int index}) {
    final HomeController homectrl = Get.put(HomeController());
    List<Widget> productlistwidget = [];

    productlist?.products
        ?.map((e) => productlistwidget.add(product(
              percentage: '0',
              productname: (e?.kitchenItemName).toString(),
              vegornonvegicon: (e?.productsType).toString() == '1'
                  ? 'assets/veg.png'
                  : 'assets/non_veg.jpg',
              actualprice: (e?.kitchenItemAmount).toString(),
              discountprice: (e?.itemDiscountPrice).toString(),
              restaurantimag: (e?.kitchenItemImage?[0]?.images).toString(),
              onaddqty: () {
                if (homectrl.idex.value >= 0) {
                  homectrl.idex(productlist.products!.indexWhere((element) =>
                      (element?.kitchenItemName).toString() ==
                      (e?.kitchenItemName).toString()));
                }
                print(index);
                homectrl.addToCart(
                    productid: (e?.kitchenItemId).toString(),
                    productname: (e?.kitchenItemName).toString(),
                    productimage: (e?.kitchenItemImage?[0]?.images).toString(),
                    producttype: (e?.productsType).toString(),
                    productprice: (e?.itemDiscountPrice).toString(),
                    productqty: homectrl.itemqty.value.toString());
              },
              onminiseqty: () {
                if (homectrl.idex.value >= 0) {
                  homectrl.idex(productlist.products!.indexWhere((element) =>
                      (element?.kitchenItemName).toString() ==
                      (e?.kitchenItemName).toString()));
                  print(e!.kitchenItemName.toString());
                }

                if (homectrl.cartList.isNotEmpty) {
                  final index = homectrl.cartList.indexWhere(
                      (element) => element.productname == e?.kitchenItemName);
                  var matchinglist = homectrl.cartList.firstWhere((element) =>
                      (element.productname).toString() ==
                      (e?.kitchenItemName).toString());
                  homectrl.removeQty(
                      productname: homectrl.cartList[index].productname,
                      productimage: homectrl.cartList[index].productimage,
                      producttype: homectrl.cartList[index].producttype,
                      productprice: homectrl.cartList[index].productprice,
                      productqty: homectrl.cartList[index].productqty,
                      productid: homectrl.cartList[index].productid);
                }
              },
              itemqty: homectrl.cartList.isNotEmpty
                  ? homectrl.cartList[index].productqty
                  : '0',
              index: index,
              products: productlist.products,
            )))
        .toList();
    return ExpansionTile(
      controlAffinity: ListTileControlAffinity.trailing,
      childrenPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      expandedCrossAxisAlignment: CrossAxisAlignment.end,
      maintainState: true,
      collapsedTextColor: Colors.black,
      title: Text(title),
      // contents
      children: productlistwidget,
    );
  }

  Widget product(
      {required String percentage,
      required String productname,
      required String vegornonvegicon,
      required String actualprice,
      required String discountprice,
      required String restaurantimag,
      required String itemqty,
      required Function() onaddqty,
      required Function() onminiseqty,
      required int index,
      required List<Product?>? products}) {
    final HomeController homectrl = Get.put(HomeController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Text(
                "$percentage% OFF",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage(vegornonvegicon))),
                ),
                Container(
                  height: 20,
                  width: 200,
                  child: Text(
                    productname,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Text(
              '( min 1 qty)',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Row(
              children: [
                Text(
                  '₹ $actualprice  ',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough),
                ),
                Text(
                  '₹$discountprice',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(
                        restaurantimag,
                      ),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 5,
            ),
            Card(
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                        icon: new Icon(Icons.remove), onPressed: onminiseqty),
                    Obx(() => Text(
                          homectrl.cartList.isNotEmpty
                              ? homectrl.cartList
                                  .firstWhere(
                                      (element) =>
                                          element.productname == productname,
                                      orElse: () =>
                                          homectrl.deafaultcartlist[0])
                                  .productqty
                                  .toString()
                              : '0',
                          style: TextStyle(fontSize: 10),
                        )),
                    IconButton(icon: new Icon(Icons.add), onPressed: onaddqty)
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

/// Solid tab bar indicator.
class SolidIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _SolidIndicatorPainter(this, onChanged!);
  }
}

class _SolidIndicatorPainter extends BoxPainter {
  final SolidIndicator decoration;

  _SolidIndicatorPainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);

    final Rect rect = offset & configuration.size!;
    final Paint paint = Paint();
    paint.color = Colors.yellow;
    paint.style = PaintingStyle.fill;
    canvas.drawRect(rect, paint);
  }
}
