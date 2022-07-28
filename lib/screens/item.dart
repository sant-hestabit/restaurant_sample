import 'package:flutter/material.dart';
import 'package:food_delivery/screens/order_now.dart';
import 'package:food_delivery/utils/custom_navigation.dart';
import 'package:food_delivery/utils/custom_widgets.dart';

class ItemScreen extends StatefulWidget {
  final image, title, price;
  const ItemScreen({Key? key, required this.image, required this.price, required this.title}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {

  dynamic h,w;

  bool star1 = false, star2 = false, star3 = false, star4 = false, star5 = false;

  int count = 1;

  quantityPicker(context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
                // height: h * 0.25,
              width: w,
              decoration: const BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(40))),
              padding: EdgeInsets.all(w * 0.03),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: h * 0.15,
                    width: w * 8,
                    child: Card(
                      elevation: 5,
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomWidgets().colorText('Dish Item ${index +1}', 16, Colors.black),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomWidgets().colorText('Quantity', 14, Colors.black),
                                  SizedBox(width: w * 0.2,),
                                  CustomWidgets().colorText('Price', 14, Colors.black),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: CustomWidgets().titleText(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(CustomPageRoute(child: const OrderNowScreen(), direction: AxisDirection.left));
            },
          )
        ],
      ),
      body: Container(
        height: h,
        width: w,
        margin: EdgeInsets.symmetric(horizontal: w * 0.03),
        child: Column(
          children: [
            Container(
              height: h * 0.3,
              width: w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('${widget.image}'),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(10)
              ),
            ),
            Container(
              height: h * 0.25,
              width: w,
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: CustomWidgets().colorText("Description", 16, Colors.black)),
            ),
            Container(
              height: h * 0.12,
              width: w,
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  CustomWidgets().colorText('User reviews', 14, Colors.black),
                  SizedBox(height: h * 0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: Icon(Icons.star, color: star1? Colors.orange : Colors.black),
                        onTap: () {
                          setState(() {
                            star1 = true;
                          });
                        },
                      ),
                      GestureDetector(
                        child: Icon(Icons.star, color: star2? Colors.orange : Colors.black),
                        onTap: () {
                          setState(() {
                            star1 = true;
                            star2 = true;
                          });
                        },
                      ),
                      GestureDetector(
                        child: Icon(Icons.star, color: star3? Colors.orange : Colors.black),
                        onTap: () {
                          setState(() {
                            star1 = true;
                            star2 = true;
                            star3 = true;
                          });
                        },
                      ),
                      GestureDetector(
                        child: Icon(Icons.star, color: star4? Colors.orange : Colors.black),
                        onTap: () {
                          setState(() {
                            star1 = true;
                            star2 = true;
                            star3 = true;
                            star4 = true;
                          });
                        },
                      ),
                      GestureDetector(
                        child: Icon(Icons.star, color: star5? Colors.orange : Colors.black),
                        onTap: () {
                          setState(() {
                            star1 = true;
                            star2 = true;
                            star3 = true;
                            star4 = true;
                            star5 = true;
                          });
                        },
                      )
                    ],
                  )
                ],
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: h * 0.15,
                  width: w * 0.45,
                  margin: const EdgeInsets.only(top: 5),
                  padding : const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: CustomWidgets().colorText('Quantity', 16, Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: w * 0.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 3.5, horizontal: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: CustomWidgets().text('-', 16)
                                  ),
                                  onTap: () {
                                    if(count > 0) {
                                      setState(() {
                                        count = count - 1;
                                      });
                                    }
                                  },
                                ),
                                CustomWidgets().colorText(count.toString(), 16, Colors.black),
                                GestureDetector(
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 3.5, horizontal: 8),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: CustomWidgets().text('+', 16)
                                  ),
                                  onTap: () {
                                    setState(() {
                                      count = count + 1;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      CustomWidgets().colorText('\u{20B9} ${widget.price * count}', 20, Colors.black)
                    ],
                  ),
                ),
                Container(
                  height: h * 0.12,
                  width: w * 0.45,
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    child: CustomWidgets().text('Add to cart', 15.0),
                    onPressed: () {
                      quantityPicker(context);
                    },
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
