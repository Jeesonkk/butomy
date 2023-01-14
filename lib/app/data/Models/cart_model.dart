class CartProduct {
  final String productname;
  final String productimage;
  final String producttype;
  final String productprice;
  String productqty;
  final String productid;
  CartProduct(
      {required this.productname,
      required this.productimage,
      required this.producttype,
      required this.productqty,
      required this.productprice,
      required this.productid});
}
