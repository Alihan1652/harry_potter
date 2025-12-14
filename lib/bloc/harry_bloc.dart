import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter/data/repository.dart';
import 'package:harry_potter/model/harry_model.dart';

part 'harry_state.dart';
part 'harry_event.dart';

class HarryBloc extends Bloc<HarryEvent, HarryState> {
  final Repository repository;

  HarryBloc(this.repository) : super(HarryInitial()) {
    on<FetchCharacters>(_onFetchCharacters);
  }

  Future<void> _onFetchCharacters(
      FetchCharacters event,
      Emitter<HarryState> emit,
      ) async {
    emit(Loading());

    try {
      final list = await repository.getCharacters();
      emit(Success(list));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
