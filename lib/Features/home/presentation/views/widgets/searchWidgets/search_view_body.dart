import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:y_balash/Features/home/presentation/views/main_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/product_card.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/search_service.dart';
import 'package:y_balash/core/helper/is_product_favorite.dart';
import 'package:y_balash/core/helper/swip_back_wrapper.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 8.h),
            Expanded(
              child: SearchBarForSearchView(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchBarForSearchView extends StatefulWidget {
  const SearchBarForSearchView({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  State<SearchBarForSearchView> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<SearchBarForSearchView> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> searchResults = [];
  bool isLoading = false;

  late stt.SpeechToText _speech;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  Future<void> handleSearch(String pattern) async {
    if (pattern.length < 2) {
      setState(() {
        searchResults = [];
      });
      return;
    }

    setState(() {
      isLoading = true;
    });

    final results = await searchProductsByName(pattern);
    final favoriteIds = await getFavoriteIds();

    final updatedResults = results.map<Map<String, dynamic>>((product) {
      final isFav = favoriteIds.contains(product['_id']);
      return {
        ...product,
        'isFavorite': isFav,
      };
    }).toList();

    setState(() {
      searchResults = updatedResults;
      isLoading = false;
    });
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) {
          print('onStatus: $val');
          if (val == 'done' || val == 'notListening') {
            setState(() => _isListening = false);
            _speech.stop();
          }
        },
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) {
            setState(() {
              _controller.text = val.recognizedWords;
            });
            handleSearch(val.recognizedWords);
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SwipeBackWrapper(
      onSwipeBack: () {
        Navigator.popAndPushNamed(context, MainView.id);
      },
      child: CustomScrollView(
        slivers: [
          // Search Bar
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      height: widget.screenHeight * (53 / 932),
                      child: TextField(
                        controller: _controller,
                        onChanged: handleSearch,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: const Color(0xff8A8A8A),
                            fontSize: widget.screenWidth * (20 / 430),
                            fontFamily: kInriaSansFont,
                          ),
                          prefixIcon: Icon(Icons.search,
                              size: widget.screenWidth * (24 / 430)),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.close, size: 22.h),
                            onPressed: () {
                              _controller.clear();
                              setState(() {
                                searchResults = [];
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                widget.screenWidth * (32 / 430)),
                          ),
                          filled: true,
                          fillColor: kPrimaryColor,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: widget.screenHeight * (10 / 932),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    height: 50.h,
                    width: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(
                        _isListening ? Icons.mic : Icons.mic_none,
                        size: 22.sp,
                        color: Colors.black,
                      ),
                      onPressed: _listen,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 16.h)),

          // Search Results as Cards
          if (isLoading)
            SliverToBoxAdapter(
              child: Center(
                child: SpinKitThreeBounce(
                  color: Colors.blue,
                  size: 22.h,
                ),
              ),
            )
          else if (searchResults.isEmpty && _controller.text.length >= 2)
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'No Results',
                  style: TextStyle(
                      fontSize: 18.sp, color: kTextFieldAndButtomColor),
                ),
              ),
            )
          else
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final product = searchResults[index];
                    return ProductCard(
                      screenWidth: widget.screenWidth,
                      screenHeight: widget.screenHeight,
                      image: product['imageUrl'] ?? '',
                      title: product['name'] ?? 'No Name',
                      cafeName: product['restaurant']['name'] ?? 'UnKnown',
                      finalPrice:
                          product['discountedPrice']?.toString() ?? '0.00',
                      originalPrice: product['originalPrice']?.toString(),
                      id: product['_id'] ?? '0.00',
                      isFavorite: product['isFavorite'] ?? false,
                    );
                  },
                  childCount: searchResults.length,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  mainAxisExtent: 270.h,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
