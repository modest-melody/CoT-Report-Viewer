# Uses LegFaoTEST to filter only the names changed in the prior script and then select (and create) only the columns
## needed for the Non Commercial side of this project.

# SETUP


# Filter rows to newly changed names. If you change names in the future remember to change BOTH here and during the mutate prior.
LegFaoTEST <- LegFaoTEST %>% filter(        
    # YIELDS
    Market_and_Exchange_Names == "1 MONTH SOFR" |
    Market_and_Exchange_Names == "30 DAY FED FUNDS" |
    Market_and_Exchange_Names == "3 MONTH SOFR" |
    Market_and_Exchange_Names == "2 YEAR NOTES" |
    Market_and_Exchange_Names == "5 YEAR NOTES" |
    Market_and_Exchange_Names == "10 YEAR NOTES" |
    Market_and_Exchange_Names == "30 YEAR BONDS" |
    # E-MINI
    Market_and_Exchange_Names == "E-MINI S&P 500" |
    Market_and_Exchange_Names == "E-MINI NASDAQ 100" |
    Market_and_Exchange_Names == "E-MINI DOW JONES" |
    Market_and_Exchange_Names == "E-MINI RUSSEL 2000" |
    Market_and_Exchange_Names == "E-MINI S&P 400" |
    Market_and_Exchange_Names == "E-MINI RUSSELL 1000" |
    # INDICES
    Market_and_Exchange_Names == "S&P 500 INDEX" |
    Market_and_Exchange_Names == "S&P 500 CONS" |
    Market_and_Exchange_Names == "NASDAQ 100 CONS" |
    Market_and_Exchange_Names == "DOW JONES CONS" |
    # SECTORS
    Market_and_Exchange_Names == "ENERGY" |
    Market_and_Exchange_Names == "FINANCIAL" |
    Market_and_Exchange_Names == "HEALTH CARE" |
    Market_and_Exchange_Names == "UTILITIES" |
    Market_and_Exchange_Names == "STAPLES" |
    Market_and_Exchange_Names == "INDSUSTRIALS" |
    Market_and_Exchange_Names == "MATERIALS" |
    Market_and_Exchange_Names == "TECH" |
    Market_and_Exchange_Names == "DISCRETIONARY" |
    # OTHER EQUITIES
    Market_and_Exchange_Names == "VIX FUTURES" |
    Market_and_Exchange_Names == "DIVIDEND INDEX" |
    Market_and_Exchange_Names == "NIKKEI" |
    Market_and_Exchange_Names == "DOW REAL ESTATE" |
    # MICROS
    Market_and_Exchange_Names == "MICRO S&P 500" |
    Market_and_Exchange_Names == "MICRO NASDAQ 100" |
    Market_and_Exchange_Names == "MICRO RUSSELL 2000" |
    Market_and_Exchange_Names == "MICRO GOLD" |
    Market_and_Exchange_Names == "MICRO ETHEREUM" |
    Market_and_Exchange_Names == "MICRO BITCOIN" |
    # METALS
    Market_and_Exchange_Names == "COPPER" |
    Market_and_Exchange_Names == "PLATINUM" |
    Market_and_Exchange_Names == "ALUMINUM" |
    Market_and_Exchange_Names == "SILVER" |
    Market_and_Exchange_Names == "GOLD" |
    Market_and_Exchange_Names == "PALLADIUM" |
    # FX
    Market_and_Exchange_Names == "DXY" |
    Market_and_Exchange_Names == "JPY" |
    Market_and_Exchange_Names == "EUR" |
    Market_and_Exchange_Names == "AUD" |
    Market_and_Exchange_Names == "BRL" |
    Market_and_Exchange_Names == "CAD" |
    Market_and_Exchange_Names == "CHF" |
    Market_and_Exchange_Names == "MXN" |
    Market_and_Exchange_Names == "NZD" |
    Market_and_Exchange_Names == "GBP" |
    Market_and_Exchange_Names == "RUB" |
    # COMMODITIES
    Market_and_Exchange_Names == "COCOA" |
    Market_and_Exchange_Names == "SUGAR NO.11" |
    Market_and_Exchange_Names == "SUGAR NO.14" |
    Market_and_Exchange_Names == "COFFEE" |
    Market_and_Exchange_Names == "CORN" |
    Market_and_Exchange_Names == "WHEAT SRW" |
    Market_and_Exchange_Names == "WHEAT HRW" |
    Market_and_Exchange_Names == "LEAN HOGS" |
    Market_and_Exchange_Names == "SOYBEANS" |
    Market_and_Exchange_Names == "MILK 3" |
    Market_and_Exchange_Names == "MILK 4" |
    Market_and_Exchange_Names == "ETHANOL" |
    Market_and_Exchange_Names == "LIVE CATTLE" |
    Market_and_Exchange_Names == "LUMBER" |
    Market_and_Exchange_Names == "COTTON" |
    Market_and_Exchange_Names == "RICE" |
    Market_and_Exchange_Names == "OATS" |
    Market_and_Exchange_Names == "BUTTER" |
    Market_and_Exchange_Names == "NAT GAS" |
    Market_and_Exchange_Names == "WTI PHY" |
    Market_and_Exchange_Names == "WTI FIN" |
    Market_and_Exchange_Names == "WTI ICE" |
    Market_and_Exchange_Names == "BRENT" |
    Market_and_Exchange_Names == "RBOB GAS" |
    Market_and_Exchange_Names == "CALI CARBON 21" |
    Market_and_Exchange_Names == "CALI CARBON 22" |
    Market_and_Exchange_Names == "CALI CARBON 23" |
    Market_and_Exchange_Names == "COAL" |
    # CRYPTO
    Market_and_Exchange_Names == "BITCOIN" |
    Market_and_Exchange_Names == "ETHEREUM"
    )


