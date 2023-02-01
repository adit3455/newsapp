part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class NotBeenSearch extends SearchState {
  @override
  List<Object> get props => [];
}

class LoadingSearch extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchDone extends SearchState {
  final List<Articles> articles;

  const SearchDone(this.articles);
  @override
  List<Object> get props => [articles];
}

class SearchError extends SearchState {
  final String error;

  const SearchError(this.error);

  @override
  List<Object> get props => [error];
}

class NotFound extends SearchState {
  @override
  List<Object> get props => [];
}
