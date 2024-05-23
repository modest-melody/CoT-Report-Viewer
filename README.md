# Commitments of Traders Viewer

## Overview
This Shiny application provides an interactive way to view the weekly Commitments of Traders (CoT) published by the Commodity Futures Trading Commission (CFTC). Users can select different markets, along with a date range, to explore historical and most recent CoT data. The application displays this information in an easy-to-read table, enhanced by color coding and detailed descriptions of each data column.


## Features
- **Interactive Filters**: Users can filter the CoT data by selecting the market and date range.
- **Dynamic Table Display**: The data is presented in a table format with options to interactively explore different time frames.
- **Column Descriptions**: Provides descriptions for each column to help users understand the metrics used in the CoT reports.


## About the Data

#### [**Commitments of Traders (COT) Reports Descriptions**](https://www.cftc.gov/MarketReports/CommitmentsofTraders/index.htm)

There are four main reports:

1. Legacy (**<ins>THIS APP USES DATA FROM THIS REPORT</ins>**) -- The Legacy reports are broken down by exchange. These reports have a futures only report and a combined futures and options report. Legacy reports break down the reportable open interest positions into two classifications: non-commercial and commercial traders.

2. Supplemental -- The Supplemental report includes 13 select agricultural commodity contracts for combined futures and options positions. Supplemental reports break down the reportable open interest positions into three trader classifications: non-commercial, commercial, and index traders.

3. Disaggregated -- The Disaggregated reports are broken down by agriculture, petroleum and products, natural gas and products, electricity and metals and other physical contracts. These reports have a futures only report and a combined futures and options report. The Disaggregated reports break down the reportable open interest positions into four classifications:
   
    * Producer/Merchant/Processor/User
    * Swap Dealers
    * Managed Money
    * Other Reportables
    
4. Traders in Financial Futures -- The Traders in Financial Futures (TFF) report includes financial contracts, such as currencies, US Treasury securities, Eurodollars, stocks, VIX and Bloomberg commodity index. These reports have a futures only report and a combined futures and options report. The TFF report breaks down the reportable open interest positions into four classifications:
   
    * Dealer/Intermediary
    * Asset Manager/Institutional
    * Leveraged Funds
    * Other Reportables

    
#### Column Descriptions

* **Date:** Data at Tuesday market close, released Friday.

* **OI All:** Total open interest for all trader categories.

* **Z:** Z-score for each column relative to target dates selected by input

* **Δ Week:** Change from prior week.

* **Net:** The difference between the total long and short positions.

* **Long/Short:** Number of long and short positions respectively.

* **% Long/Short:** Percentage of total open interest that is long or short.

* **Flip:** Difference between the % Long and % Short columns.


## Installation
To run this application locally, follow these steps:

1. Install R from the [Comprehensive R Archive Network (CRAN)](https://cran.r-project.org).
2. Install necessary R packages. Run the following commands in your R console:

```
R # this starts interactive R shell

required_packages <- c("tidyverse", "readxl", "data.table", "vroom", "gt", "shiny")

install.packages(required_packages)

q() # exits R shell
```

***Currently supports R 4.3.3***

## Running the App

Clone the repository and run the app through your terminal after installing above requirements.


### From Terminal

```
git clone https://github.com/modest-melody/CoT-Report-Viewer.git

cd CoT-Report-Viewer/Legacy-NonCom

R -e "shiny::runApp('non_commercial_app.R')"
```

Bring the server and port # to your browser.

## App Layout

- **Input Panel**: Located at the top for easy access, allowing users to select the market and date range.
- **Column Descriptions**: Situated between the input panel and the table, this section explains the data points displayed in the table.
- **Data Table**: Displays the CoT data according to user-selected filters.


## Source Files

* **data/**
  * Leg_FAO_95_06.xls - *Data from 1995 to 2006*
  * Leg_FAO_07_14.xls - *Data from 2007 to 2014*
  * Leg_FAO_15_16.xls - *Data from 2015 to 2016*
  * Leg_FAO_2017.xls - *Data from 2017*
  * Leg_FAO_2018.xls - *Data from 2018*
  * Leg_FAO_2019.xls - *Data from 2019*
  * Leg_FAO_2020.xls - *Data from 2020*
  * Leg_FAO_2021.xls - *Data from 2021*
  * Leg_FAO_2022.xls - *Data from 2022*
  * Leg_FAO_2023.xls - *Data from 2023*
  * annualof.xls - *2024 Data populated after running script #1*
  
  
* **scripts/**
  * 1_Leg_FAO_Import.R - *Imports data from 1995 to 2023 and downloads most recent 2024 data.*
  * 2_change_cftc_names.R - *Data Cleaning: Renaming*
  * 3_filter_leg_fao.R - *Data Cleaning: Filtering*
  * 4_functions.R - *gt table functions*


## How It Runs

Running the `non_commercial_app.R` file will source all 4 script files which creates the data and functions for the app. The shiny UI, Server, and App call are all in the same `non_commercial_app.R` file. 


## Contributing
Contributions to improve the app are welcome. If enough interest is apparent, this app can be extended to include more/all of the CoT reports.

