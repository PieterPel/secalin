//// Module that defines the collection of domain ports

import domain/ports/event_publisher
import domain/ports/metrics_collector
import domain/ports/scheduler
import domain/ports/task_repository
import domain/ports/worker_pool
import domain/ports/executor

/// Ports
///
pub type Ports(error) {
  Ports(
    event_publisher: event_publisher.EventPublisher(error),
    metric_collector: metrics_collector.MetricCollector,
    scheduler: scheduler.Scheduler(error),
    task_repository: task_repository.TaskRepository(error),
    worker_pool: worker_pool.WorkerPool(error),
    executor: executor.Executor(error)
  )
}
