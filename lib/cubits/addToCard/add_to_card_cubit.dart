import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_app/cubits/addToCard/add_to_card_states.dart';
import 'package:bloc/bloc.dart';
import 'package:flower_app/models/product_model.dart';

class AddToCardCubit extends Cubit<AddToCardState> {
  AddToCardCubit() : super(AddToCardState());

  List<ProductModel> selectedProducts = [];
  double price = 0;

  
Stream<DocumentSnapshot> get userStream {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    throw Exception('User not logged in');
  }

  return FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .snapshots();
}


  void add(ProductModel productModel) {
    selectedProducts.add(productModel);
    price += productModel.price;

    emit(AddToCardState(
      selectedProducts: selectedProducts,
      price: price,
    ));
  }

  void delete(ProductModel productModel) {
    selectedProducts.remove(productModel);

    if (price != 0) {
      price -= productModel.price;
    }

    emit(AddToCardState(
      selectedProducts: selectedProducts,
      price: price,
    ));
  }
}
