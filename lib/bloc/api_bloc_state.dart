part of 'api_bloc_bloc.dart';

abstract class ApiBlocState {}

class ApiBlocInitial extends ApiBlocState {}

class ApiBlocLoading extends ApiBlocState {}

class ApiBlocLoaded extends ApiBlocState {
  final List<ProductModel> data;
  ApiBlocLoaded({required this.data});
}

class ApiBlocError extends ApiBlocState {}
