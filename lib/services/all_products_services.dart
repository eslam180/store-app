import 'package:flower_app/models/product_model.dart';
import 'package:flower_app/services/api.dart';

class AllProductsServices {
  Future<List<ProductModel>> getAllProuducts() async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products',
    );
    //هنا بعمل ليست فاضيه بس هخزن  فيها الداتا الي انا استقبلتها
    // في ليست اوف داتا وهلف عليها وهخزنها
    //في ليست اوف اوبشكت  بمعنا اصح هخزن الداتا
    //الي جايه من النت علي هئيه اوبجكت عشان اعرف
    //اتعامل معاها في اي اسكرين
    //الكلام ده يطبق ع اي سيرفس انا بعملها عموما
    List<ProductModel> productlist = [];

    for (dynamic i = 0; i < data.length; i++) {
      productlist.add(ProductModel.fromjson(data[i]));
    }

    return productlist;
  }
}
