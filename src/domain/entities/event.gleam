//// Module that defines an event

import domain/entities/queue
import domain/entities/task
import domain/entities/worker

/// Event
///
pub type Event {
  TaskCreated(task: task.Task)
  TaskScheduled(task: task.Task)
  TaskSent(task: task.Task, queue: queue.Queue)
  TaskStarted(task: task.Task, worker: worker.Worker)
  TaskCompleted(task: task.Task, worker: worker.Worker)
}
