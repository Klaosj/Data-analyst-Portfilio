library(RPostgreSQL)
library(tidyverse)
library(RSQLite)


con <- dbConnect(PostgreSQL(), 
                 host = "rain.db.elephantsql.com",
                 port = 5432,
                 user = "zeikpmqb",
                 password = "aC3IB82-V32tPbjemSQ9zKCVZZaQFKDm",
                 dbname = "zeikpmqb")

dbListTables(con)

restuarant <- dbConnect(SQLite(), "restaurant.db")
dbListTables(restuarant)
dbListFields(restuarant, "customers")

df1 <- dbGetQuery(restuarant, "select * from customers")
df2 <- dbGetQuery(restuarant, "select * from menu")
df3 <- dbGetQuery(restuarant, "select * from ingredient")

View(df2)

## write table from DB file to database
dbWriteTable(con, "customers", df1)
dbWriteTable(con, "menu", df2)
dbWriteTable(con, "ingredient", df3)

dbListTables(con)
dbDisconnect(con)
