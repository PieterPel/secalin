//// Module that defines a trigger

import gleam/time/timestamp.{type Timestamp}

/// Trigger
///
pub type Trigger {
  Now
  Later(Timestamp)
}
