import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/product_controller.dart';
import 'package:flutter_ecommerce/views/widgets/product_tile.dart';
import 'package:flutter_ecommerce/views/pages/product_sell.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Vaizans Online Shopping',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.view_list_rounded), onPressed: () {}),
                IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              print("start obx");
              if (productController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: productController.productList.length,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  itemBuilder: (context, index) {
                    print("start 2 obx");
                    return ProductTile(productController.productList[index]);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                );
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Do you want to sell your product ?"),
              SizedBox(width: 10,),
              GestureDetector(
                onTap: (){
                 Get.to(() => ProductSell());
                },
                child: CircleAvatar(
                  child: Icon(Icons.add),),
              ),
              SizedBox(width: 15,)
            ],
          ),
        ],
      ),
    );
  }
}