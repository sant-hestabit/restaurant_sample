import 'package:flutter/material.dart';
import 'package:food_delivery/utils/custom_widgets.dart';
import 'package:food_delivery/utils/ktext_form_field.dart';

class OrderNowScreen extends StatefulWidget {
  const OrderNowScreen({Key? key}) : super(key: key);

  @override
  State<OrderNowScreen> createState() => _OrderNowScreenState();
}

class _OrderNowScreenState extends State<OrderNowScreen> {

  dynamic h,w;

  final formKey = GlobalKey<FormState>();

  TextEditingController destinyLocationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed:() {
            Navigator.pop(context);
          },
        ),
        title: CustomWidgets().titleText('Order Now'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: h,
          width: w,
          margin: EdgeInsets.all(w * 0.02),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  height:  h * 0.4,
                  width: w,
                  // color: Colors.orange[50],
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: h * 0.1,
                        width: w,
                        child: Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CustomWidgets().colorText('Dish Item ${index +1}', 14, Colors.black),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomWidgets().colorText('Item Quantity', 14, Colors.black),
                                    CustomWidgets().colorText('Total Price', 14, Colors.black),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                CustomTextFormField(
                  h: h * 0.06,
                  w: w * 8.0,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  hintText: 'Destination Location',
                  controller: destinyLocationController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Mandatory Fields";
                    }
                  },
                  prefixIcon: const Icon(Icons.location_on),
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                CustomTextFormField(
                  h: h * 0.06,
                  w: w * 8.0,
                  keyboardType: TextInputType.number,
                  inputAction: TextInputAction.done,
                  hintText: 'Phone Number',
                  controller: phoneNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Mandatory Fields";
                    }
                  },
                  prefixIcon: const Icon(Icons.phone),
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: h * 0.1,
                      width: w * 0.45,
                      decoration: BoxDecoration(
                        color: Colors.orange[100],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomWidgets().colorText('Payment', 16, Colors.black),
                          CustomWidgets().colorText('\u{20B9} 1000', 14, Colors.black)
                        ],
                      ),
                    ),
                    Container(
                      // height: h * 0.1,
                      width: w * 0.45,
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        child: CustomWidgets().text('Place Order', 15),
                        onPressed: () {
                          // if(formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Your order is placed successfully') ));
                          // }
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
