library(readxl)
library(tidyverse)
library(janitor)
library(reprex)
library(gt)

x <- read_excel(path = "class_enrollment_summary_by_term_2.13.20.xlsx", skip = 3) %>%
  clean_names() %>%
  filter(course_department == "Government") %>%
  arrange(desc(total)) %>%
  slice(1:5) %>%
  select(course_title, course_name, instructor_full_name, total) %>%
  gt() %>%
  tab_header(title = "Top Five Government Classes", 
             subtitle = "As of 02/13/2020")
x
