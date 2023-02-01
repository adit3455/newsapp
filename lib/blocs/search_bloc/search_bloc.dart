import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/repositories/baserepositories.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final NewsRepository newsRepositories;
  SearchBloc({required this.newsRepositories}) : super(NotBeenSearch()) {
    on<DoneSearching>(_onDoneSearching);
    on<NotFoundSearching>(_onNotFoundSeaching);
  }

  void _onDoneSearching(DoneSearching event, Emitter<SearchState> emit) async {
    try {
      emit(LoadingSearch());
      if (event.controller.isEmpty) {
        emit(LoadingSearch());
        emit(NotBeenSearch());
      } else if (event.controller.isNotEmpty) {
        emit(LoadingSearch());
        await Future.delayed(const Duration(seconds: 3));
        List<Articles> articles =
            await newsRepositories.getSearch(search: event.controller);
        emit(SearchDone(articles));
      }
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  void _onNotFoundSeaching(
      NotFoundSearching event, Emitter<SearchState> emit) {}
}
