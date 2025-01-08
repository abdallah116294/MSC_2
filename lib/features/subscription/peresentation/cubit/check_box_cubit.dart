import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'check_box_state.dart';

class CheckBoxCubit extends Cubit<Map<String, bool>> {
  CheckBoxCubit() : super({"individual": true, "family": false});
  void toggleCheckbox(String key) {
    final state = Map<String, bool>.from(this.state);
    if (key == "individual") {
      state["individual"] = !state["individual"]!;
      state["family"] = false; //unchecked family
    } else if (key == "family") {
      state["family"] = !state["family"]!;
      state["individual"] = false; //unchecked individual
    }
    emit(state);
    // //! New Solution
    // final updatedState = Map<String, bool>.from(state);
    // updatedState[key] = !state[key]!;
    // emit(updatedState);
  }
}
