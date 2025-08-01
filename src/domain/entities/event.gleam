//// Module that defines an event

import domain/entities/queue
import domain/entities/task
import domain/entities/worker
import domain/value_objects/trigger
import gleam/option.{type Option}

/// Event
///
pub type Event {
  TaskCreated(task: task.Task)
  TaskScheduled(task: task.Task, trigger: trigger.Trigger)
  TaskSent(task: task.Task)
  TaskStarted(task: task.Task)
  TaskCompleted(task: task.Task, output: Option(String))
  TaskFailed(task: task.Task, reason: String)
}
