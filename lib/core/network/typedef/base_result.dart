import 'package:dartz/dartz.dart';

import '../exception/failure_exception.dart';

typedef BaseResult<T> = Future<Either<FailureException, T>>;
typedef ResultVoid = BaseResult<void>;
