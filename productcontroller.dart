// import 'package:get/get.dart';
// import 'package:shopapi/model/product.dart';
// import 'package:shopapi/services/remote_service.dart';

// class ProductController extends GetxController{
//   var isLoading = true.obs;
//  var productList = List<Product>().obs;

//  @override
//  void onInit(){
//    featchProduct();
//    super.onInit();
//  }
 
//  void featchProduct() async {
//    try{
//      isLoading(true);
   
//     var products = await RemoteServices.fatchProduct();
//     if (products != null){
//       productList.value = products;
//       print(productList.toList());
//     }
//    }finally{
//      isLoading(false);
//    }
//  }
// }


