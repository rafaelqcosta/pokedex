import 'package:pokedex/core/cubit/failure.dart';

enum ViewStatus { initial, loading, success, error }

class BaseState<T> {
  final ViewStatus status;
  final T? data;
  final Failure? failure;

  const BaseState._({required this.status, this.data, this.failure});

  // construtores específicos
  const BaseState.initial() : this._(status: ViewStatus.initial);
  const BaseState.loading() : this._(status: ViewStatus.loading);
  const BaseState.success(T d) : this._(status: ViewStatus.success, data: d);
  const BaseState.failure(Failure f) : this._(status: ViewStatus.error, failure: f);

  /* helpers */
  bool get isInitial => status == ViewStatus.initial;
  bool get isLoading => status == ViewStatus.loading;
  bool get isSuccess => status == ViewStatus.success;
  bool get isError => status == ViewStatus.error;

  BaseState<T> copyWith({ViewStatus? status, T? d, Failure? f}) =>
      BaseState._(status: status ?? this.status, data: d ?? this.data, failure: f ?? this.failure);
}
