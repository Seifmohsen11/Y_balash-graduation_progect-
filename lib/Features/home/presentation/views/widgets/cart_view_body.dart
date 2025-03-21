import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/coupon_input_field.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/list_of_cart_product.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/order_summary.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  int itemCount = 0;
  double totalPrice = 0.0;

  void updateOrderSummary(List<dynamic> products) {
    setState(() {
      itemCount = products.length;
      totalPrice = products.fold(0.0, (sum, item) {
        double price = double.tryParse((item['itemId']['price'] ?? '0')
                .toString()
                .replaceAll(RegExp(r'[^0-9.]'), '')) ??
            0.0;

        int quantity = item['quantity'] ?? 1;
        return sum + (price * quantity);
      });
    });
  }

  void refreshCart() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * (16 / 430)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * (42 / 932),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const ImageIcon(
                    AssetImage('assets/icons/Arrow.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * (10 / 430),
                      right: screenWidth * (10 / 430)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cart',
                        style: TextStyle(
                            fontSize: screenWidth * (36 / 430),
                            fontFamily: kAbyssinicaSIL,
                            color: kTextFieldAndButtomColor),
                      ),
                    ],
                  ),
                ),
                ListOfCartProducts(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  onCartUpdated: refreshCart,
                  onProductsFetched: updateOrderSummary,
                ),
                SizedBox(
                  height: screenHeight * (8 / 932),
                ),
                if (itemCount > 0) ...[
                  const CouponInputField(),
                  SizedBox(
                    height: screenHeight * (8 / 932),
                  ),
                  OrderSummary(
                    itemCount: itemCount,
                    totalPrice: totalPrice,
                    shipping: 50,
                  ),
                  SizedBox(
                    height: screenHeight * (8 / 932),
                  ),
                  CustomButtom(
                    label: 'Check Out',
                    height: screenHeight * (57 / 932),
                    width: screenWidth * (398 / 430),
                    backgorundColor: kTextFieldAndButtomColor,
                    textColor: Colors.white,
                    borderColor: kTextFieldAndButtomColor,
                    onTap: () {},
                    borderRadiusSize: screenWidth * (14 / 430),
                  ),
                ]
              ],
            ),
          ),
        ));
  }
}
