//// Module that defines the task repository port

import domain/entities/task
import domain/value_objects/task_id
import domain/value_objects/task_status

/// TaskRepository
///
pub type TaskRepository(error) {
  TaskRepository(
    save: fn(task.Task) -> Result(task.Task, error),
    find_by_id: fn(task_id.TaskId) -> Result(task.Task, error),
    find_by_status: fn(task_status.TaskStatus) -> Result(List(task.Task), error),
    delete: fn(task.Task) -> Result(Nil, error),
  )
}
