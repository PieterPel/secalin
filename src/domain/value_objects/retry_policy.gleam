//// Module that defines a retry policy

import gleam/time/duration

/// RetryPolicy
///
pub opaque type RetryPolicy {
  RetryPolicty(max_retries: Int, delay: duration.Duration)
}

pub fn new(
  max_retries: Int,
  delay: duration.Duration,
) -> Result(RetryPolicy, String) {
  case max_retries < 0 {
    True -> Error("max_retries must be greater than 0")

    False -> Ok(RetryPolicty(max_retries, delay))
  }
}

// Getters
pub fn max_retries(retry_policy: RetryPolicy) -> Int {
  retry_policy.max_retries
}

pub fn delay(retry_policy: RetryPolicy) -> duration.Duration {
  retry_policy.delay
}
