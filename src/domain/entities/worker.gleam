//// Module that defines a worker

import domain/entities/task

/// WorkerStatus
///
pub type WorkerStatus {
  Working(task: task.Task)
  Idle
}

/// Worker
///
pub opaque type Worker {
  Worker(status: WorkerStatus)
}

pub fn new() -> Worker {
  Worker(status: Idle)
}
