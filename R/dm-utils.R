dm_ls <- function() {
  dm_command("ls")
}

dm_active <- function() {
  dm_command("active")
}

dm_ip <- function(machine = NULL) {
  dm_command("ip", machine = machine, stdout = TRUE)
}

dm_kill <- function(machine = NULL) {
  dm_command("kill", machine = machine)
}

dm_stop <- function(machine = NULL) {
  dm_command("stop", machine = machine)
}

dm_config <- function(machine = NULL, ...) {
  dm_command("config", ..., machine = machine)
}

dm_rm <- function(machine = NULL) {
  dm_command("rm", machine = machine, y="") # Force removal
}

dm_env <- function(machine = NULL, ...) {
  dm_command("env", ..., machine = machine)
}

dm_env_unset <- function() {
  dm_env(machine = NULL, u="")
}

dm_activate <- function(machine = NULL, ...) {

  # Debug mode to capture print
  dm_debug_old <- getOption("dm.debug", FALSE)
  options(dm.debug = TRUE)
  on.exit(options(dm.debug = dm_debug_old))

  env_cmd <- dm_env(machine, ...)

  system2("eval", args = paste0('"$(', env_cmd, ')"'))
}

dm_deactivate <- function() {
  dm_activate(machine = NULL, u="")
}
