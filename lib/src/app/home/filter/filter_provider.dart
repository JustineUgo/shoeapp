import 'package:flutter/material.dart';
import 'package:shoesly/models/filter/filter.dart';

class FilterProvider with ChangeNotifier {
  ProductFilter _filter = const ProductFilter();
  ProductFilter get filter => _filter;

  RangeValues _currentRangeValues = const RangeValues(0, 500);
  RangeValues get currentRangeValues => _currentRangeValues;

  void setCurrentRangeValues(RangeValues values) {
    _currentRangeValues = values;
    notifyListeners();
  }

  void updateFilter(ProductFilter filter) {
    _filter = filter;
    notifyListeners();
  }

  void updatePriceRange(double minAmount, double maxAmount) {
    _filter = _filter.copyWith(minAmount: minAmount, maxAmount: maxAmount);
    notifyListeners();
  }
}
