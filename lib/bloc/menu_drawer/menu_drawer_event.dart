part of 'menu_drawer_bloc.dart';

class MenuDrawerEvent {}

class GetMenuDrawerEvent extends MenuDrawerEvent {}

class ChangeSearchEvent extends MenuDrawerEvent {
  final String searchTerm;
  ChangeSearchEvent({required this.searchTerm});
}
