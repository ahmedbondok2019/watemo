// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_steps_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStepsResModel _$OrderStepsResModelFromJson(Map<String, dynamic> json) =>
    OrderStepsResModel(
      steps: json['data'] != null
          ? List<StepModel>.from(json["data"].map((x) =>
            StepModel.fromJson(x)))
          : [],
      status: json["status"] as bool,
      error: json["error"] as String,
      code: json["code"] as String,
    );