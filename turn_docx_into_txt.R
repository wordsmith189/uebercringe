mydir <- '/Users/LH9896/Library/CloudStorage/Box-Box/_TELL/Projects/TELL & H2TX/interview data H2TX/2024/INTERVIEW DATA: Language and History (Hinrichs)/0 - clean transcripts'

myfiles <- list.files(mydir, full.names = T)

outdir <- paste0(mydir, "/txt/")

p_load(officer)

for (i in myfiles){
  txti <- read_docx(i) |> 
    docx_summary() |> 
    select(text) |> 
    na.omit() 
  txti <- txti$text |> 
    paste(collapse = "\n") |> 
    tolower()
  outname <- i |> 
    basename() |> 
    tools::file_path_sans_ext()
  txti |> writeLines(paste0(outdir, outname, ".txt"))
}
