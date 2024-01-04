part of 'discover_bloc.dart';

@immutable
abstract class DiscoverState {
  final int? index;
  final String? error;
  final ListResponse<MultipleMedia>? result;
  const DiscoverState({this.index, this.error, this.result});
}

final class DiscoverInitial extends DiscoverState {}

final class SearchResult extends DiscoverState {
  const SearchResult({required super.result, super.error});
}

final class LoadSearch extends DiscoverState {}

final class SearchError extends DiscoverState {
  const SearchError({required super.result, super.error});
}

final class ChangeTab extends DiscoverState {
  const ChangeTab({required super.index, super.error});
}
