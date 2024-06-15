import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoesly/models/brand/brand.dart';
import 'package:shoesly/models/product/product.dart';

part 'filter.freezed.dart';
part 'filter.g.dart';

@freezed
class ProductFilter with _$ProductFilter {
  const factory ProductFilter({
    List<Brand>? brands,
    String? color,
    double? maxAmount,
    double? minAmount,
    Gender? gender,
    SortBy? sortBy,
  }) = _ProductFilter;

  factory ProductFilter.fromJson(Map<String, Object?> json) => _$ProductFilterFromJson(json);
}

enum SortBy { mostRecent, lowestPrice, highestReviews }

extension SortByExtension on SortBy {
  String get displayName {
    switch (this) {
      case SortBy.mostRecent:
        return 'Most recent';
      case SortBy.lowestPrice:
        return 'Lowest price';
      case SortBy.highestReviews:
        return 'Highest reviews';
      default:
        return '';
    }
  }
}

extension ProductFilterExtensions on ProductFilter {
  ProductFilter toggleBrand(Brand brand) {
    final updatedBrands = (brands ?? []).contains(brand) ? ((brands ?? []).toList()..remove(brand)) : ((brands ?? []).toList()..add(brand));
    return copyWith(brands: updatedBrands);
  }

  ProductFilter removeBrands() {
    return copyWith(brands: []);
  }

  ProductFilter toggleColor(String selecteColor) {
    return copyWith(color: color == selecteColor ? null : selecteColor);
  }

  ProductFilter toggleGender(Gender selectedGender) {
    return copyWith(gender: gender == selectedGender ? null : selectedGender);
  }

  ProductFilter setSortBy(SortBy selectedSortBy) {
    return copyWith(sortBy: sortBy == selectedSortBy ? null : selectedSortBy);
  }

  ProductFilter setPriceRange(double? minAmount, double? maxAmount) {
    return copyWith(minAmount: minAmount, maxAmount: maxAmount);
  }

  int types() {
    int count = 0;
    if (brands != null && brands!.isNotEmpty) count++;
    if (color != null) count++;
    if (maxAmount != null) count++;
    if (minAmount != null) count++;
    if (gender != null) count++;
    if (sortBy != null) count++;
    return count;
  }
}
