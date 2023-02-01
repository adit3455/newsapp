part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

class WishlistNull extends WishlistState {
  @override
  List<Object> get props => [];
}

class WishlistLoaded extends WishlistState {
  final List<Articles> articles;
  const WishlistLoaded({this.articles = const <Articles>[]});

  @override
  List<Object> get props => [articles];
}

class WishlistError extends WishlistState {
  final String error;

  const WishlistError(this.error);

  @override
  List<Object> get props => [error];
}
