import 'package:flutter/material.dart';
import 'package:plantapp/api/api_service.dart';
import 'package:plantapp/models/woocommercr/product_model.dart';

class ShopProvider with ChangeNotifier {
  ApiService? _apiService;

  ShopProvider() {
    _apiService = ApiService();
  }
  bool isLoading = false;

  List<Product> _product = <Product>[];
  List<Product> get product => _product;

  Future<void> getAllProducts() async {
    isLoading = true;
    notifyListeners();
    final List<Product> response = await _apiService!.getProducts();
    _product = response;
    isLoading = false;
    notifyListeners();
  }

  void initializaData() {
    _apiService = ApiService();
  }
}
