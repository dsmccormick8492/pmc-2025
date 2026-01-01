library(tidyverse)

# start with the original full names
path <- "why-I-ride-names.txt"
names_df <- readr::read_csv(path)

first_name_pattern <- "^\\w+"
last_name_pattern <- "\\w+$"
first_letter_pattern <- "^\\w"

names_df <- names_df |> 
  mutate(
    first_name = str_extract(full_name, first_name_pattern),
    last_name = str_extract(full_name, last_name_pattern),
    last_initial = str_extract(last_name, first_letter_pattern),
    abbreviated_name = str_glue("{first_name} {last_initial}.")
  )

path <- "why-I-ride-names.csv"
write_csv(names_df, path)

# read back in after hand-editing and save the abbreviated names
path <- "why-I-ride-names.csv"
names_df <- read_csv(path)

abbreviated_names <- names_df |> pull(abbreviated_name)

result <- map(abbreviated_names, ~str_glue("{.x}\\")) |>
  unlist()
result

path <- "why-I-ride-names-abbreviated.txt"
write_lines(result, path)
