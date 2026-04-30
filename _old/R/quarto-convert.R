events <- list.files("_old/content/event", recursive = TRUE, full.names = TRUE)

folders <- list.dirs("_old/content/event", full.names = FALSE)
folders <- folders[folders != ""]

dir.create("talk", showWarnings = FALSE)
dir.create("talk/images", showWarnings = FALSE)

for (f in folders) {
  md <- paste0("_old/content/event/", f, "/index.md")
  qmd <- paste0("talk/", f, ".qmd")
  file.copy(md, qmd, overwrite = TRUE)
  
  
  img <- events[grepl(paste0(f, "/featured"), events, fixed = TRUE)]
  suffix <- substr(img, nchar(img)-2, nchar(img))
  img2 <- paste0("talk/images/", substr(f, 12, nchar(f)), ".", suffix)
  file.copy(img, img2, overwrite = TRUE)
  
  txt <- readLines(qmd)
  newtxt <- gsub("^tags:", "categories:", txt) |>
    gsub("^image:.*$", paste("image:", gsub("talk/", "", img2)), x = _) |>
    gsub("  caption:.*$", "", x = _) |>
    gsub("  focal_point:.*$", "", x = _)
  
  write(newtxt, qmd)
}


# stubs

posts <- list.files("post", "\\.qmd$", full.names = TRUE)

for (p in posts) {
  txt <- readLines(p)
  slug <- txt[grepl("^slug:", txt)] |> gsub("slug: ", "", x = _) |> trimws()
  
  newname <- paste0("post/", slug, ".qmd")
  file.rename(p, newname)
}
