import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../error/failure.dart';

typedef ContextBuilder = Widget Function(BuildContext);

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultVoid<T> = Future<Either<Failure, T>>;

typedef DataMap = Map<String, dynamic>;
