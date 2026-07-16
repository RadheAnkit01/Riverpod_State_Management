import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/favourite%20product/product_model.dart';

final productProvider =
    StateNotifierProvider<ProductProviderController, List<Product>>((ref) {
      return ProductProviderController([]);
    });

class ProductProviderController extends StateNotifier<List<Product>> {
  ProductProviderController(super.state);

  void addProduct({required String productName, required double price}) {
    Product product = Product(
      id: state.isEmpty ? 1 : state.first.id + 1,
      productName: productName,
      price: price,
      favourite: false,
    );
    state = [product, ...state];
  }

  void toggleFavourite(int id) {
    int index = state.indexWhere((element) => element.id == id);
    if (index == -1) return;
    Product product = state[index];
    product = product.copyWith(favourite: !product.favourite);
    state[index] = product;
  }

  void deleteProduct(int id) {
    state.removeWhere((el) => el.id == id);
  }

  void updateProduct({required int id, String? productName, double? price}) {
    int index = state.indexWhere((el) => el.id == id);
    Product product = state[index];
    product = product.copyWith(
      productName: productName ?? product.productName,
      price: price ?? product.price,
    );
    state[index] = product;
  }
}
