

#' Get a list of datasets available on GigaDB
#'
#' @export
#' @import httr
#' @examples \dontrun{
#' datasets <- gig_datasets()
#'}
gig_datasets <- function() {	
url <- "http://gb.cbiit.cuhk.edu.hk/api/query/datasets"
results <- GET(url)
warn_for_status(results)
message("Parsing these data are currently slow and may take several minutes \n")
content <- xmlParse(content(results, "text"))
x <- xmlToList(content)
flattened_results <- lapply(x, LinearizeNestedList)
flattened_results
}
# [TODO]
# This is somewhat slow and ugly
# Each pub has different number of files, need to figure out a good data structure for these.
