// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Counter on _Counter, Store {
  late final _$valueAtom = Atom(name: '_Counter.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_Counter.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$incrementAsyncAction =
      AsyncAction('_Counter.increment', context: context);

  @override
  Future<void> increment() {
    return _$incrementAsyncAction.run(() => super.increment());
  }

  late final _$decrementAsyncAction =
      AsyncAction('_Counter.decrement', context: context);

  @override
  Future<void> decrement() {
    return _$decrementAsyncAction.run(() => super.decrement());
  }

  @override
  String toString() {
    return '''
value: ${value},
isLoading: ${isLoading}
    ''';
  }
}
