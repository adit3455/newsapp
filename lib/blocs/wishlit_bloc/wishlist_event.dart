part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class AddWishlist extends WishlistEvent {
  final Articles articel;

  const AddWishlist(this.articel);
  @override
  List<Object> get props => [articel];
}

class RemoveWishlist extends WishlistEvent {
  final Articles articel;

  const RemoveWishlist(this.articel);
  @override
  List<Object> get props => [articel];
}

class WishlistLoading extends WishlistEvent {
  @override
  List<Object> get props => [];
}
