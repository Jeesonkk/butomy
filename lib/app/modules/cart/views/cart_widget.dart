import 'package:butomy/app/data/Models/cart_model.dart';
import 'package:butomy/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartWidget {
  AppBar cartappBar(BuildContext context) {
    final HomeController homectrl = Get.put(HomeController());
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          )),
      title: const Text(
        'My Cart',
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 20,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey, width: 0.8)),
            child: InkWell(
              child: Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                  Text(
                    'Clear Cart',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
              onTap: () {
                homectrl.addToCart(
                    productname: '',
                    productimage: '',
                    producttype: '',
                    productprice: '0',
                    productqty: '0',
                    productid: '');
                homectrl.cartList.clear();
                homectrl.itemqty(0);
              },
            ),
          ),
        )
      ],
    );
  }

  Widget CartProductWidget({
    required List<CartProduct> cartlist,
  }) {
    final HomeController homectrl = Get.put(HomeController());
    return cartlist.isNotEmpty
        ? Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: .7, color: Colors.grey)),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: cartlist.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      cartlist[index].producttype.toString() == '1'
                          ? Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/veg.png'))),
                            )
                          : Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/non_veg.jpg'))),
                            ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 20,
                              width: 200,
                              child: Text(
                                cartlist[index].productname,
                                overflow: TextOverflow.ellipsis,
                              )),
                          Text('₹ ${cartlist[index].productprice}')
                        ],
                      ),
                      Card(
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  if (homectrl.idex.value >= 0) {
                                    homectrl.removeQty(
                                        productname: homectrl
                                            .cartList[index].productname,
                                        productimage: homectrl
                                            .cartList[index].productimage,
                                        producttype: homectrl
                                            .cartList[index].producttype,
                                        productprice: homectrl
                                            .cartList[index].productprice,
                                        productqty:
                                            homectrl.cartList[index].productqty,
                                        productid:
                                            homectrl.cartList[index].productid);
                                  }
                                }),
                            Text(cartlist[index].productqty.toString()),
                            IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  if (homectrl.idex.value >= 0) {
                                    homectrl.idex(homectrl.cartList.indexWhere(
                                        (element) =>
                                            (element.productname).toString() ==
                                            (cartlist[index].productname)
                                                .toString()));
                                  }
                                  print(index);
                                  homectrl.addToCart(
                                      productid: (cartlist[index].productid)
                                          .toString(),
                                      productname: (cartlist[index].productname)
                                          .toString(),
                                      productimage:
                                          (cartlist[index].productimage)
                                              .toString(),
                                      producttype: (cartlist[index].producttype)
                                          .toString(),
                                      productprice:
                                          (cartlist[index].productprice)
                                              .toString(),
                                      productqty:
                                          homectrl.itemqty.value.toString());
                                })
                          ],
                        ),
                      ),
                      Text((int.parse(cartlist[index].productqty) *
                              int.parse(cartlist[index].productprice))
                          .toString())
                    ],
                  );
                }),
          )
        : SizedBox();
  }

  Widget billDetails({required List<CartProduct> cartlist}) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: .7, color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Item Total :'),
              SizedBox(
                height: 10,
              ),
              Text('Taxes & Charges :'),
              SizedBox(
                height: 10,
              ),
              Text(
                'GRAND TOTAL :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  '₹ ${cartlist.fold('0', (previousValue, element) => (int.parse(previousValue) + (int.parse(element.productprice) * int.parse(element.productqty))).toString())}'),
              SizedBox(
                height: 10,
              ),
              Text('₹ 0.0'),
              SizedBox(
                height: 10,
              ),
              Text(
                  '₹ ${cartlist.fold('0', (previousValue, element) => (((int.parse(previousValue) + (int.parse(element.productprice) * int.parse(element.productqty)))).round()).toString())}')
            ],
          )
        ],
      ),
    );
  }
}
