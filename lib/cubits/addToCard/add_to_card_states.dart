
//  abstract class CartState{}

// class EmptyCardState  extends CartState{
   
// }



import 'package:flower_app/models/product_model.dart';

class AddToCardState    {
  AddToCardState({this.selectedProducts = const [], this.price = 0, });
  final List<ProductModel> selectedProducts;
  final double price;

}
