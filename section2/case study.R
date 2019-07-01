library(janeaustenr)
library(tidytext)
library(dplyr)
library(stringr)

original_books <- austen_books() %>%  group_by(book) %>%  mutate(linenumber = row_number(),
         chapter = cumsum(str_detect(text, regex("^chapter [\\divxlc]",
                                                 ignore_case = TRUE)))) %>%  ungroup()

original_books
tidy_books <- original_books %>% unnest_tokens(word, text)

## show frecuency of worfs cleaning from stop words
tidy_books %>% anti_join(stop_words) %>% count(word, sort = TRUE)

## graphing 
tidy_books %>% anti_join(stop_words) %>%
  count(word, sort = TRUE) %>%
  filter(n > 700) %>%
  ggplot(aes(word, n)) +
  geom_col()


library(gutenbergr)