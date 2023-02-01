import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/models/news_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistNull()) {
    on<AddWishlist>(_onAddWishlist);
    on<RemoveWishlist>(_onRemoveWishlist);
    on<WishlistLoading>(_onWishlistLoading);
  }

  _onWishlistLoading(WishlistLoading event, Emitter<WishlistState> emit) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(const WishlistLoaded());
  }

  void _onAddWishlist(AddWishlist event, Emitter<WishlistState> emit) {
    emit(WishlistLoaded(
        articles: List.from((state as WishlistLoaded).articles)
          ..add(event.articel)));
  }

  void _onRemoveWishlist(RemoveWishlist event, Emitter<WishlistState> emit) {
    emit(WishlistLoaded(
        articles: List.from((state as WishlistLoaded).articles)
          ..remove(event.articel)));
  }
}
