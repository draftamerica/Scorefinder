# SCOREFINDER

This is a passion project based on my love and sports and specifically the NFL. I used an API call from a website called Sportradar to retrieve scores from 256 regular-season games from the 2016 season, as well as scoring summaries and team statistics. Users can save their favorite team upon logging in and interact with other users by commenting on individual games.


# Code snippet

In the snippet below, this is the first portion of the concatenation of the Sportradar API link within my Teams controller. If you were to implement your own Sportradar API key, you could either hardwire it as part of the string or store it in a variable in the secrets.yml file.

    base_url = "https://api.sportradar.us/nfl-"
    access_level = "ot"
    version = 2
    year = 2016
    nfl_season = "REG"
    format = "json"

    nfl_url = base_url
    nfl_url += access_level
    
# Motivation

I wanted to make a beautified version to trump the bevy of all-flash-no-substance sites most users go to for their NFL scores and stats. A clean and concise design and something easy to navigate.

# API Reference

To look at the different API documentation Sportradar offers and to see a few of the ones used in this project, you can go here:

https://developer.sportradar.com/files/indexFootball.html#nfl-official-api-v2

# Deployment

This app was deployed using Heroku and is available as a demo at https://scorefinder.herokuapp.com.
