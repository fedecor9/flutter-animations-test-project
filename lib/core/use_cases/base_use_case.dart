import 'package:flutter_template/core/common/result.dart';
import 'package:flutter_template/core/source/common/logger.dart';

abstract class BaseUseCase {}

abstract class BaseFutureUseCase<P, R> extends BaseUseCase {
  Future<R> execute(P params);

  Future<Result<R>> executeAsResult(P params) =>
      _toResult(() => execute(params));
}

abstract class BaseVoidFutureUseCase<R> extends BaseUseCase {
  Future<R> execute();

  Future<Result<R>> executeAsResult() => _toResult(() => execute());
}

abstract class BaseStreamUseCase<P, R> extends BaseUseCase {
  Stream<R> stream(P params);

  Stream<Result<R>> resultStream(P params) => stream(params)
          .map((value) => Result.success(value))
          .handleError((error, stacktrace) {
        Logger.instance.w('Use case error', error, stacktrace);
        return Result.failure<R>(error);
      });
}

abstract class BaseVoidStreamUseCase<R> extends BaseUseCase {
  Stream<R> stream();

  Stream<Result<R>> resultStream() => stream()
          .map((value) => Result.success(value))
          .handleError((error, stacktrace) {
        Logger.instance.w('Use case error', error, stacktrace);
        return Result.failure<R>(error);
      });
}

Future<Result<R>> _toResult<R>(Future<R> Function() callback) async {
  try {
    return await callback().then((value) => Result.success(value));
  } catch (error, stacktrace) {
    Logger.instance.w('Use case error', error, stacktrace);
    return Result.failure<R>(error);
  }
}
