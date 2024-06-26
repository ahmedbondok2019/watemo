import '../../../../../core/src/app_export.dart';
part 'checkout_url_model.g.dart';

@JsonSerializable()
class CheckoutUrlModel {
  final String? targetUrl;

  CheckoutUrlModel({
    required this.targetUrl,
  });

  factory CheckoutUrlModel.fromJson(Map<String, dynamic> json) =>
      _$CheckoutUrlModelFromJson(json);
}