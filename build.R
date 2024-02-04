course_name = "Creating synthetic data with R"

output_path <- paste0("../", 
  gsub(x = tolower(course_name), pattern = " ", 
       replacement =  "_", fixed = TRUE), ".pdf")

setwd("./notebooks")

bookdown::render_book(
  input = dir(pattern = ".Rmd"),
  output_format = "bookdown::pdf_book",
  new_session = FALSE)

pagedown::chrome_print(
  input = "_main.html",
  output = output_path,
  options = list(pageRanges = "3-"),
  timeout = 200,
  extra_args = c("--disable-gpu", "--no-sandbox"))

unlink("_main*", recursive = TRUE, force = TRUE)
unlink("_book*", recursive = TRUE, force = TRUE)
setwd("..")
