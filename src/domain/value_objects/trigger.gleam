//// Module that defines a trigger

import gleam/time/duration.{type Duration}
import gleam/time/timestamp

/// Trigger
///
pub opaque type Trigger {
  Now
  Later(timestamp.Timestamp)
}

pub fn now() -> Trigger {
  Now
}

pub fn later(duration: Duration) -> Trigger {
  let now = timestamp.system_time()
  let timestamp = timestamp.add(now, duration)
  Later(timestamp)
}
