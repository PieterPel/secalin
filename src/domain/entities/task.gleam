//// Module that defines a task

import domain/value_objects/retry_policy
import domain/value_objects/task_id
import domain/value_objects/task_status
import gleam/option.{type Option}

/// Task
///
pub opaque type Task {
  Task(
    id: task_id.TaskId,
    status: task_status.TaskStatus,
    retry_policy: retry_policy.RetryPolicy,
    payload: Option(String),
    retries: Int,
    // TODO: payload should be some kind of protocol
  )
}

pub fn new(
  retry_policy: retry_policy.RetryPolicy,
  payload: Option(String),
) -> Task {
  Task(task_id.new(), task_status.Pending, retry_policy, payload, 0)
}

// Updaters
pub fn update_status(task: Task, status: task_status.TaskStatus) -> Task {
  Task(task.id, status, task.retry_policy, task.payload, task.retries)
}

pub fn increment_retries(task: Task) -> Task {
  Task(task.id, task.status, task.retry_policy, task.payload, task.retries + 1)
}

// Getters
pub fn id(task: Task) -> task_id.TaskId {
  task.id
}

pub fn status(task: Task) -> task_status.TaskStatus {
  task.status
}

pub fn payload(task: Task) -> Option(String) {
  task.payload
}

pub fn retry_policy(task: Task) -> retry_policy.RetryPolicy {
  task.retry_policy
}

pub fn retries(task: Task) -> Int {
  task.retries
}

// Logic
pub fn should_retry(task: Task) -> Bool {
  case task.status {
    task_status.Failure ->
      retries(task) < retry_policy.max_retries(retry_policy(task))
    _ -> False
  }
}
