import 'package:equatable/equatable.dart';
import 'package:firebase_full_news_app/product/utility/base/base_firebase_model.dart';

// ignore: must_be_immutable
class NumberModel extends Equatable
    with IdModel, BaseFirebaseModel<NumberModel> {
  NumberModel({
    this.number,
  });

  final String? number;
  @override
  String? id = '';

  NumberModel copyWith({
    String? number,
  }) {
    return NumberModel(
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
    };
  }

  @override
  NumberModel fromJson(Map<String, dynamic> json) {
    return NumberModel(
      number: json['number'] as String?,
    );
  }

  @override
  List<Object?> get props => [number];
}
