import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> with HydratedMixin {
  CounterBloc() : super(CounterState.initial()) {
    // on<IncrementCounterEvent>((event, emit) {
    //   emit(state.copyWith(counter: state.counter + 1));
    // });
    

    // Even thought these buckets run sequentially since I specified it
    // their stack runs asynchronously because they are separated but in the
    // bellow code they run sequentially because they are in the same bucker 
    // on<IncrementCounterEvent>(_incrementCounter);
    // on<DecrementCounterEvent>(_decrementCounter);
    on<CounterEvent>( ((event, emit) async {
          switch(event) {
            case IncrementCounterEvent() : await _incrementCounter(event, emit);
            case DecrementCounterEvent() : await _decrementCounter(event, emit);
          }
        }
      ),
      transformer: sequential()
    );
  }

  Future<void> _decrementCounter(
    DecrementCounterEvent event,
    Emitter<CounterState> emit
    ) async {
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(counter: state.counter - 1));
    }

    Future<void> _incrementCounter(event,emit) async {
      await Future.delayed(const Duration(seconds: 4));
      emit(state.copyWith(counter: state.counter  + 1));
    }
    
      @override
      CounterState? fromJson(Map<String, dynamic> json) {
        final counterState = CounterState.fromJson(json);
        return counterState;
      }
    
      @override
      Map<String, dynamic>? toJson(CounterState state) {
        return state.toJson();
      }
}
