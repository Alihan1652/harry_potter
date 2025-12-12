import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter/data/repository.dart';
import 'package:harry_potter/model/harry_model.dart';

part 'harry_state.dart';
part 'harry_event.dart';

class HarryBloc extends Bloc<HarryEvent, HarryState> {
  HarryBloc() : super(HarryInitial()) {
    on<FetchCharacters>(_onFetchCharacters);
    on<SetLoadingEvent>(_onSetLoading);
  }

  final repository = Repository();

  Future<void> _onFetchCharacters(
      FetchCharacters event, Emitter<HarryState> emit) async {
    emit(Loading());

    try {
      final characters = await repository.getCharacters();
      emit(Success(characters));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  void _onSetLoading(SetLoadingEvent event, Emitter<HarryState> emit) {
    emit(Loading());
  }
}
