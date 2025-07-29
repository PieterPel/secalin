import gluid

pub opaque type TaskId {
  TaskId(id: String)
}

pub fn new() -> TaskId {
  let id = gluid.guidv4()
  TaskId(id)
}
