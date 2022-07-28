import 'package:flutter/material.dart';
import 'package:food_delivery/screens/menu_list.dart';
import 'package:food_delivery/utils/custom_navigation.dart';
import 'package:food_delivery/utils/custom_widgets.dart';
import 'item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<String> categoriesList = [
    'Indian',
    'South Indian',
    'Chinese',
    'Italian'
  ];
  List<String> categoryImageList = [
    'assets/indian_food.jpg',
    'assets/southdish.jpg',
    'assets/chinese-food.jpg',
    'assets/italian_food.jpg'
  ];

  List<String> specialItemList = [
    'Shakes',
    'Burger',
    'Noodles',
    'Cocktails',
    'Samosas',
    'Pizza'
  ];
  List<String> specialImageList = [
    'assets/shakes.jpg',
    'assets/burger.jpg',
    'assets/noodles.jpeg',
    'assets/cocktails.jpg',
    'assets/samosa.jpg',
    'assets/italian_food.jpg'
  ];

  dynamic h, w;

  int position2 = 1;
  int position1 = 1;
  AnimationController? _animationController1;
  AnimationController? _animationController2;
  Animation? _animation1;
  Animation? _animation2;

  @override
  void initState() {
    super.initState();
    _animationController2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 7));
    _animationController1 =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _animation1 = CurvedAnimation(
        parent: _animationController1!, curve: Curves.easeInOut);
    _animation2 = CurvedAnimation(
        parent: _animationController2!, curve: Curves.easeInOut);
    _animationController2!.forward();
    _animationController1!.forward();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: h,
            width: w,
            margin: EdgeInsets.all(w * 0.03),
            child: Column(
              children: [
                Row(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          child: Container(
                            height: h * 0.06,
                            width: w * 0.12,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.5),
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                              child: Icon(Icons.person,
                                  size: 35, color: Colors.grey),
                            ),
                          ),
                          onTap: () {},
                        )),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    CustomWidgets().titleText('Welcome Username'),
                  ],
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: CustomWidgets().colorText(
                        'Categories', 18, Theme.of(context).primaryColor)),
                Container(
                  height: h * 0.25,
                  width: w * 8.0,
                  margin: EdgeInsets.symmetric(vertical: w * 0.01),
                  child: AnimatedBuilder(
                      animation: _animation1!,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(
                              250 *
                                  position1.toDouble() *
                                  (1 - _animation1!.value),
                              0),
                          child: Opacity(
                            opacity: _animation1!.value,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                    vertical: w * 0.035, horizontal: w * 0.02),
                                itemCount: categoryImageList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: h * 0.15,
                                          width: w * 0.3,
                                          margin:
                                              EdgeInsets.only(right: w * 0.02),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      categoryImageList[index]),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10))),
                                        ),
                                        Container(
                                            height: h * 0.06,
                                            width: w * 0.3,
                                            margin: EdgeInsets.only(
                                                right: w * 0.02),
                                            decoration: BoxDecoration(
                                                color: Colors.orange[300],
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10))),
                                            child: Center(
                                              child: CustomWidgets().colorText(
                                                  categoriesList[index],
                                                  15,
                                                  Colors.white),
                                            ))
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MenuListScreen(
                                                      type:
                                                          categoriesList[index],
                                                      image: categoryImageList[
                                                          index])));
                                    },
                                  );
                                }),
                          ),
                        );
                      }),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomWidgets().colorText(
                      'Special Items', 18, Theme.of(context).primaryColor),
                ),
                Container(
                  height: h * 0.48,
                  width: w,
                  margin: EdgeInsets.symmetric(vertical: w * 0.01),
                  // color: Colors.orange[100],
                  child: AnimatedBuilder(
                      animation: _animation2!,
                      builder: (context, child) {
                        return Transform.translate(
                            offset: Offset(
                                0,
                                300 *
                                    position2.toDouble() *
                                    (1 - _animation2!.value)),
                            child: Opacity(
                              opacity: _animation2!.value,
                              child: ListView.builder(
                                itemCount: specialItemList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    child: SizedBox(
                                      height: h * 0.12,
                                      width: w,
                                      child: Card(
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: h * 0.09,
                                                width: w * 0.22,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            specialImageList[
                                                                index]),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                              ),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomWidgets().colorText(
                                                      specialItemList[index],
                                                      18,
                                                      Theme.of(context)
                                                          .primaryColor),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: const [
                                                          Icon(
                                                            Icons.star,
                                                            size: 14,
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            size: 14,
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            size: 14,
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            size: 14,
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            size: 14,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(width: w * 0.1),
                                                      CustomWidgets().colorText(
                                                          "\u{20B9}250",
                                                          16,
                                                          Theme.of(context)
                                                              .primaryColor),
                                                      SizedBox(width: w * 0.05),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          CustomPageRoute(
                                              child: ItemScreen(
                                                  title: specialItemList[index],
                                                  image:
                                                      specialImageList[index],
                                                  price: 250),
                                              direction: AxisDirection.left));
                                    },
                                  );
                                },
                              ),
                            ));
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController2!.dispose();
    _animationController1!.dispose();
  }
}
