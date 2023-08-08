import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial(0));

  void changeCurrentPage(int index) {
    emit(BottomNavBarInitial(index));
  }
}
