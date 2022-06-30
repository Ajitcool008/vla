import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final List<String> productname = <String>['Brush', 'Comb', 'Paper', "NoteBook", 'Copy', 'Laptop', 'Computer','Pen', 'Pencil','Book'];
   final List<int> colorCodes = <int>[600, 500,600, 500,600, 500,600, 500,600, 500,];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Center(child: const Text('Home',
        style: TextStyle(
          fontSize: 23
        ),)),
        actions: [
          IconButton(
            onPressed: (){},
              icon: const Icon(Icons.shopping_cart))],
      ),
      body: Column(
        children: [
          Container(
            height: Get.height*0.07,
            width: Get.width*0.999,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width*0.24,
                  child: const Text('Name',
                  style: const TextStyle(color: Colors.black,fontSize: 18),),
                ),
                const Text('Prize',
                  style: const TextStyle(color: Colors.black,fontSize: 18),),
                const Text('Details',
                  style: const TextStyle(color: Colors.black,fontSize: 18),),
              ],
            ),
          ),
         // SizedBox(height: Get.height*0.01,),
          SizedBox(
            height: Get.height * 0.725,
            child: ListView.builder(
              //padding: const EdgeInsets.all(8),
                itemCount: productname.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: Get.height*0.07,
                    width: Get.width*0.999,
                    decoration: BoxDecoration(
                        color: Colors.brown[colorCodes[index]]
                    ),
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width*0.24,
                          child: Text(' ${productname[index]}',
                            style: const TextStyle(color: Colors.white,fontSize: 18),),
                        ),
                        const Text('3000',
                          style: TextStyle(color: Colors.white,fontSize: 18),),
                        IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.arrow_forward,
                            color: Colors.white,))
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
