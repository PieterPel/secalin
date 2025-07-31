# secalin
[![Package Version](https://img.shields.io/hexpm/v/secalin)](https://hex.pm/packages/secalin)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/secalin/)

```sh
gleam add secalin@1
```
```gleam
import secalin

pub fn main() -> Nil {
  // TODO: An example of the project in use
}
```

Further documentation can be found at <https://hexdocs.pm/secalin>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
```

## Repo layout
gleam-task-queue/
├── README.md
├── gleam.toml                      # Project configuration
├── manifest.toml                   # Dependency lock file
├── .gitignore
├── .github/
│   └── workflows/
│       ├── ci.yml
│       └── release.yml
├── docs/                           # Documentation
│   ├── architecture.md
│   ├── getting-started.md
│   └── api-reference.md
├── examples/                       # Usage examples
│   ├── basic_usage/
│   ├── web_scraping/
│   └── data_processing/
├── test/                          # Test files mirror src structure
│   ├── gleam_task_queue_test.gleam
│   ├── domain/
│   │   ├── task_test.gleam
│   │   ├── queue_test.gleam
│   │   └── worker_test.gleam
│   ├── infrastructure/
│   │   ├── mnesia_task_repository_test.gleam
│   │   ├── otp_worker_pool_test.gleam
│   │   └── erlang_scheduler_test.gleam
│   └── application/
│       ├── task_service_test.gleam
│       └── queue_service_test.gleam
├── src/
│   ├── gleam_task_queue.gleam     # Main module/public API
│   │
│   ├── domain/                    # Core business logic (hexagon center)
│   │   ├── entities/
│   │   │   ├── task.gleam        # Task entity
│   │   │   ├── queue.gleam       # Queue entity
│   │   │   ├── worker.gleam      # Worker entity
│   │   │   └── result.gleam      # Task result entity
│   │   ├── value_objects/
│   │   │   ├── task_id.gleam
│   │   │   ├── queue_name.gleam
│   │   │   ├── task_status.gleam
│   │   │   └── retry_policy.gleam
│   │   ├── services/              # Domain services
│   │   │   ├── task_processor.gleam
│   │   │   ├── retry_handler.gleam
│   │   │   └── priority_calculator.gleam
│   │   └── ports/                 # Interfaces (driven ports)
│   │       ├── task_repository.gleam
│   │       ├── worker_pool.gleam
│   │       ├── scheduler.gleam
│   │       ├── event_publisher.gleam
│   │       └── metrics_collector.gleam
│   │
│   ├── application/               # Application layer (use cases)
│   │   ├── commands/             # Command handlers
│   │   │   ├── enqueue_task.gleam
│   │   │   ├── cancel_task.gleam
│   │   │   ├── retry_task.gleam
│   │   │   └── purge_queue.gleam
│   │   ├── queries/              # Query handlers
│   │   │   ├── get_task_status.gleam
│   │   │   ├── list_tasks.gleam
│   │   │   ├── queue_statistics.gleam
│   │   │   └── worker_health.gleam
│   │   ├── services/             # Application services
│   │   │   ├── task_service.gleam
│   │   │   ├── queue_service.gleam
│   │   │   ├── worker_service.gleam
│   │   │   └── monitoring_service.gleam
│   │   └── dto/                  # Data Transfer Objects
│   │       ├── task_dto.gleam
│   │       ├── queue_dto.gleam
│   │       └── statistics_dto.gleam
│   │
│   ├── infrastructure/           # Infrastructure layer (adapters)
│   │   ├── persistence/         # Database adapters
│   │   │   ├── mnesia_task_repository.gleam
│   │   │   ├── mnesia_queue_repository.gleam
│   │   │   └── mnesia_schema.gleam
│   │   ├── messaging/           # Event/message adapters
│   │   │   ├── otp_event_publisher.gleam
│   │   │   └── gen_server_subscriber.gleam
│   │   ├── scheduling/          # Scheduler adapters
│   │   │   ├── erlang_scheduler.gleam
│   │   │   └── cron_scheduler.gleam
│   │   ├── workers/             # Worker pool adapters
│   │   │   ├── otp_worker_pool.gleam
│   │   │   ├── supervisor_tree.gleam
│   │   │   └── worker_process.gleam
│   │   ├── monitoring/          # Monitoring adapters
│   │   │   ├── telemetry_metrics.gleam
│   │   │   ├── prometheus_exporter.gleam
│   │   │   └── logger_adapter.gleam
│   │   └── serialization/       # Serialization adapters
│   │       ├── json_serializer.gleam
│   │       └── binary_serializer.gleam
│   │
│   ├── interfaces/              # External interfaces (driving adapters)
│   │   ├── http/               # HTTP API
│   │   │   ├── routes/
│   │   │   │   ├── task_routes.gleam
│   │   │   │   ├── queue_routes.gleam
│   │   │   │   └── health_routes.gleam
│   │   │   ├── middleware/
│   │   │   │   ├── auth_middleware.gleam
│   │   │   │   ├── cors_middleware.gleam
│   │   │   │   └── rate_limit_middleware.gleam
│   │   │   ├── handlers/
│   │   │   │   ├── task_handler.gleam
│   │   │   │   └── admin_handler.gleam
│   │   │   └── server.gleam
│   │   ├── cli/                # Command Line Interface
│   │   │   ├── commands/
│   │   │   │   ├── start_worker.gleam
│   │   │   │   ├── enqueue.gleam
│   │   │   │   └── status.gleam
│   │   │   └── cli_main.gleam
│   │   └── client/             # Client library
│   │       ├── task_client.gleam
│   │       └── admin_client.gleam
│   │
│   ├── shared/                 # Shared utilities
│   │   ├── errors/
│   │   │   ├── domain_errors.gleam
│   │   │   ├── infrastructure_errors.gleam
│   │   │   └── application_errors.gleam
│   │   ├── types/
│   │   │   ├── common_types.gleam
│   │   │   └── result_types.gleam
│   │   ├── utils/
│   │   │   ├── json_utils.gleam
│   │   │   ├── time_utils.gleam
│   │   │   └── validation_utils.gleam
│   │   └── config/
│   │       ├── app_config.gleam
│   │       └── mnesia_config.gleam
│   │
│   └── supervision/            # OTP supervision trees
│       ├── root_supervisor.gleam
│       ├── worker_supervisor.gleam
│       ├── queue_supervisor.gleam
│       └── infrastructure_supervisor.gleam
│
├── priv/                      # Private application files
│   ├── static/               # Static web assets (if HTTP interface used)
│   └── migrations/           # Mnesia schema migrations
│       ├── 001_initial_schema.gleam
│       └── 002_add_priority_field.gleam
│
└── config/                   # Configuration files
    ├── dev.gleam
    ├── test.gleam
    ├── prod.gleam
    └── sys.config           # Erlang system configuration
