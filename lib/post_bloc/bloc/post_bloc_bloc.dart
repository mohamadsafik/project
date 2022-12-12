import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:project/service.dart';

part 'post_bloc_event.dart';
part 'post_bloc_state.dart';

class PostBlocBloc extends Bloc<PostBlocEvent, PostBlocState> {
  ApiService apiService;
  PostBlocBloc(this.apiService) : super(PostBlocInitial()) {
    on<PostBlocEvent>((event, emit) async {
      if (event is PostEvent) {
        emit(PostBlocLoading());
        var data = await apiService.addProduct(
            name: event.name,
            email: event.email,
            password: event.password,
            id: event.id);
        emit(PostBlocLoaded(message: data));
      } else {
        throw Exception();
      }
    });
  }
}
