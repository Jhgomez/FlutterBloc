part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;
  const CounterState({
    required this.counter,
  });

  factory CounterState.initial() {
    return const CounterState(counter: 0);
  }
  
  @override
  List<Object> get props => [counter];

  @override
  String toString() => 'CounterState(counter $counter)';

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}

// sealed class CounterState extends Equatable {
//   const CounterState();

//   @override
//   List<Object> get props => [];
// }

// final class CounterInitial extends CounterState {}
