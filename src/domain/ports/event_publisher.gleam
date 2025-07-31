//// Module that defines the  event publisher port

import domain/entities/event

/// EventPublisher
///
pub type EventPublisher(error) {
  EventPublisher(publish: fn(event.Event) -> Result(Nil, error))
}
