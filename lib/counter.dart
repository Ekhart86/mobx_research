import 'package:mobx/mobx.dart';

part 'counter.g.dart';

// ignore: library_private_types_in_public_api
class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @observable
  int value = 0;

  @observable
  bool isLoading = false;

  @action
  Future<void> increment() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    value++;
    isLoading = false;
  }

  @action
  Future<void> decrement() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    value--;
    isLoading = false;
  }
}
