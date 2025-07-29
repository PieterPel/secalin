import domain/entities/task
import gleam/time/timestamp.{type Timestamp}

pub type Trigger {
  Now
  Later(Timestamp)
}

pub type Scheduler(error) {
  Scheduler(
    schedule: fn(task.Task, Trigger) -> Result(Nil, error),
    running_tasks: fn() -> List(task.Task),
  )
}
