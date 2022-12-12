import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project/product_model.dart';
import 'package:project/service.dart';

part 'api_bloc_event.dart';
part 'api_bloc_state.dart';

class ApiBlocBloc extends Bloc<ApiBlocEvent, ApiBlocState> {
  ApiService apiService = ApiService();
  ApiBlocBloc(this.apiService) : super(ApiBlocInitial()) {
    on<ApiBlocEvent>((event, emit) async {
      if (event is ProductEventButton) {
        emit(ApiBlocLoading());
        try {
          var data = await apiService.getProduct();
          emit(ApiBlocLoaded(data: data));
        } catch (e) {
          emit(ApiBlocError());
        }
      }
    });
  }
}
