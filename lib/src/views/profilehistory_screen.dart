import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceHistoryScreen extends StatelessWidget {
  const PriceHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: Get.height*0.08,
            backgroundColor: Colors.green,
            //Color(0xff1ECB8D),
            elevation: 1.0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios, size: 20,),
              color: Colors.white,
            ),
            //centerTitle: true,
            title: Text('Price History',
              style: TextStyle(color: Colors.white, fontSize: 18),),
          ),
          body: Column(
            children: [
              SizedBox(height: Get.height*0.015,),
              SizedBox(
                height: Get.height*0.8,
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) => SizedBox(
                      height: Get.height * 0.013,
                    ),
                  itemCount: 10,
                    itemBuilder: (BuildContext context, int index){
                    return Container(
                      child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: Get.width*0.045, right: Get.width*0.048),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('July 9, 2022 7:03 PM',
                                style: TextStyle(color: Colors.purple),),
                                Text('₹ 53400')
                              ],
                            ),
                          ),
                          Divider(
                            indent: 20,
                            thickness: 2,
                            endIndent: 20,
                          ),

                        ],
                      ),
                    );
                    }
                ),
              )
            ],
          ),
        )
    );
  }
}
