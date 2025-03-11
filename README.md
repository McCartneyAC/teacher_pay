# teacher pay
### exploring by state teacher pay data 2018

Using data from [NPR](https://www.npr.org/sections/ed/2018/03/16/592221378/the-fight-over-teacher-salaries-a-look-at-the-numbers), I have turned their graph into a dataframe for each state with average teacher pay and average teacher pay adjusted for cost of living. I have hard coded states that have had teacher strikes in 2018 via [this NPR article](https://www.npr.org/sections/ed/2018/04/25/602859780/teacher-walkouts-a-state-by-state-guide) as well, in order to visualize their distribution. 

Additional variables likely to be added later as the project grows. 

See [Brookings](https://www.brookings.edu/blog/brown-center-chalkboard/2018/04/13/which-states-might-experience-the-next-wave-of-teacher-strikes/) for a more rigorous examination of the data. 

### Meta Data

Variable Name	|Variable Description
------------ | -------------
state	| State Name
abbreviation	| State Abbreviation
adjusted_pay	| Average Teacher Pay adjusted for Cost of Living
actual_pay	| Average Teacher Pay in Raw Numbers
strike2018_2019	| Had a teacher strike in 2018-2019 school year
population2018	| State population in 2018
percent_union2018	| Percent of all workers who are in a union in 2018
log_pop	| Logarithm of the state's population (not sure if natural log or common log :( )
division	| Census Division Number
div_name	| Census Division Name
pct_white_2012	| Percent of Population listed as "White/Caucasian" in 2012
SatScore	| Average SAT Score
SatReading	| Average SAT Reading
SatMath	| Average SAT Math
clinton_votes_2016	| Clinton Votes in 2016
pct_clinton_2016	| Percent who voted Clinton in 2016
clinton_electoral_2016	| Clinton Electoral Votes
trump_votes_2016	| Trump Votes in 2016
pct_trump_2016	| Percent who voted Trump in 2016
trump_electoral_2016	|  Trump Electoral Votes
biden_votes_2020 | Biden raw vote counts in 2020
pct_biden_2020 | Percent of vote share went to Biden
biden_electoral_2020 | Electoral votes in that state. NE and ME have been aggregated.
trump_votes_2020 | Trump Vote Share 
pct_trump_2020 |  Trump votes Percent
trump_electoral_2020 | Trump Electoral votes
vax_rate |  Rate of Eligible adults fully vaccinated on june 9, 2021
urban_2020 | percent of the state considered urban by the US census in 2020
GINI_2019 | GINI coefficient for the state, wealth inequality. 
pct_religious | percent who are not listed as "atheist" or "none"
pct_hs_diploma | percent of state above age 25 with high school diploma
pct_bach_deg | percent of state above age 25 with a bachelors degree
pct_advanced_deg | percent of state above age 25 with an advanced degree
viol_crime_per_100k | count of violent crime per 100,000 residents, 2022
alcohol_deaths_100k | count of alcohol-related deaths in the state per 100,000 residents, 2022
drug_overdose_per_100k | count of drug-overdose related deaths in the state per 100,000 residents, 2022
suicides_per_100k | completed suicides per 100,000 residents, 2022
          

##### NPR Data source given as:
Source: National Center for Education Statistics, Council of Community and Economic Research, EdBuild analysis
Credit: Hilary Fung/NPR

### How does teacher pay relate to Teacher Strikes?

![model one](https://github.com/McCartneyAC/teacher_pay/blob/master/model1.png?raw=true)

### How does politics interplay with Vaccine takeup? 

![model](https://github.com/McCartneyAC/teacher_pay/blob/master/vax_rates.png?raw=true)
