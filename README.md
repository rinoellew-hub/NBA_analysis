# About the Project
A beginning project of applying data analysis on scrapping data and formulating both graphs and values on NBA stats using R. We'll have to take these data values with a grain of salt, as it is only a five game sample size for each player. For our case, we are taking the top 10 rookies from this years draft class starting from Cooper Flagg to Khaman Maluach and their last five games from a certain time period during the 2025-2026 season. We can also take into consideration that these players are playing their rookie season and some values maybe disproportionate to what would be considered the median player.   

<b>Built with </b></br>
![R](https://img.shields.io/badge/r-%23276DC3.svg?style=for-the-badge&logo=r&logoColor=white)

# Getting Started
We begin with taking data from <a href="https://www.basketball-reference.com/">Basketball Reference</a>. In our case
we take the last 5 games played (from our example, the last 5 games may be different than yours) from the first 10 players drafted in 2025. Take those .xlsx files (if they are just .xls, change it to .xlsx). </br>

<b> Transforming Data </b> </br>
We combine and transform each excel sheet via Tablaeu or any tools you maybe comfortable with. Our clean data is then going to be used in R.

# Usage

There are many ways we can start the data analysis process using the tables we have collect and transformed so far. 

## Graphs

<img width="970" height="1200" alt="image" src="https://github.com/user-attachments/assets/e9e5de4a-1f4b-41d8-bc41-2151ed48f69c" />

<b> Figure 1. Comparing 10 rookies through their last 5 games using their points vs. their +/-. </b></br>
<ul>
  <li> We see that Kon Kneuppel, who was taken 4th overall by the Charlotte Hornets have an impactful five game strecth with a wide variety of points in each game.  </li> 
</ul>

<img width="970" height="1207" alt="image" src="https://github.com/user-attachments/assets/250c98ff-dfc5-4332-b633-6e613fc7c4f5" />

<ul>
  <li> We see that in our small sample size Cooper Flagg, who was taken 1st overall by the Dallas Mavericks have this strencth where his efficiency goes up when he scores more points. </li> 
</ul>

<b> Figure 2. Comparing the 10 rookies through their last 5 games using their points vs. their field goal percentage.  </b></br>

## Search
From our script we can also search the players average points per game through the 5 game sample size by this code. 
```
   mean(df$player_name$PTS) 
   ```
<ul>
  <li> Example: Cooper Flagg - 25.4 pts  </li> 
</ul>

A function can also be helpful if you don't want to repeat the code.  
```
  
average_player <- function(list, col) { 
  
  
  col_num <- as.numeric(list[[col]])
  return(mean(col_num,na.rm = T))
  
}
   ```
<ul>
  <li> Example: Ace Bailey - 3.4 pf  </li> 
</ul>

Or we can get all a players average PRA from using a function again. 
```
   average_pra <- function(list) { 
  
  avg_pra <- c(mean(list$PTS), mean(list$TRB), mean(list$AST))
  
  return(avg_pra)
  
  }

  average_pra(df$player_name)
   ```
<ul>
  <li> Example: VJ Edgecombe - 19.0 pts, 6.2 rbs, 2.6 ast  </li> 
</ul>

A special feature is we can apply SQL type search to find; for example, the point of the highest game score of a player
```
pts_from_max_gmsc <- function(list) { 
  
  results <- list$PTS[which.max(list$GmSc)]
  
  return(results)
  
}
   ```
<ul>
  <li> Example: Dylan Harper - 22 pts  </li> 
</ul>