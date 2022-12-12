part of 'post_bloc_bloc.dart';

abstract class PostBlocEvent extends Equatable {
  const PostBlocEvent();

  @override
  List<Object> get props => [];
}

class PostEvent extends PostBlocEvent {
  String name;
  String email;
  String password;
  String id;

  PostEvent({
    required this.email,
    required this.id,
    required this.name,
    required this.password,
  });
}
