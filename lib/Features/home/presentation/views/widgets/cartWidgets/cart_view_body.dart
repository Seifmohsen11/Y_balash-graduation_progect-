import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/Features/home/presentation/views/location_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/cartWidgets/app_bar_of_cart_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/cartWidgets/redeem_points_buttom.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/cartWidgets/list_of_cart_product.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/cartWidgets/order_summary.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/get_cart_summary_service.dart';
import 'package:y_balash/core/helper/show_snackbar.dart';
import 'package:y_balash/core/helper/swip_back_wrapper.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  int itemCount = 0;
  double totalItemsPrice = 0.0;
  double discount = 0.0;
  double importCharges = 0.0;
  double totalPrice = 0.0;

  bool isProductsLoaded = false;
  bool isCartNull = true;

  void refreshCart() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    updateOrderSummary();
  }

  void updateOrderSummary({bool usePoints = false}) async {
    try {
      final cartSummary = await getCartSummary(usePoints: usePoints);
      final cartData = cartSummary['cartSummary'];
      if (cartData != null) {
        print(cartData);
        if (!mounted) return;

        setState(() {
          itemCount = cartData['totalItems'] ?? 0;
          totalItemsPrice =
              double.tryParse(cartData['totalItemsPrice'] ?? '0') ?? 0;
          importCharges =
              double.tryParse(cartData['importCharges'] ?? '0') ?? 0;
          discount =
              double.tryParse(cartData['discountFromPoints'] ?? '0') ?? 0;
          totalPrice = double.tryParse(cartData['totalPrice'] ?? '0') ?? 0;
        });
        if (itemCount == 0) {
          setState(() {
            isCartNull = false;
          });
        }
      } else {
        print("No cart summary data found");
      }
    } catch (e) {
      print("Error fetching cart summary: $e");
      if (!mounted) return;

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SwipeBackWrapper(
      child: Scaffold(
        backgroundColor: kPrimaryColor,

        // ======= جسم الصفحة =========
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * (16 / 430)),
          child: Column(
            children: [
              SafeArea(
                bottom: false,
                child: AppBarOfCartView(
                  screenWidth: screenWidth,
                  iconImage: 'assets/icons/arrow.svg',
                  title: 'Cart',
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Expanded(
                child: ListOfCartProducts(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  onCartUpdated: refreshCart,
                  onProductsFetched: (_) {
                    updateOrderSummary();
                    setState(() => isProductsLoaded = true);
                  },
                ),
              ),
            ],
          ),
        ),

        // ======= الجزء اللي تحت =========
        bottomNavigationBar: isProductsLoaded && isCartNull
            ? Container(
                color: kPrimaryColor,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * (16 / 430),
                  vertical: 12.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RedeemPointsButtom(
                      onPointsRedeemed: (usePoints) {
                        updateOrderSummary(usePoints: usePoints);
                        showSnackBar(context, 'Points redeemed successfully!',
                            backgroundColor: Colors.green);
                      },
                    ),
                    SizedBox(height: 8.h),
                    OrderSummary(
                      itemCount: itemCount,
                      totalPrice: totalItemsPrice,
                      grandTotal: totalPrice,
                      discount: discount,
                      importCharges: importCharges,
                    ),
                    SizedBox(height: 8.h),
                    CustomButtom(
                      label: 'Check Out',
                      height: screenHeight * (57 / 932),
                      width: screenWidth * (398 / 430),
                      backgorundColor: kTextFieldAndButtomColor,
                      textColor: Colors.white,
                      borderColor: kTextFieldAndButtomColor,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          LocationView.id,
                          arguments: totalPrice,
                        );
                      },
                      borderRadiusSize: screenWidth * (14 / 430),
                    ),
                  ],
                ),
              )
            : null,
      ),
    );
  }
}
