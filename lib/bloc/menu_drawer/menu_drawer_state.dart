part of 'menu_drawer_bloc.dart';

class MenuDrawerState {
  String searchTerm;

  MenuDrawerState({this.searchTerm = ''});

  MenuDrawerState copyWith({String? searchTerm}) {
    return MenuDrawerState(searchTerm: searchTerm ?? this.searchTerm);
  }
}
