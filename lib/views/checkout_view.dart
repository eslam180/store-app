import 'package:flower_app/components/custom_buttom.dart';
import 'package:flower_app/costants.dart';
import 'package:flower_app/cubits/addToCard/add_to_card_cubit.dart';
import 'package:flower_app/cubits/addToCard/add_to_card_states.dart';
import 'package:flower_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({
    super.key,
    required this.selectedProductss,
    required this.price,
  });
  final double price;
  final List<ProductModel> selectedProductss;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddToCardCubit, AddToCardState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Icon(
                          Icons.add_shopping_cart,
                          size: 28,
                          color: Colors.white,
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
                              style: TextStyle(
                                color: kprimaryColor,
                                fontSize: 16,
                              ),
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
                ),
              ),
            ],
            title: Text(
              'Checkout',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Center(
                  child: ListView.builder(
                    itemCount: widget.selectedProductss.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: BoxBorder.all(color: kprimaryColor),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              widget.selectedProductss[index].image,
                              height: 50,
                              width: 40,
                            ),
                            Spacer(),
                            Text(
                              '\$${widget.selectedProductss[index].price}',
                              style: TextStyle(
                                color: kprimaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(flex: 4),
                            GestureDetector(
                              onTap: () {
                                if (widget.selectedProductss.isNotEmpty) {
                                  BlocProvider.of<AddToCardCubit>(
                                    context,
                                  ).delete(widget.selectedProductss[index]);
                                  setState(() {});
                                } else {
                                  return;
                                }
                              },
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: kprimaryColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.selectedProductss.isNotEmpty
                    ? CustomButton(
                        nameButtom: '\$ ${state.price.toStringAsFixed(2)}',
                        onPressed: () {},
                      )
                    : Text(
                        'No products selected',
                        style: TextStyle(color: kprimaryColor),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
