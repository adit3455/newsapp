part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class DoneSearching extends SearchEvent {
  final String controller;

  const DoneSearching(this.controller);
  @override
  List<Object> get props => [controller];
}

class NotFoundSearching extends SearchEvent {
  final List<Articles> articles;

  const NotFoundSearching(this.articles);

  @override
  List<Object> get props => [articles];
}
