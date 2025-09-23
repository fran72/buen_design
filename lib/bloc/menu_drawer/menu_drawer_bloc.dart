import 'package:bloc/bloc.dart';

part 'menu_drawer_event.dart';
part 'menu_drawer_state.dart';

class MenuDrawerBloc extends Bloc<MenuDrawerEvent, MenuDrawerState> {
  MenuDrawerBloc() : super(MenuDrawerState()) {
    on<MenuDrawerEvent>((event, emit) {});
    on<ChangeSearchEvent>((event, emit) async {
      emit(state.copyWith(searchTerm: event.searchTerm));
    });
  }
}
