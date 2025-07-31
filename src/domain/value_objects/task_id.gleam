//// Module that defines a task id

import gluid

/// TaskId
///
pub opaque type TaskId {
  TaskId(id: String)
}

pub fn new() -> TaskId {
  let id = gluid.guidv4()
  TaskId(id)
}
