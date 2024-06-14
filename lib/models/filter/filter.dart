import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoesly/models/brand/brand.dart';
import 'package:shoesly/models/product/product.dart';

part 'filter.freezed.dart';
part 'filter.g.dart';

@freezed
class Filter with _$Filter {
  const factory Filter({
    List<Brand>? brands,
    List<String>? colors,
    double? maxAmount,
    double? minAmount,
    Gender? gender,
    SortBy? sortBy,
  }) = _Filter;

  factory Filter.fromJson(Map<String, Object?> json) => _$FilterFromJson(json);
}

enum SortBy{ mostRecent, lowestPrice, highestReviews}

