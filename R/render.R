future::plan(future::multisession, workers = future::availableCores())
progressr::with_progress({
  # dirs <- list.dirs('.', recursive = FALSE)
  dirs <- 2025 |> as.character()
  files <-
    dirs[grepl('\\d{4}$', dirs)] |>
    purrr::map(\(d) {
      list.files(d, pattern = 'qmd$', recursive = TRUE, full.names = TRUE)
    }) |>
    unlist()
  p <- progressr::progressor(along = files)
  furrr::future_walk(files, \(f) {
    quarto::quarto_render(f)
    p()
  })
},
handlers = progressr::handler_cli())
future::plan(future::sequential)
