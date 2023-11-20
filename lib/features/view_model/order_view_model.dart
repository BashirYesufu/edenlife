import 'package:rxdart/rxdart.dart';
import '../../core/models/order_status.dart';
import '../../core/services/order/order_repository_impl.dart';

class OrderViewModel {
  final _repo = OrderRepositoryImpl();

  final _progressSubject = BehaviorSubject<bool>();
  Stream<bool> get progressObservable => _progressSubject.stream;

  final _errorMessageSubject = BehaviorSubject<String>();
  Stream<String> get errorMessageObservable => _errorMessageSubject.stream;

  final _ablyMessageSubject = BehaviorSubject<OrderStatus>();
  Stream<OrderStatus> get ablyMessageObservable => _ablyMessageSubject.stream;

  void subscribe() async {
    try {
      _progressSubject.sink.add(true);
      await _repo.subscribeToChannel().then((status) {
        _ablyMessageSubject.sink.add(status);
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