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
The last part of the Python portion of this project was take each borough and break them down by affordability which were ranked as budget, average, expensive, and extravagent.
## NYC Rentals Inquiries
