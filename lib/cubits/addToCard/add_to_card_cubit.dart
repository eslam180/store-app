import 'package:flower_app/cubits/addToCard/add_to_card_states.dart';
import 'package:bloc/bloc.dart';
import 'package:flower_app/models/product_model.dart';

class AddToCardCubit extends Cubit<AddToCardState> {
  AddToCardCubit() : super(AddToCardState());

  List<ProductModel> selectedProducts =[ ];
  double price = 0;


  void add(ProductModel productModel) {
    selectedProducts.add(productModel);
    price += productModel.price;

    emit(AddToCardState(selectedProducts: selectedProducts, price: price));
  }

  void delete(ProductModel productModel) {
    selectedProducts.remove(productModel);

     if (price != 0) {
      price -= productModel.price;
    } else {
      return ;
    }

    emit(AddToCardState(selectedProducts: selectedProducts, price: price));
  }
}
