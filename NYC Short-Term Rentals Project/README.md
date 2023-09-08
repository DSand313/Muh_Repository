# NYC Short-Term Rentals Project

## Background

This is a Masterschool project that takes a look at the short-term rentals situation in New York City to provide data insights for a real-estate start-up. It involves taking in Airbnb data, cleaning it, and analyzing it. The idea is to uncover key trends in popular neighborhoods, rental prices, property types, length of stay, and demand over time. The insights gained from this analysis has the potential to provide valuable information to the start-up on how to make informed business decisions.

## NYC Rentals Python Cleaning

This is the data cleaning portion of the project and it utilizes Python instead of Excel. There are three files that are imported and they are cleaned individually before being joined together on a shared column.
* The first file that is uploaded is "prices" and it is a CSV file. It has three columns: listing id(listing_id), the price of the listing per day(prices), and the full name of the neighborhood of the listing(nbhood_full).
    * The first step for cleaning this file was to get rid of the "dollars" string and any white space out of the "price" column. After 
      that we take a monthly average of the prices of all neighborhoods across New York City and compare it to the monthly average price 
      of private rentals.
* The second file is an Excel file that is named "room_types" and it has three columns as well: listing id(listing_id), a description of the room(description), and what kind of room that it is(room_type).
    * To clean this file, the "room_type" column is converted to being all lower case and is converted to a category data type. Then, 
      another variable is created to calculate the sum of how many of each room type there are across all neighborhoods.
* The last file is a TSV file called "reviews." It has three columns as well: listing id(listing_id), the name of the host's first name(host_name), and the date of the host's last review(last_review). This file seems to be pretty well formatted, so no cleaning was done to it. Instead, this is the point where everything gets joined on the "listing_id" column.
    * The combined file gets a little bit of cleaning in that we use a method on the newly created variable to drop any missing values 
      from the merge. A new variable is made based off of the "room_type" file where the "room_type" column is separated by boroughs and 
      then some summary statistics are then run to get a more full and clear picture of the state of the short-term rental market in NYC. 
      The sum, mean, and median of the price column is taken, as well as the count of the listing_id column. These are then all grouped 
      onto the newly created borough column.
The last part of the Python portion of this project was take each borough and break them down by affordability which were ranked as budget, average, expensive, and extravagent to get a better idea of which areas were more affordable than others.

## NYC Rentals Inquiries

This is the SQL code used to gather further insights into the dataset. There are ten queries that are used to inform further business decisions.
* The first query looks at the most common room type in the dataset, and this can be used to find out which type of housing accomodations 
  are most popular with guests.
* Query number two looks at the average price of a listing by room type, and this can be used to find out the acceptable price range for 
  the previously mentioned room types.
* Query three look at which borough has the highest average price per month, which can be used to target certain types of guests.
* Query four looks at how many listings of each type are in each borough, which can be used to see which types of housing situations are 
  popular in a given area.
* Query five looks at which listings have an average of over 500 dollars a night, which can help target higher paying customers.
* Query six breaks the boroughs down into neighborhoods and look at the min, avg, and max prices per night for listings in that area.
* Query seven looks at the yearly revenue brought in by each borough, which can show which boroughs have the highest profit potential.
* Query eight looks at the average price a month for listings in each neighborhood, which can help find the most popular neighborhoods 
  and can help target higher paying customers.
* Query nine looks at all of the listings that have no reviews at all, which can give us insight into potential improvements in the 
  market.
* Query ten looks at the correlation coefficient of booked days against the price of the listings in NYC.
