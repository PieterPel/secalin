import domain/value_objects/retry_policy
import domain/value_objects/task_id
import domain/value_objects/task_status

pub type Task {
  Task(
    id: task_id.TaskId,
    status: task_status.TaskStatus,
    retry_policy: retry_policy.RetryPolicy,
  )
}

pub fn new(retry_policy: retry_policy.RetryPolicy) -> Task {
  Task(task_id.new(), task_status.Pending, retry_policy)
}
