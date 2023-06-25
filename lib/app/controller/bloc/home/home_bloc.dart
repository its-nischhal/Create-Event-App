import 'package:bloc/bloc.dart';
import 'package:form_app/app/controller/bloc/home/home_event.dart';
import 'package:form_app/app/controller/bloc/home/home_state.dart';
import 'package:form_app/app/model/form/form_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<SubmitEvent>(_submitCallback);
  }
  void _submitCallback(SubmitEvent event, Emitter<HomeState> emit) async {
    // ignore: unused_local_variable
    FormModel formData;
    if (event.formKey.currentState!.validate()) {
      formData = event.fromModel;
      emit(HomeSuccessState());
    } else {
      emit(HomeUnSuccessState());
    }
  }
}
