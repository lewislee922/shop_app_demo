import '../model/cart.dart';
import '../model/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = ChangeNotifierProvider<Cart>((ref) => Cart(<ShopItem>[]));

final mockDataProvider =
    Provider<List<ProductDetail>>((ref) => throw UnimplementedError());
