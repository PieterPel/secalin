import domain/value_objects/retry_policy
import domain/value_objects/task_id
import domain/value_objects/task_status
import gleam/option.{type Option}

pub opaque type Task {
  Task(
    id: task_id.TaskId,
    status: task_status.TaskStatus,
    retry_policy: retry_policy.RetryPolicy,
    payload: Option(String), // TODO: payload should be some kind of protocol
  )
}

pub fn new(
  retry_policy: retry_policy.RetryPolicy,
  payload: Option(String),
) -> Task {
  Task(task_id.new(), task_status.Pending, retry_policy, payload)
}
