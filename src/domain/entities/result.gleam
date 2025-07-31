//// Module that defines a task result

import gleam/option.{type Option}


/// TaskResult
///
pub type TaskResult {
  Success(payload: Option(String))
  Failure(reason: String)
}
