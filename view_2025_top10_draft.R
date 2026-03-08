#install necessary packages for data analysis
install.packages(c("dplyr", "tidyverse", "readr", "ggplot2"))

used_library <- c("dplyr", "tidyverse", "readr", "ggplot2")
lapply(used_library, library, character.only = TRUE)
#read data that we scraped from basketball references and transformed with Tablaeu
df_2025draft <- read_csv("2025draft_10_picks.csv")
View(df_2025draft)

#we split the data by the names of each rookie
split_df_dplyr <- df_2025draft %>%
  group_by(Names) %>%
  group_split()

split_df_dplyr

#a function to rename each dataframe to the players name
get_player_name <- function(list) { 
  
  temp_vec <- c()
  
  for (i in seq_along(list)) {
  
    temp_val <- list[[i]][1, "Names"]
  
    temp_vec <- c(temp_vec, temp_val)
    
  }
  
  names(list) <- temp_vec
  
  return(list)
}

split_df_dplyr <- get_player_name(split_df_dplyr)

#check if the function had worked
names(split_df_dplyr)

#create a graph from the original df to see the impact each player had on the game using their
#points versus how much impact those points were through fg%
ggplot(data = df_2025draft, aes(x = df_2025draft$PTS, y = df_2025draft$`FG%`, color = Names)) +
  geom_point() +
  geom_line() + 
  labs(
    title = "Points vs. Field Goal Percentages", 
    x = "Points", 
    y = "Field Goal Percentages"
  ) + 
  theme_minimal()

#create a graph from the original df to see the impact each player had on the game using their
#points versus how much impact those points were through +/-
ggplot(data = df_2025draft, aes(x = df_2025draft$PTS, y = df_2025draft$`+/-`, color = Names)) +
  geom_point() + 
  geom_line() + 
  labs(
    title = "Points vs. PLus/Minus", 
    x = "Points", 
    y = "PLus/Minus"
  ) + 
  theme_classic()

#a function that calculates and returns the average point for each dataframe entered of a player
average_points <- function(list) { 
  
  return(mean(list$PTS))
  
}

average_points(split_df_dplyr$ace)
average_points(split_df_dplyr$cooper)
average_points(split_df_dplyr$kon)

#a function that calculates and returns the average anything from the player for each dataframe entered of a player
average_player <- function(list, col) { 
  
  
  col_num <- as.numeric(list[[col]])
  return(mean(col_num,na.rm = T))
  
}

average_player(split_df_dplyr$ace, "PF")
average_player(split_df_dplyr$cooper, "MP")
average_player(split_df_dplyr$kon, "FGA")

#a function that calculates and returns the point total for each dataframe entered of a player where a player has the highest game score
pts_from_max_gmsc <- function(list) { 
  
  results <- list$PTS[which.max(list$GmSc)]
  
  return(results)
  
}

pts_from_max_gmsc(split_df_dplyr$dylan)

#a function that calculates and returns the average PRA for each dataframe entered of a player
average_pra <- function(list) { 
  
  avg_pra <- c(mean(list$PTS), mean(list$TRB), mean(list$AST))
  
  return(avg_pra)
  
}

average_pra(split_df_dplyr$ace)
average_pra(split_df_dplyr$cooper)
average_pra(split_df_dplyr$vj)


