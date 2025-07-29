import domain/entities/task

pub type WorkerStatus {
  Working(task: task.Task)
  Idle
}

pub opaque type Worker {
  Worker(status: WorkerStatus)
}

pub fn new() -> Worker {
  Worker(status: Idle)
}
