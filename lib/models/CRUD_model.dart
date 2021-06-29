// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:kiosk_shopkeeper/models/Product.dart';
// import 'package:kiosk_shopkeeper/services/Api.dart';

// class CRUDModel extends ChangeNotifier {
//   Api _api = locator<Api>();

//   List<Product>? products;


//   Future<List<Product>> fetchProducts() async {
//     var result = await _api.getDataCollection();
//     products = result.docs
//         .map((doc) => Product.fromMap(doc.data, doc.id))
//         .toList();
//     return products!;
//   }

//   Stream<QuerySnapshot> fetchProductsAsStream() {
//     return _api.streamDataCollection();
//   }

//   Future<Product> getProductById(String id) async {
//     var doc = await _api.getDocumentById(id);
//     return  Product.fromMap(doc.data, doc.id) ;
//   }


//   Future removeProduct(String id) async{
//      await _api.removeDocument(id) ;
//      return ;
//   }
//   Future updateProduct(Product data,String id) async{
//     await _api.updateDocument(data.toJson(), id) ;
//     return ;
//   }

//   Future addProduct(Product data) async{
//     var result  = await _api.addDocument(data.toJson()) ;

//     return ;

//   }


// }