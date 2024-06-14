import 'package:freezed_annotation/freezed_annotation.dart';

part 'shoesly_user.freezed.dart';
part 'shoesly_user.g.dart';

@freezed
class ShoeslyUser with _$ShoeslyUser {
  const factory ShoeslyUser({
    @Default([]) List<String> orders, 
    @Default([]) List<String> wishlist, 
  }) = _ShoeslyUser;

  factory ShoeslyUser.fromJson(Map<String, Object?> json) => _$ShoeslyUserFromJson(json);
}


