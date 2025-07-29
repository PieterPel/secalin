import domain/entities/worker

pub type WorkerPool(error) {
    WorkerPool(
        get_idle_worker: fn() -> Result(worker.Worker, error),
        pool_size: fn() -> Int,
        num_available_workers: fn() -> Int,
        release_worker: fn(worker.Worker) -> Result(Nil, error),
    )
}
