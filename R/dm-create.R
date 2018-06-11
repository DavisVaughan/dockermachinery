dm_create <- function(driver = "none", machine = NULL, ...) {
  dm_command("create", driver = driver, ..., machine = machine)
}
