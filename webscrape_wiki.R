library(xml2)
library(rvest)
library(data.table)
library(stringr)

rm(list = ls())

url <-
  c(
    "https://en.wikipedia.org/wiki/List_of_trees_of_Great_Britain_and_Ireland",
    "https://en.wikipedia.org/wiki/List_of_trees_of_Denmark",
    "https://en.wikipedia.org/wiki/List_of_indigenous_trees_and_shrubs_of_Lithuania",
    "https://en.wikipedia.org/wiki/Category:Trees_of_the_United_States",
    "https://en.wikipedia.org/wiki/Category:Trees_of_Canada"
  )

df <- NULL

for (i in url) {
  print(i)
  html <- paste(readLines(i), collapse = "\n")
  matched <- str_match_all(html, "<a href=\"(.*?)\"")
  links <- matched[[1]][, 2]
  links <- as.data.table(links)
  colnames(links)[1] <- "url"
  links <- links[links$url %like% "wiki/", ]
  links <- links[links$url %like% "_", ]
  links <- links[!(links$url %like% ".jpg"), ]
  links <- links[!(links$url %like% ".JPG"), ]
  links <- links[!(links$url %like% "https:"), ]
  df <- rbind(df, links)
  
}

nrow(df)
df <- df[, .(count = .N), by = url]
head(df)

#Remove common links
df <- subset(df, count < 3)
nrow(df)

#Only select links with one _
df$num <- str_count(df$url, "_")
df <- subset(df, num == 1, select = c(url))

#Write to csv
write.csv(df, "treelinks.csv", row.names = F)
