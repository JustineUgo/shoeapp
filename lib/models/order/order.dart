import 'package:freezed_annotation/freezed_annotation.dart';
part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Ordered with _$Ordered {
  const factory Ordered({
    required int quantity,
    required String status,
    required double total,
    required String userId,
  }) = _Ordered;

  factory Ordered.fromJson(Map<String, Object?> json) => _$OrderedFromJson(json);
}


