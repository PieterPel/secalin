//// Modle that defines the scheduler port

import domain/entities/task
import domain/value_objects/trigger


/// Scheduler
///
pub type Scheduler(error) {
  Scheduler(
    schedule: fn(task.Task, trigger.Trigger) -> Result(Nil, error),
    cancel: fn(task.Task) -> Result(Nil, error),
    pending_tasks: fn() -> List(task.Task),
    running_tasks: fn() -> List(task.Task),
  )
}
