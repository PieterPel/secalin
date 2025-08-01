//// The retry_handler service is responsible for retrying a failed task

import domain/entities/event
import domain/entities/task
import domain/ports/ports
import domain/value_objects/retry_policy
import domain/value_objects/task_status
import domain/value_objects/trigger
import gleam/result

/// Retry a failed task
pub fn retry(task: task.Task, ctx: ports.Ports(e)) -> Result(task.Task, e) {
  case task.should_retry(task) {
    False -> {
      Ok(task)
    }

    True -> {
      let task = task.increment_retries(task)
      let task = task.update_status(task, task_status.Retrying)

      use task <- result.try(ctx.task_repository.save(task))

      let retry_policy = task.retry_policy(task)

      let delay = retry_policy.delay(retry_policy)

      let trigger = trigger.later(delay)

      use _ <- result.try(ctx.scheduler.schedule(task, trigger))

      use _ <- result.try(
        ctx.event_publisher.publish(event.TaskScheduled(task, trigger)),
      )

      Ok(task)
    }
  }
}
