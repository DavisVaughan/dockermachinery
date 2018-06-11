dm_command <- function(cmd, ..., machine = NULL, stdout = "") {
  dm <- "docker-machine"
  cmd_args <- c(cmd, dict_dots(...))

  if(!is.null(machine)) {
    cmd_args <- c(cmd_args, machine)
  }

  # Debug
  dm_debug <- getOption("dm.debug", FALSE)
  if(dm_debug) {
    return(paste(dm, paste0(cmd_args, collapse = " ")))
  }

  # Run command, optionally capture output
  system2(command = dm, args = cmd_args, stdout = stdout)
}

dict_dots <- function(...) {
  dots <- list(...)

  if(length(dots) == 0L) {
    return("")
  }

  dot_names <- names(dots)
  dot_values <- vapply(dots, function(x) as.character(x), FUN.VALUE = character(1))

  if(length(dot_names) != length(dot_values)) {
    stop("All ... arguments must be named.")
  }

  paste0("--", paste(dot_names, dot_values, sep = " "))
}
