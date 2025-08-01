import domain/entities/task
import domain/entities/task_result

pub type Executor(error) {
  Executor(execute: fn(task.Task) -> Result(task_result.TaskResult, error))
}
