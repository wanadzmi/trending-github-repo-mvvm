class MyResponse<T, V> {
  MyResponse.error(V error)
      : _status = ResponseStatus.error,
        _error = error;
  MyResponse.complete(T data)
      : _status = ResponseStatus.complete,
        _data = data;
  MyResponse.loading() : _status = ResponseStatus.loading;

  MyResponse.initial() : _status = ResponseStatus.initial;
  final ResponseStatus _status;
  T? _data;
  V? _error;

  V? get error => _error;
  T? get data => _data;
  ResponseStatus get status => _status;
}

enum ResponseStatus { initial, complete, error, loading, consumed }
