import gleam_uuid

pub type TaskId {
  TaskId(id: String)
}

pub fn new() -> TaskId {
  let id = gleam_uuid.v4()
  TaskId(id)
}
