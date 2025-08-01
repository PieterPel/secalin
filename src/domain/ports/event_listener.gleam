import domain/entities/event

pub type EventListener(error) {
  EventListener(handle_event: fn(event.Event) -> Result(Nil, error))
}
