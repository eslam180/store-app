import 'package:flower_app/costants.dart';
import 'package:flower_app/cubits/addToCard/add_to_card_cubit.dart';
import 'package:flower_app/cubits/addToCard/add_to_card_states.dart';
import 'package:flower_app/views/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomShopCart extends StatelessWidget {
  const CustomShopCart({super.key, 

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: BlocBuilder<AddToCardCubit, AddToCardState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutView(
                           price :state.price,
                            selectedProductss: state.selectedProducts,
                          ),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.add_shopping_cart,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: -16,
                    left: -12,

                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.6),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${state.selectedProducts.length}',
                        style: TextStyle(color: kprimaryColor, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              Text(
                '\$${state.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          );
        },
      ),
    );
  }
}
