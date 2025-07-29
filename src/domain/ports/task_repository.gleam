import domain/entities/task
import domain/value_objects/task_id

pub type TaskRepository(error) {
    TaskRepository(
      save: fn(task.Task) -> Result(task.Task, error),
      find_by_id: fn(task_id.TaskId) -> Result(task.Task, error),
      update: fn(task.Task) -> Result(task.Task, error),
    )
}
