import 'package:rxdart/rxdart.dart';
import '../../core/services/order/order_repository_impl.dart';
import 'package:ably_flutter/ably_flutter.dart' as ably;

class OrderViewModel {
  final _repo = OrderRepositoryImpl();

  final _progressSubject = BehaviorSubject<bool>();
  Stream<bool> get progressObservable => _progressSubject.stream;

  final _errorMessageSubject = BehaviorSubject<String>();
  Stream<String> get errorMessageObservable => _errorMessageSubject.stream;

  final _ablyMessageSubject = BehaviorSubject<ably.Message>();
  Stream<ably.Message> get ablyMessageObservable => _ablyMessageSubject.stream;

  void subscribe() async {
    try {
      _progressSubject.sink.add(true);
      await _repo.subscribeToChannel().then((message) {
        _ablyMessageSubject.sink.add(message);
        _progressSubject.sink.add(false);
      }, onError: (e) {
        _ablyMessageSubject.sink.addError(e);
        _progressSubject.sink.add(false);
      });
    } catch (e) {
      _ablyMessageSubject.sink.addError(e);
    }
  }
}