import 'package:mobx/mobx.dart';

part 'counter.g.dart';

// ignore: library_private_types_in_public_api
class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @observable
  int value = 0;

  @observable
  bool isLoading = false;

  @observable
  bool isLockedButtons = false;

  @action
  Future<void> increment() async {
    isLockedButtons = true;
    isLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    value++;
    isLoading = false;
    isLockedButtons = false;
  }

  @action
  Future<void> decrement() async {
    isLockedButtons = true;
    isLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    value--;
    isLoading = false;
    isLockedButtons = false;
  }
}
