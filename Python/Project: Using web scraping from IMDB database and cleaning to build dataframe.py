#HW04 -Using web scraping from IMDB database and cleasening to build dataframe
##import funciton
#!pip install -U gazpacho
from gazpacho import get, Soup
import requests
import pandas as pd
##web scraping basics

url = "https://www.imdb.com/search/title/?sort=user_rating,desc&groups=top_100"

html = requests.get(url) 
imdb = Soup(html.text)

##list comprehension
titles = imdb.find("h3", {"class": "lister-item-header"})
clean_titles = [title.find("a").text for title in titles]

ratings = imdb.find("div", {"class": "inline-block ratings-imdb-rating"})
clean_ratings = [rating.text for rating in ratings]

# Create a DataFrame
movie_database = pd.DataFrame(data={
    "Title": clean_titles,
    "IMDb Rating": clean_ratings
})
print(movie_database.head())
