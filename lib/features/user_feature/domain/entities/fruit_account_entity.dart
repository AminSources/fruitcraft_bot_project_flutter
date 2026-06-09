import 'package:equatable/equatable.dart';

class FruitAccountEntity extends Equatable {
  final String name;
  final String restoreKey;
  final String licenseKey;

  const FruitAccountEntity({
    required this.name,
    required this.restoreKey,
    required this.licenseKey,
  });

  @override
  List<Object?> get props => [name, restoreKey, licenseKey];
}
