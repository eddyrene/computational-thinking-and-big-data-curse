library(janeaustenr)
library(tidytext)
library(dplyr)
library(stringr)


austen <- austen_books()
original_books <- austen_books() %>%  group_by(book) %>%  mutate(linenumber = row_number(),
         chapter = cumsum(str_detect(text, regex("^chapter [\\divxlc]",
                                                 ignore_case = TRUE)))) %>%  ungroup()
original_books


tidy_books <- original_books %>% unnest_tokens(word, text)
tidy_books %>% anti_join(stop_words) %>% count(word, sort = TRUE)


## graphing 
tidy_books %>% anti_join(stop_words) %>%
  count(word, sort = TRUE) %>%
  filter(n > 700) %>%
  ggplot(aes(word, n)) +
  geom_col()



library(gutenbergr)

oliver_twist <- gutenberg_download(730)
oliver_twist
alice_books <- gutenberg_download(c(11,12))

tidy_books_alice <- alice_books %>% unnest_tokens(word, text)
rpta <- tidy_books_alice %>% anti_join(stop_words) %>% count(word, sort = TRUE)

rpta[10,]

library(ggplot2)

tidy_books_alice %>% anti_join(stop_words) %>%
  count(word, sort = TRUE) %>%
  filter(n > 200) %>%
  ggplot(aes(word, n)) +
  geom_col()

