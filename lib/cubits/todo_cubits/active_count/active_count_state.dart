// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'active_count_cubit.dart';

class ActiveCountState extends Equatable {
  final int activeCount;
  const ActiveCountState({required this.activeCount});

  @override
  List<Object> get props => [activeCount];

  @override
  String toString() => 'ActiveCount $activeCount';

  ActiveCountState copyWith({
    int? activeCount,
  }) {
    return ActiveCountState(
      activeCount: activeCount ?? this.activeCount,
    );
  }
}
