# DBA-Test

Task Details

You will be provided two CSV files, one filled with fake data for Canadian citizens and one filled with fake data for US citizens, and we'd like you to do the following.

1. Put them both into one table but include a new column that indicates whether they are from Canada or the US. This new column should just be an ID that links to a different table that describes their country.

2. Keep a record of how many new rows have been inserted into the citizen table by creating a trigger that will update a counter. There should be separate counts maintained for each country.

3. Create a procedure that when passed a country, returns every citizen record for that country. This procedure should also reset the counter for the country requested to 0.

4. Transfer the citizens table to a Mongo database.

5. Backup the entire MySQL database, including the trigger and procedure. Also export the Mongo database.
