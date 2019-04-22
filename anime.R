library(dplyr)

tidy_anime <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-04-23/tidy_anime.csv")

colSums(is.na(tidy_anime))

tidier_anime <- tidy_anime %>%
  select(animeID, name, source, episodes, status, start_date, end_date, duration, rating, score,
         scored_by, rank, popularity, members, favorites) %>%
  na.omit()

rating <- tidier_anime %>%
  filter(rating != "None") %>% 
  mutate(rating_reduced = case_when(rating == "G - All Ages" ~ "PG or lower",
                                    rating == "PG - Children" ~ "PG or lower",
                                    rating == "PG-13 - Teens 13 or older" ~ "PG-13",
                                    rating == "R - 17+ (violence & profanity)" ~ "R",
                                    rating == "R+ - Mild Nudity" ~ "R"))