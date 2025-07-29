import gleam/option.{type Option}

pub type TaskResult {
    Success(payload: Option(String))
    Failure(reason: String)
}
