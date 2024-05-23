# This script is to consolidate all the different CFTC names together. It will capture all markets that are currently 
## important to this project, consolidate them based on common names, and still leaves all other CoT markets.

# SETUP
library(tidyverse)
library(readxl) # read xls
library(data.table) # rbindlist

# Run Leg_FAO_Import.R first (for dat_csv object used below)

# Create copy of original
LegFaoTEST <- rbindlist(dat_csv, fill = FALSE, idcol = NULL) %>% tibble() %>% 
  arrange(Market_and_Exchange_Names, desc(Report_Date_as_MM_DD_YYYY)) 


# Function to change name by just code
change_name <- function(df, new, code){
  df %>% mutate(Market_and_Exchange_Names = 
                  if_else(CFTC_Contract_Market_Code == code, new, 
                          Market_and_Exchange_Names))
}


# Yields
LegFaoTEST <- change_name(LegFaoTEST, "1 MONTH SOFR", "134742") 
LegFaoTEST <- change_name(LegFaoTEST, "30 DAY FED FUNDS", "045601")
LegFaoTEST <- change_name(LegFaoTEST, "3 MONTH SOFR", "134741")
LegFaoTEST <- change_name(LegFaoTEST, "2 YEAR NOTES", "042601")
LegFaoTEST <- change_name(LegFaoTEST, "5 YEAR NOTES", "044601") 
LegFaoTEST <- change_name(LegFaoTEST, "10 YEAR NOTES", "043602")
LegFaoTEST <- change_name(LegFaoTEST, "30 YEAR BONDS", "020601")

# E-MINI EQUITIES
LegFaoTEST <- change_name(LegFaoTEST, "E-MINI S&P 500", "13874A") 
LegFaoTEST <- change_name(LegFaoTEST, "E-MINI NASDAQ 100", "209742") 
LegFaoTEST <- change_name(LegFaoTEST, "E-MINI DOW JONES", "124603") # Why does it only go back to 2002?
LegFaoTEST <- change_name(LegFaoTEST, "E-MINI RUSSEL 2000", "239742") # MISSING 2008:2017 - !!!!!!
LegFaoTEST <- change_name(LegFaoTEST, "E-MINI S&P 400", "33874A") 
LegFaoTEST <- change_name(LegFaoTEST, "E-MINI RUSSEL 1000", "239744") 

# FULL SIZE INDICIES
LegFaoTEST <- change_name(LegFaoTEST, "S&P 500 INDEX", "138741") 
LegFaoTEST <- change_name(LegFaoTEST, "S&P 500 CONS", "13874+") 
LegFaoTEST <- change_name(LegFaoTEST, "NASDAQ 100 CONS", "20974+") 
LegFaoTEST <- change_name(LegFaoTEST, "DOW JONES CONS", "12460+") 



# SECTORS
LegFaoTEST <- change_name(LegFaoTEST, "ENERGY", "138749") 
LegFaoTEST <- change_name(LegFaoTEST, "FINANCIAL", "13874C") 
LegFaoTEST <- change_name(LegFaoTEST, "HEALTH CARE", "13874E") 
LegFaoTEST <- change_name(LegFaoTEST, "UTILITIES", "13874J") 
LegFaoTEST <- change_name(LegFaoTEST, "STAPLES", "138748") 
LegFaoTEST <- change_name(LegFaoTEST, "INDSUSTRIALS", "13874F") 
LegFaoTEST <- change_name(LegFaoTEST, "MATERIALS", "13874H") 
LegFaoTEST <- change_name(LegFaoTEST, "TECH", "13874I") 
LegFaoTEST <- change_name(LegFaoTEST, "DISCRETIONARY", "138747") 


# OTHER EQUITIES
LegFaoTEST <- change_name(LegFaoTEST, "VIX FUTURES", "1170E1") 
LegFaoTEST <- change_name(LegFaoTEST, "DIVIDEND INDEX", "43874A") 
LegFaoTEST <- change_name(LegFaoTEST, "NIKKEI", "240741") 
LegFaoTEST <- change_name(LegFaoTEST, "DOW REAL ESTATE", "124606") 




# MICROS
LegFaoTEST <- change_name(LegFaoTEST, "MICRO S&P 500", "13874U") 
LegFaoTEST <- change_name(LegFaoTEST, "MICRO NASDAQ 100", "209747") 
LegFaoTEST <- change_name(LegFaoTEST, "MICRO RUSSELL 2000", "239747") 
LegFaoTEST <- change_name(LegFaoTEST, "MICRO GOLD", "088695") 
LegFaoTEST <- change_name(LegFaoTEST, "MICRO ETHEREUM", "146022") 
LegFaoTEST <- change_name(LegFaoTEST, "MICRO BITCOIN", "133742") 

