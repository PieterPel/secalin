//// Module that defines a queue

import domain/entities/task
import domain/value_objects/queue_name

/// Queue
///
pub opaque type Queue {
  Queue(name: queue_name.QueueName, tasks: List(task.Task))
}

pub fn new(name: queue_name.QueueName) -> Queue {
  Queue(name: name, tasks: [])
}
