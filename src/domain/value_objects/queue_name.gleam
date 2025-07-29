pub opaque type QueueName {
  QueueName(name: String)
}

pub fn new(name: String) -> QueueName {
  QueueName(name)
}
