// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'counter_cubit.dart';

class CounterCubitState extends Equatable {
  final int counter;
  const CounterCubitState({
    required this.counter,
  });

  factory CounterCubitState.initial() {
    return const CounterCubitState(counter: 0);
  }
  
  @override
  List<Object> get props => [counter];

  @override
  String toString() => 'CounterState(counter $counter)';

  CounterCubitState copyWith({
    int? counter,
  }) {
    return CounterCubitState(
      counter: counter ?? this.counter,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'counter': counter,
    };
  }

  factory CounterCubitState.fromJson(Map<String, dynamic> json) {
    return CounterCubitState(
      counter: json['counter'] as int,
    );
  }
}

// sealed class CounterState extends Equatable {
//   const CounterState();

//   @override
//   List<Object> get props => [];
// }

// final class CounterInitial extends CounterState {}
