# HTML doc
bookdown::render_book("index.Rmd", "bookdown::gitbook", new_session = TRUE)

# PDF book
bookdown::render_book("index.Rmd", "bookdown::pdf_book", new_session = TRUE)