# COMMENTED OUT ALL THE CODE BELOW TO ADD IT INTO THE TABLE AFTER FILTERING NAME AND DATES SO Z SCORES REFLECT SELECTED DATE RANGES INSTEAD OF THE WHOLE DATA SET

# Create all calculated fields
    # LegFaoTEST <- LegFaoTEST %>% group_by(Market_and_Exchange_Names) %>%  
    #   mutate(Z_OI = round(scale(Open_Interest_All), digits = 2),
    #          OI_Week_Change = Open_Interest_All - lag(Open_Interest_All, order_by = Report_Date_as_MM_DD_YYYY),
    #          Z_OI_Change = round(scale(OI_Week_Change), digits = 2),
    #          NonComm_Net = NonComm_Positions_Long_All - NonComm_Positions_Short_All,
    #          Z_NonComm_Net = round(scale(NonComm_Net), digits = 2),
    #          Net_Week_Change = NonComm_Net - lag(NonComm_Net, order_by = Report_Date_as_MM_DD_YYYY),
    #          Z_NonComm_Net_Week_Change = round(scale(Net_Week_Change), digits = 2),
    #          Z_NonComm_Positions_Long_All = round(scale(NonComm_Positions_Long_All), digits = 2),
    #          NonComm_Long_Change = NonComm_Positions_Long_All - lag(NonComm_Positions_Long_All, order_by = Report_Date_as_MM_DD_YYYY),
    #          Z_NonComm_Long_Change = round(scale(NonComm_Long_Change), digits = 2),
    #          Z_NonComm_Positions_Short_All = round(scale(NonComm_Positions_Short_All), digits = 2),
    #          NonComm_Short_Change = NonComm_Positions_Short_All - lag(NonComm_Positions_Short_All, order_by = Report_Date_as_MM_DD_YYYY),
    #          Z_NonComm_Short_Change = round(scale(NonComm_Short_Change), digits = 2),
    #          Flip = Pct_of_OI_NonComm_Long_All - Pct_of_OI_NonComm_Short_All, 
    #          Z_Flip = round(scale(Pct_of_OI_NonComm_Long_All - Pct_of_OI_NonComm_Short_All), digits = 2),
    #          Flip_Change = round(Flip - lag(Flip, order_by = Report_Date_as_MM_DD_YYYY), digits = 2)
    #         )
    # 

# Select desired columns for table
# LegFaoTEST <- LegFaoTEST %>% 
#   select(Market_and_Exchange_Names,
#          Report_Date_as_MM_DD_YYYY,
#          Open_Interest_All,
#          Z_OI,
#          OI_Week_Change,
#          Z_OI_Change,
#          NonComm_Net,
#          Z_NonComm_Net,
#          Net_Week_Change,
#          Z_NonComm_Net_Week_Change,
#          NonComm_Positions_Long_All,
#          Z_NonComm_Positions_Long_All,
#          NonComm_Long_Change,
#          Z_NonComm_Long_Change,
#          NonComm_Positions_Short_All,   
#          Z_NonComm_Positions_Short_All,
#          NonComm_Short_Change,
#          Z_NonComm_Short_Change,
#          Pct_of_OI_NonComm_Long_All,     
#          Pct_of_OI_NonComm_Short_All,    
#          Flip,
#          Z_Flip,
#          Flip_Change) 



