import 'package:flower_app/costants.dart';
import 'package:flower_app/cubits/addToCard/add_to_card_cubit.dart';
import 'package:flower_app/models/product_model.dart';
import 'package:flower_app/views/details_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatelessWidget {
  const Cart({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsCardView(productModel: productModel),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
              color: Color(0XFFE5E5E5),
              borderRadius: BorderRadius.circular(20),
            ),

            width: 170,
            height: 150,
          ),
          Positioned(
            left: 22,
            top: 10,
            child: Image.network(productModel.image, height: 100, width: 100),
          ),
          Positioned(
            top: 120,
            left: 20,

            child: Text(
              '\$${productModel.price}',
              style: TextStyle(
                color: kprimaryColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            top: 115,
            left: 130,
            child: GestureDetector(
              child: Icon(Icons.add, size: 27, color: kprimaryColor),

              onTap: () {
                BlocProvider.of<AddToCardCubit>(context).add(productModel);
              },
            ),
          ),

          Positioned(
            top: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber[500],
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text(
                  productModel.rating != null
                      ? productModel.rating!.rate.toString()
                      : '0.0',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
