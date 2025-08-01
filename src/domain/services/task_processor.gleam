import domain/entities/event
import domain/entities/task
import domain/entities/task_result
import domain/ports/ports
import domain/value_objects/task_status
import gleam/result

pub fn process_task(
  task: task.Task,
  ctx: ports.Ports(e),
) -> Result(task.Task, e) {
  let task = task.update_status(task, task_status.InProgress)

  use _ <- result.try(ctx.event_publisher.publish(event.TaskStarted(task)))

  use task <- result.try(ctx.task_repository.save(task))

  use task_result <- result.try(ctx.executor.execute(task))

  let #(new_status, new_event) = case task_result {
    task_result.Success(payload) -> {
      #(task_status.Success, event.TaskCompleted(task, payload))
    }

    task_result.Failure(reason) -> {
      #(task_status.Failure, event.TaskFailed(task, reason))
    }
  }

  let task = task.update_status(task, new_status)

  use task <- result.try(ctx.task_repository.save(task))

  use _ <- result.try(ctx.event_publisher.publish(new_event))

  Ok(task)
}
