import 'package:flutter/material.dart';
import 'package:food_delivery/screens/item.dart';
import 'package:food_delivery/utils/custom_navigation.dart';
import 'package:food_delivery/utils/custom_widgets.dart';

class MenuListScreen extends StatefulWidget {
  final type,image;
  const MenuListScreen({Key? key,required this.type, required this.image}) : super(key: key);

  @override
  State<MenuListScreen> createState() => _MenuListScreenState();
}

class _MenuListScreenState extends State<MenuListScreen> {
  
  dynamic h, w;

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
        title: CustomWidgets().titleText(widget.type),
        centerTitle: true,
      ),
      body: Container(
        height: h,
        width: w,
        margin: EdgeInsets.symmetric(horizontal: w * 0.03),
        child: ListView.builder(
          itemCount: 15,
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
                                  image: AssetImage(widget.image),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          width: w * 0.02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomWidgets().colorText(
                                '${widget.type} dish ${index + 1}',
                                18,
                                Theme.of(context).primaryColor),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                SizedBox(width: w * 0.05,),
                                CustomWidgets().colorText("\u{20B9}150", 16,
                                    Theme.of(context).primaryColor),

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
                Navigator.of(context).push(CustomPageRoute(child: ItemScreen(
                    title: '${widget.type} dish ${index + 1}', image: widget.image, price:150
                ), direction: AxisDirection.left ));
              },
            );
          },
        ),
      ),

    );
  }
}