# Metals
LegFaoTEST <- change_name(LegFaoTEST, "COPPER", "085692") 
LegFaoTEST <- change_name(LegFaoTEST, "PLATINUM", "076651") 
LegFaoTEST <- change_name(LegFaoTEST, "ALUMINUM", "191693") # ALUMINUM MWP (EUR also available)
LegFaoTEST <- change_name(LegFaoTEST, "SILVER", "084691") 
LegFaoTEST <- change_name(LegFaoTEST, "GOLD", "088691") 
LegFaoTEST <- change_name(LegFaoTEST, "PALLADIUM", "075651") 



# Currencies
LegFaoTEST <- change_name(LegFaoTEST, "DXY", "098662") 
LegFaoTEST <- change_name(LegFaoTEST, "JPY", "097741") 
LegFaoTEST <- change_name(LegFaoTEST, "EUR", "099741") 
LegFaoTEST <- change_name(LegFaoTEST, "AUD", "232741") 
LegFaoTEST <- change_name(LegFaoTEST, "BRL", "102741") 
LegFaoTEST <- change_name(LegFaoTEST, "CAD", "090741") 
LegFaoTEST <- change_name(LegFaoTEST, "CHF", "092741") 
LegFaoTEST <- change_name(LegFaoTEST, "MXN", "095741") 
LegFaoTEST <- change_name(LegFaoTEST, "NZD", "112741") 
LegFaoTEST <- change_name(LegFaoTEST, "GBP", "096742") 
LegFaoTEST <- change_name(LegFaoTEST, "RUB", "089741") 



# Commodities
LegFaoTEST <- change_name(LegFaoTEST, "COCOA", "073732") 
LegFaoTEST <- change_name(LegFaoTEST, "SUGAR NO.11", "080732") 
LegFaoTEST <- change_name(LegFaoTEST, "SUGAR NO.14", "080734") 
LegFaoTEST <- change_name(LegFaoTEST, "COFFEE", "083731") 
LegFaoTEST <- change_name(LegFaoTEST, "CORN", "002602") 
LegFaoTEST <- change_name(LegFaoTEST, "WHEAT SRW", "001602") 
LegFaoTEST <- change_name(LegFaoTEST, "WHEAT HRW", "001612") 
LegFaoTEST <- change_name(LegFaoTEST, "LEAN HOGS", "054642") 
LegFaoTEST <- change_name(LegFaoTEST, "SOYBEANS", "005602") 
LegFaoTEST <- change_name(LegFaoTEST, "MILK 3", "052641") 
LegFaoTEST <- change_name(LegFaoTEST, "MILK 4", "052644") 
LegFaoTEST <- change_name(LegFaoTEST, "ETHANOL", "025651") 
LegFaoTEST <- change_name(LegFaoTEST, "LIVE CATTLE", "057642") 
LegFaoTEST <- change_name(LegFaoTEST, "LUMBER", "058643") 
LegFaoTEST <- change_name(LegFaoTEST, "COTTON", "033661") 
LegFaoTEST <- change_name(LegFaoTEST, "RICE", "039601") 
LegFaoTEST <- change_name(LegFaoTEST, "OATS", "004603") 
LegFaoTEST <- change_name(LegFaoTEST, "BUTTER", "050642") 


# Energy
LegFaoTEST <- change_name(LegFaoTEST, "NATURAL GAS", "023651") # There are more NG's available if issues arise (LD1, PEN, HEN HUB)
LegFaoTEST <- change_name(LegFaoTEST, "WTI PHYSICAL", "067651") 
LegFaoTEST <- change_name(LegFaoTEST, "WTI FINANCIAL", "06765A") 
LegFaoTEST <- change_name(LegFaoTEST, "WTI ICE", "067411") 
LegFaoTEST <- change_name(LegFaoTEST, "BRENT", "06765T") 
LegFaoTEST <- change_name(LegFaoTEST, "RBOB GAS", "111659") 
LegFaoTEST <- change_name(LegFaoTEST, "CALI CARBON 21", "0063CJ") 
LegFaoTEST <- change_name(LegFaoTEST, "CALI CARBON 22", "0063D9") 
LegFaoTEST <- change_name(LegFaoTEST, "CALI CARBON 23", "0063DX") 
LegFaoTEST <- change_name(LegFaoTEST, "COAL", "024656") 

# CRYPTO
LegFaoTEST <- change_name(LegFaoTEST, "BITCOIN", "133741") 
LegFaoTEST <- change_name(LegFaoTEST, "ETHEREUM", "146021") 



# UPDATE unique/duration check sheet
unique_with_dates_TEST <- LegFaoTEST %>% 
  group_by(Market_and_Exchange_Names, CFTC_Contract_Market_Code) %>% 
  summarise(CFTC_Contract_Market_Code, min = min(Report_Date_as_MM_DD_YYYY), max = max(Report_Date_as_MM_DD_YYYY)) %>% 
  distinct()







