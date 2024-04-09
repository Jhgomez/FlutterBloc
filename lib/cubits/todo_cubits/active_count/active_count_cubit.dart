import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'active_count_state.dart';

class ActiveCountCubit extends Cubit<ActiveCountState> {
  ActiveCountCubit() : super(ActiveCountInitial());
}
