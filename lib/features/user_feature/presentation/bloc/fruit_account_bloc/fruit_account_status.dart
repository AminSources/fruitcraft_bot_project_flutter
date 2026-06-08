import 'package:flutter/material.dart';

@immutable
abstract class FruitAccountStatus {}

class FruitAccountInitial extends FruitAccountStatus {}

class FruitAccountLoading extends FruitAccountStatus {}

class FruitAccountFailure extends FruitAccountStatus {
  final String message;

  FruitAccountFailure(this.message);
}

class FruitAccountSuccess extends FruitAccountStatus {}
