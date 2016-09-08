//
//  ResultType.swift
//  Pods
//
//  Created by Alexander Belyavskiy on 12/1/15.
//
//

public enum Result<T, E> {
  case ok(T)
  case err(E)
}

public enum Either<T, V> {
  case first(T)
  case second(V)
}
