pub type RetryPolicy {
    RetryPolicty(max_retries: Int, delay_seconds: Int)
}

pub fn new(max_retries: Int, delay_seconds: Int) -> Result(RetryPolicy, String) {
    case max_retries < 0, delay_seconds < 0 {
        True, _ -> Error("max_retries must be greater than 0")

        _, True -> Error("delay_seconds must be greater than 0")

        _, _ -> Ok(RetryPolicty(max_retries, delay_seconds))
    }
}
