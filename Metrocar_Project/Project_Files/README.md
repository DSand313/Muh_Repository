# Metrocar Project

## Background

This is a Masterschool project that deals with a funnel analysis. In this case, it is a customer funnel analysis that shows the drop-off rate of individuals at each level of the funnel. Using this information, we can make recommendations to our stakeholders about which stages of the funnel would be a good idea to put their time and money. In addition to the code for the funnel analysis, I've created a visual representation of said funnel in Tableau [(link)](https://public.tableau.com/app/profile/james.sandusky/viz/MetrocarFunnelAnalysis_16937557351150/UserFunnel). I've also got a list of ten queries that give various insights into the dataset.

## Metrocar Funnel Analysis

This is the SQL code for the funnel analysis. In it, I use a few different analyses with varying degrees of granularity regarding the funnel stages: app downloads, signups, ride requests, transactions, and reviews.
* The first version of code that I run is the most basic version of the funnel that shows the user drop-off rate between each of the five stages. I do it with a "percent of first value" that attaches a percentage of how many users have dropped off relative to the initial funnel stage, which in this case is app downloads.
* The second version of this funnel is the same as the last one except it's done using a "percent of previous" that shows the user percentage change relative to the previous funnel stage.
* The third version of this funnel is one where I filter it on the age range column from the signups table. This method makes the app downloads and signups tables equivalent since the age range information first appears in the signups table, which is the second stage of the funnel. This version also looks at the percent of first value.
* The fourth version of this funnel is the same as the previous one, but with a percent of previous.
* The fifth version of this funnel expands the stages from 5 to 7, pulling information from 2 more columns from the ride requests table. It also looks at the total ride count drop-off from each stage.
* My sixth query is the dataset I use for the Tableau visualization. It includes the code for the original 5 stage user funnel with some extra filters for age range, platform (ios, android, web), and download date.

## Metrocar SQL Insights

This part of the project was just to provide some additional data insights and some preparatory queries to check against the actual funnel analysis. It's mostly some basic COUNT functions that look at some basic things like how many times the app was downloaded, how many users signed up through each platform, etc. 
