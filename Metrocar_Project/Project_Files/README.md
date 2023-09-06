# Metrocar Project

## Background

This is a Masterschool project that deals with a funnel analysis. In this case, it is a customer funnel analysis that shows the dropoff rate of indiviuals at each level of the funnel. Using this information we can make recommendations to our stakeholders about which stages of the funnel would be a good idea to put their time and money. In addition to the code for the funnel analysis, I've created a visual representation of said funnel in Tableau. PUT LINK HERE. I've also got a list of ten queries that give various insights into the dataset.

## Metrocar Funnel Analysis

This is the SQL code for the funnel analysis. In it, I run a few different analyses with varying degrees of granularity regarding the funnel stages: app downloads, signups, ride requests, transactions, and reviews.
* The first version of code that I run is the most basic version of the funnel that shows the user dropoff rate between each of the five stages. I do it with a "percent of first value" that attaches a percentage of how many users have dropped off relative to the inital funnel stage, which in this case is app downloads.
* The second version of this funnel is done using a "percent of previous" that 
