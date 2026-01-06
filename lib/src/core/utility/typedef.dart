import 'package:clz/src/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

typedef ResultFuture<Type> = Future<Either<Failure, Type>>;

typedef ResultStream<Type> = Stream<Either<Failure, Type>>;

typedef ResultVoid = ResultFuture<void>;

typedef ThemeBuilder = Widget Function(BuildContext context, ThemeData theme);
