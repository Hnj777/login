 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopapi/view/register.dart';
// import 'package:shopapi/controller/productcontroller.dart';
// import 'package:get/get.dart';
// import 'package:shopapi/widget/singleproductwidget.dart';

// class MyHomePage extends StatelessWidget {
//   final ProductController productController = Get.put(ProductController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("HomePage"),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Container(
//           child:Obx(() {
//             //if(productController.isLoading.value)
//             //return Center(child:CircularProgressIndicator());

//             return GridView.builder(
//             itemCount: productController.productList.length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 2 / 2.5,
//                 crossAxisSpacing: 5,
//                 mainAxisSpacing: 5),
//             itemBuilder: (BuildContext context, index) => SingleProduct(name: productController.productList[index].title,
//             price: productController.productList[index].price,
//             imageurl:productController.productList[index].image,)
//           );}) 
//         ),
//       ),
//     );
//   }
// }
class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("Register");
      }
    });
  }

  

   getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  signOut() async {
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("Login Sucess"),),
            ElevatedButton(onPressed: signOut, child: Text("SignOut"))
          ],
        ),
      ),
      
    );
  }
}