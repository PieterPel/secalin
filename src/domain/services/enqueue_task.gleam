//// The enqueue_task service is responsible for creating a new task and scheduling it for execution

import domain/entities/event
import domain/entities/task
import domain/ports/ports
import domain/value_objects/retry_policy
import domain/value_objects/trigger
import gleam/option.{type Option}
import gleam/result

/// Enqueue a new task
///
pub fn enqueue_task(
  payload: Option(String),
  retry_policy: retry_policy.RetryPolicy,
  ctx: ports.Ports(e),
) -> Result(task.Task, e) {
  let task = task.new(retry_policy, payload)
  use task <- result.try(ctx.task_repository.save(task))

  use _ <- result.try(ctx.event_publisher.publish(event.TaskCreated(task)))

  use _ <- result.try(ctx.scheduler.schedule(task, trigger.Now))

  Ok(task)
}
