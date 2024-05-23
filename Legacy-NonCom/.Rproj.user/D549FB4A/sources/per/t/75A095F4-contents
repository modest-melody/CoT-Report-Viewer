# SETUP - source all of the data importing and cleaning scripts
# source("C:/Users/mmcge/OneDrive/Documents/CFTC/Legacy Futures & Options/Scripts/1 Leg_FAO_Import.R")
# source("C:/Users/mmcge/OneDrive/Documents/CFTC/Legacy Futures & Options/Scripts/2 change_cftc_names.R")
# source("C:/Users/mmcge/OneDrive/Documents/CFTC/Legacy Futures & Options/Scripts/3 filter_leg_fao.R")

# 3 Functions in this doc

## 1st runs the desired data to be filtered by market and start/end dates
#cot_noncom_data(market, start, end)
#
## 2nd runs the gt table body 
#cot_noncom_table(data)
#
## 3rd is a compilation of both to run both functions together, but technically separate
#cot_noncom(market, start, end)
#
#
#
## Example 1: piping the 1st function to the 2nd function
#cot_noncom_data("E-MINI NASDAQ 100", "2022/01/01", "2022/06/19") %>% cot_noncom_table()
#
## Example 2: using 3rd function to do both together
#cot_noncom("E-MINI RUSSEL 2000", "2021/01/01", "2022/06/19")

library(gt)

# cot_noncom("E-MINI S&P 500", Sys.Date()-1150, Sys.Date())


# Function to get data frame of selected market and filter by start/end dates
cot_noncom_data <- function(market, start, end) {
  LegFaoTEST %>% filter(Market_and_Exchange_Names == market &
                          Report_Date_as_MM_DD_YYYY > start &
                          Report_Date_as_MM_DD_YYYY < end) %>%  
    group_by(Market_and_Exchange_Names) %>%  
    mutate(Z_OI = round(scale(Open_Interest_All), digits = 2),
           OI_Week_Change = Open_Interest_All - lag(Open_Interest_All, order_by = Report_Date_as_MM_DD_YYYY),
           Z_OI_Change = round(scale(OI_Week_Change), digits = 2),
           NonComm_Net = NonComm_Positions_Long_All - NonComm_Positions_Short_All,
           Z_NonComm_Net = round(scale(NonComm_Net), digits = 2),
           Net_Week_Change = NonComm_Net - lag(NonComm_Net, order_by = Report_Date_as_MM_DD_YYYY),
           Z_NonComm_Net_Week_Change = round(scale(Net_Week_Change), digits = 2),
           Z_NonComm_Positions_Long_All = round(scale(NonComm_Positions_Long_All), digits = 2),
           NonComm_Long_Change = NonComm_Positions_Long_All - lag(NonComm_Positions_Long_All, order_by = Report_Date_as_MM_DD_YYYY),
           Z_NonComm_Long_Change = round(scale(NonComm_Long_Change), digits = 2),
           Z_NonComm_Positions_Short_All = round(scale(NonComm_Positions_Short_All), digits = 2),
           NonComm_Short_Change = NonComm_Positions_Short_All - lag(NonComm_Positions_Short_All, order_by = Report_Date_as_MM_DD_YYYY),
           Z_NonComm_Short_Change = round(scale(NonComm_Short_Change), digits = 2),
           Flip = Pct_of_OI_NonComm_Long_All - Pct_of_OI_NonComm_Short_All, 
           Z_Flip = round(scale(Pct_of_OI_NonComm_Long_All - Pct_of_OI_NonComm_Short_All), digits = 2),
           Flip_Change = round(Flip - lag(Flip, order_by = Report_Date_as_MM_DD_YYYY), digits = 2)
    ) %>% ungroup() %>%       
    select(Report_Date_as_MM_DD_YYYY,
           Open_Interest_All,
           Z_OI,
           OI_Week_Change,
           Z_OI_Change,
           NonComm_Net,
           Z_NonComm_Net,
           Net_Week_Change,
           Z_NonComm_Net_Week_Change,
           NonComm_Positions_Long_All,
           Z_NonComm_Positions_Long_All,
           NonComm_Long_Change,
           Z_NonComm_Long_Change,
           NonComm_Positions_Short_All,   
           Z_NonComm_Positions_Short_All,
           NonComm_Short_Change,
           Z_NonComm_Short_Change,
           Pct_of_OI_NonComm_Long_All,     
           Pct_of_OI_NonComm_Short_All,    
           Flip,
           Z_Flip,
           Flip_Change) %>%  # Have to ungroup() to remove row_group labels
    arrange(desc(Report_Date_as_MM_DD_YYYY))
}
  


# Function to create just the gt table format
  
cot_noncom_table <- function(data){
gt(data) %>% 
  data_color(
    columns = c(Open_Interest_All, 
                Z_OI, 
                NonComm_Net,
                Z_NonComm_Net,
                NonComm_Positions_Long_All,
                Z_NonComm_Positions_Long_All,
                NonComm_Positions_Short_All,   
                Z_NonComm_Positions_Short_All,
                Pct_of_OI_NonComm_Long_All,     
                Pct_of_OI_NonComm_Short_All),
    colors = scales::col_numeric(
      palette = c("#e13333", "white", "#1ecc3b"),
      domain = NULL)
  ) %>% 
  data_color(
    columns = c(OI_Week_Change,
                Z_OI_Change,
                Net_Week_Change,
                Z_NonComm_Net_Week_Change,
                NonComm_Long_Change,
                Z_NonComm_Long_Change,
                NonComm_Short_Change,
                Z_NonComm_Short_Change,
                Flip,
                Z_Flip,
                Flip_Change),
    colors = scales::col_numeric(
      palette = c("#e13333", "#FFFA75", "#1ecc3b"),
      domain = NULL)
  ) %>% 
  tab_options(heading.align = "center",
              heading.title.font.size = 23,
              heading.subtitle.font.weight = "bolder",
              heading.title.font.weight = "bolder",
              heading.subtitle.font.size = 16,
              table_body.hlines.width = px(0), # Row border thickness
              column_labels.font.weight = "bold",
              column_labels.font.size = 13,
              column_labels.padding.horizontal = 0,
              table.width = px(800),
              table.font.size = 12,
              table.font.color = "black",
              table.font.color.light = "black",
              table.font.weight = "bold",
              column_labels.border.bottom.style = "solid",
              column_labels.border.bottom.width = px(3),
              column_labels.border.bottom.color = "black",
              table_body.border.bottom.style = "solid",
              table_body.border.bottom.width = px(3),
              table_body.border.bottom.color = "black",
              table.border.bottom.style = "solid",
              table.border.bottom.width = px(3),
              table.border.bottom.color = "black",
              row_group.border.left.style = "solid",
              row_group.border.left.width = px(3),
              row_group.border.left.color = "black",
              stub_row_group.border.style = "solid",
              stub_row_group.border.width = px(3),
              stub_row_group.border.color = "black",
              stub.border.style = "solid",
              stub.border.width = px(3),
              stub.border.color = "black"
  ) %>% 
  cols_label(Report_Date_as_MM_DD_YYYY = "Date",
             Open_Interest_All = "OI All",
             Z_OI = "Z",
             OI_Week_Change = "Δ Week",
             Z_OI_Change = "Z",
             NonComm_Net = "Net",
             Z_NonComm_Net = "Z",
             Net_Week_Change = "Δ Week",
             Z_NonComm_Net_Week_Change = "Z",
             NonComm_Positions_Long_All = "Long",
             Z_NonComm_Positions_Long_All = "Z",
             NonComm_Long_Change = "Δ Week",
             Z_NonComm_Long_Change = "Z",
             NonComm_Positions_Short_All = "Short",   
             Z_NonComm_Positions_Short_All = "Z",
             NonComm_Short_Change = "Δ Week",
             Z_NonComm_Short_Change = "Z",
             Pct_of_OI_NonComm_Long_All = "% Long",     
             Pct_of_OI_NonComm_Short_All = "% Short",    
             Flip = "Flip",
             Z_Flip = "Z",
             Flip_Change = "Δ Week" 
  ) %>% 
  fmt_number(
    c(Open_Interest_All,
      OI_Week_Change,
      NonComm_Net,
      Net_Week_Change,
      NonComm_Positions_Long_All,
      NonComm_Long_Change,
      NonComm_Positions_Short_All,
      NonComm_Short_Change),
    rows = everything(),
    drop_trailing_zeros = TRUE,
    use_seps = TRUE,
    sep_mark = ",",
    dec_mark = ".",
    locale = NULL
  ) %>% 
  tab_style(
    cell_text(weight = "normal"),
    locations = cells_body(columns = starts_with("Z"),
                           rows = everything()) 
  ) %>% 
  tab_style(
    style = cell_text(align = "center"),
    locations = cells_column_labels(everything())
  ) %>%  ##### BORDERS ######
tab_style(
  style = cell_borders(
    sides = "left",
    color = "black",
    weight = px(3),
    style = "solid"
  ),
  locations = list(cells_column_labels(
    columns = c(Open_Interest_All, 
                OI_Week_Change,
                NonComm_Net,
                Net_Week_Change,
                NonComm_Positions_Long_All,
                NonComm_Long_Change,
                NonComm_Positions_Short_All,   
                NonComm_Short_Change,
                Pct_of_OI_NonComm_Long_All,     
                Flip)),
    cells_body(columns = c(Open_Interest_All, 
                           OI_Week_Change,
                           NonComm_Net,
                           Net_Week_Change,
                           NonComm_Positions_Long_All,
                           NonComm_Long_Change,
                           NonComm_Positions_Short_All,   
                           NonComm_Short_Change,
                           Pct_of_OI_NonComm_Long_All,     
                           Flip),
               rows = everything()),
    cells_stub(rows = everything())
  )
) %>% 
  tab_style(
    style = cell_borders(
      sides = "right",
      color = "black",
      weight = px(3),
      style = "solid"
    ),
    locations = list(cells_column_labels(columns = Flip_Change),
                     cells_body(columns = Flip_Change,
                                rows = everything())
    )
  ) %>% 
  tab_style(
    style = cell_borders(
      sides = "left",
      color = "black",
      weight = px(1),
      style = "solid"
    ),
    locations = list(cells_column_labels(
      columns = c(Z_OI, 
                  Z_OI_Change,
                  Z_NonComm_Net,
                  Z_NonComm_Net_Week_Change,
                  Z_NonComm_Positions_Long_All,
                  Z_NonComm_Long_Change,
                  Z_NonComm_Positions_Short_All,
                  Z_NonComm_Short_Change,
                  Pct_of_OI_NonComm_Short_All,
                  Z_Flip,
                  Flip_Change)),
      cells_body( 
        columns = c(Z_OI, 
                    Z_OI_Change,
                    Z_NonComm_Net,
                    Z_NonComm_Net_Week_Change,
                    Z_NonComm_Positions_Long_All,
                    Z_NonComm_Long_Change,
                    Z_NonComm_Positions_Short_All,
                    Z_NonComm_Short_Change,
                    Pct_of_OI_NonComm_Short_All,
                    Z_Flip,
                    Flip_Change),
        rows = everything())
    ) 
  ) %>% #### COLUMN HEADER FILL COLORS #####
tab_style(
  style = cell_fill(color = "#F7D9EF"),
  locations = cells_column_labels(columns = c(Open_Interest_All, Z_OI, OI_Week_Change, Z_OI_Change))
) %>% 
  tab_style(
    style = cell_fill(color = "#BDD7EE"),
    locations = cells_column_labels(columns = c(NonComm_Net, Z_NonComm_Net, Net_Week_Change, Z_NonComm_Net_Week_Change))
  ) %>% 
  tab_style(
    style = cell_fill(color = "#00B050"),
    locations = cells_column_labels(columns = c(NonComm_Positions_Long_All, Z_NonComm_Positions_Long_All, NonComm_Long_Change, Z_NonComm_Long_Change))
  ) %>% 
  tab_style(
    style = cell_fill(color = "#00B050"),
    locations = cells_column_labels(columns = c(NonComm_Positions_Long_All, Z_NonComm_Positions_Long_All))
  ) %>% 
  tab_style(
    style = cell_fill(color = "#6BFE1A"),
    locations = cells_column_labels(columns = c(NonComm_Long_Change, Z_NonComm_Long_Change))
  ) %>% 
  tab_style(
    style = cell_fill(color = "#FF7C80"),
    locations = cells_column_labels(columns = c(NonComm_Positions_Short_All, Z_NonComm_Positions_Short_All))
  ) %>% 
  tab_style(
    style = cell_fill(color = "#FF2C09"),
    locations = cells_column_labels(columns = c(NonComm_Short_Change, Z_NonComm_Short_Change))
  ) %>% 
  tab_style(
    style = cell_fill(color = "#FFE699"),
    locations = cells_column_labels(columns = c(Pct_of_OI_NonComm_Long_All, Pct_of_OI_NonComm_Short_All))
  ) %>%   tab_style(
    style = cell_fill(color = "#D6DCE4"),
    locations = cells_column_labels(columns = c(Flip, Z_Flip, Flip_Change))
  ) %>% 
  cols_width(
    starts_with("Z") ~ px(45),
    starts_with("Pct") ~ px(55),
    Flip ~ px(50),
    Flip_Change ~ px(55),
    Report_Date_as_MM_DD_YYYY ~ px(90),
    everything() ~ px(80)
  ) %>% 
  cols_align(
    align = "center",
    columns = everything()
  ) %>% 
  opt_table_outline(style = "solid", width = px(3), color = "black"
  ) %>% 
  opt_table_font(font = google_font(name = "Mulish"), weight = "bold", style = NULL, add = TRUE) %>% 
  opt_vertical_padding(scale = 0.75)  

}

  
  
# Function to get noncom data and create gt table body with header

cot_noncom <- function(market, start, end) {
  LegFaoTEST %>% filter(Market_and_Exchange_Names == market &
                      Report_Date_as_MM_DD_YYYY > start &
                      Report_Date_as_MM_DD_YYYY < end) %>%  
    group_by(Market_and_Exchange_Names) %>%  
    mutate(Z_OI = round(scale(Open_Interest_All), digits = 2),
           OI_Week_Change = Open_Interest_All - lag(Open_Interest_All, order_by = Report_Date_as_MM_DD_YYYY),
           Z_OI_Change = round(scale(OI_Week_Change), digits = 2),
           NonComm_Net = NonComm_Positions_Long_All - NonComm_Positions_Short_All,
           Z_NonComm_Net = round(scale(NonComm_Net), digits = 2),
           Net_Week_Change = NonComm_Net - lag(NonComm_Net, order_by = Report_Date_as_MM_DD_YYYY),
           Z_NonComm_Net_Week_Change = round(scale(Net_Week_Change), digits = 2),
           Z_NonComm_Positions_Long_All = round(scale(NonComm_Positions_Long_All), digits = 2),
           NonComm_Long_Change = NonComm_Positions_Long_All - lag(NonComm_Positions_Long_All, order_by = Report_Date_as_MM_DD_YYYY),
           Z_NonComm_Long_Change = round(scale(NonComm_Long_Change), digits = 2),
           Z_NonComm_Positions_Short_All = round(scale(NonComm_Positions_Short_All), digits = 2),
           NonComm_Short_Change = NonComm_Positions_Short_All - lag(NonComm_Positions_Short_All, order_by = Report_Date_as_MM_DD_YYYY),
           Z_NonComm_Short_Change = round(scale(NonComm_Short_Change), digits = 2),
           Flip = Pct_of_OI_NonComm_Long_All - Pct_of_OI_NonComm_Short_All, 
           Z_Flip = round(scale(Pct_of_OI_NonComm_Long_All - Pct_of_OI_NonComm_Short_All), digits = 2),
           Flip_Change = round(Flip - lag(Flip, order_by = Report_Date_as_MM_DD_YYYY), digits = 2)
    ) %>% ungroup() %>%       
    select(Report_Date_as_MM_DD_YYYY,
           Open_Interest_All,
           Z_OI,
           OI_Week_Change,
           Z_OI_Change,
           NonComm_Net,
           Z_NonComm_Net,
           Net_Week_Change,
           Z_NonComm_Net_Week_Change,
           NonComm_Positions_Long_All,
           Z_NonComm_Positions_Long_All,
           NonComm_Long_Change,
           Z_NonComm_Long_Change,
           NonComm_Positions_Short_All,   
           Z_NonComm_Positions_Short_All,
           NonComm_Short_Change,
           Z_NonComm_Short_Change,
           Pct_of_OI_NonComm_Long_All,     
           Pct_of_OI_NonComm_Short_All,    
           Flip,
           Z_Flip,
           Flip_Change) %>%  # Have to ungroup() to remove row_group labels
    arrange(desc(Report_Date_as_MM_DD_YYYY)) %>% 
###################### GT TABLE ##############################################
    gt() %>% # Table header, market name and "Non Com Pos"
    tab_header(
      title = market,
      subtitle = "Legacy Futures and Options Report") %>% 
    opt_align_table_header(align = "left") %>% # Red, white, green scale -:+ 
    data_color(
      columns = c(Open_Interest_All, 
                  Z_OI, 
                  NonComm_Net,
                  Z_NonComm_Net,
                  NonComm_Positions_Long_All,
                  Z_NonComm_Positions_Long_All,
                  Pct_of_OI_NonComm_Long_All),
      colors = scales::col_numeric(
        palette = c("#e13333", "white", "#1ecc3b"),
        domain = NULL)
    ) %>% # Red, yellow, green scale -:+ 
    data_color(
      columns = c(OI_Week_Change,
                  Z_OI_Change,
                  Net_Week_Change,
                  Z_NonComm_Net_Week_Change,
                  NonComm_Long_Change,
                  Z_NonComm_Long_Change,
                  NonComm_Short_Change,
                  Z_NonComm_Short_Change,
                  Flip,
                  Z_Flip,
                  Flip_Change),
      colors = scales::col_numeric(
        palette = c("#e13333", "#FFFA75", "#1ecc3b"),
        domain = NULL)
    ) %>% # Red, white, green scale +:-
    data_color(
      columns = c(NonComm_Positions_Short_All,   
                  Z_NonComm_Positions_Short_All,     
                  Pct_of_OI_NonComm_Short_All),
      colors = scales::col_numeric(
        palette = c("#1ecc3b", "white", "#e13333"),
        domain = NULL) ) %>% # Red, yellow, green scale +:- 
    data_color(
      columns = c(NonComm_Short_Change,
                  Z_NonComm_Short_Change),
      colors = scales::col_numeric(
        palette = c("#1ecc3b", "#FFFA75", "#e13333"),
        domain = NULL)
    ) %>%
    tab_options(heading.align = "center",
                heading.title.font.size = 23,
                heading.subtitle.font.weight = "bolder",
                heading.title.font.weight = "bolder",
                heading.subtitle.font.size = 16,
                table_body.hlines.width = px(0), # Row border thickness
                column_labels.font.weight = "bold",
                column_labels.font.size = 13,
                column_labels.padding.horizontal = 0,
                table.width = px(800),
                table.font.size = 12,
                table.font.color = "black",
                table.font.color.light = "black",
                table.font.weight = "bold",
                column_labels.border.bottom.style = "solid",
                column_labels.border.bottom.width = px(3),
                column_labels.border.bottom.color = "black",
                table_body.border.bottom.style = "solid",
                table_body.border.bottom.width = px(3),
                table_body.border.bottom.color = "black",
                table.border.bottom.style = "solid",
                table.border.bottom.width = px(3),
                table.border.bottom.color = "black",
                row_group.border.left.style = "solid",
                row_group.border.left.width = px(3),
                row_group.border.left.color = "black",
                stub_row_group.border.style = "solid",
                stub_row_group.border.width = px(3),
                stub_row_group.border.color = "black",
                stub.border.style = "solid",
                stub.border.width = px(3),
                stub.border.color = "black"
    ) %>% 
    cols_label(Report_Date_as_MM_DD_YYYY = "Date",
               Open_Interest_All = "OI All",
               Z_OI = "Z",
               OI_Week_Change = html("&Delta; Week"),
               Z_OI_Change = "Z",
               NonComm_Net = "Net",
               Z_NonComm_Net = "Z",
               Net_Week_Change = html("&Delta; Week"),
               Z_NonComm_Net_Week_Change = "Z",
               NonComm_Positions_Long_All = "Long",
               Z_NonComm_Positions_Long_All = "Z",
               NonComm_Long_Change = html("&Delta; Week"),
               Z_NonComm_Long_Change = "Z",
               NonComm_Positions_Short_All = "Short",   
               Z_NonComm_Positions_Short_All = "Z",
               NonComm_Short_Change = html("&Delta; Week"),
               Z_NonComm_Short_Change = "Z",
               Pct_of_OI_NonComm_Long_All = "% Long",     
               Pct_of_OI_NonComm_Short_All = "% Short",    
               Flip = "Flip",
               Z_Flip = "Z",
               Flip_Change = html("&Delta; Week") 
    ) %>% 
    fmt_number(
      c(Open_Interest_All,
        OI_Week_Change,
        NonComm_Net,
        Net_Week_Change,
        NonComm_Positions_Long_All,
        NonComm_Long_Change,
        NonComm_Positions_Short_All,
        NonComm_Short_Change),
      rows = everything(),
      drop_trailing_zeros = TRUE,
      use_seps = TRUE,
      sep_mark = ",",
      dec_mark = ".",
      locale = NULL
    ) %>% 
    tab_style(
      cell_text(weight = "normal"),
      locations = cells_body(columns = starts_with("Z"),
                             rows = everything()) 
    ) %>% 
    tab_style(
      style = cell_text(align = "center"),
      locations = cells_column_labels(everything())
    ) %>%  ##### BORDERS ######
  tab_style(
    style = cell_borders(
      sides = "left",
      color = "black",
      weight = px(3),
      style = "solid"
    ),
    locations = list(cells_column_labels(
      columns = c(Open_Interest_All, 
                  OI_Week_Change,
                  NonComm_Net,
                  Net_Week_Change,
                  NonComm_Positions_Long_All,
                  NonComm_Long_Change,
                  NonComm_Positions_Short_All,   
                  NonComm_Short_Change,
                  Pct_of_OI_NonComm_Long_All,     
                  Flip)),
      cells_body(columns = c(Open_Interest_All, 
                             OI_Week_Change,
                             NonComm_Net,
                             Net_Week_Change,
                             NonComm_Positions_Long_All,
                             NonComm_Long_Change,
                             NonComm_Positions_Short_All,   
                             NonComm_Short_Change,
                             Pct_of_OI_NonComm_Long_All,     
                             Flip),
                 rows = everything()),
      cells_stub(rows = everything())
    )
  ) %>% 
    tab_style(
      style = cell_borders(
        sides = "right",
        color = "black",
        weight = px(3),
        style = "solid"
      ),
      locations = list(cells_column_labels(columns = Flip_Change),
                       cells_body(columns = Flip_Change,
                                  rows = everything())
      )
    ) %>% 
    tab_style(
      style = cell_borders(
        sides = "left",
        color = "black",
        weight = px(1),
        style = "solid"
      ),
      locations = list(cells_column_labels(
        columns = c(Z_OI, 
                    Z_OI_Change,
                    Z_NonComm_Net,
                    Z_NonComm_Net_Week_Change,
                    Z_NonComm_Positions_Long_All,
                    Z_NonComm_Long_Change,
                    Z_NonComm_Positions_Short_All,
                    Z_NonComm_Short_Change,
                    Pct_of_OI_NonComm_Short_All,
                    Z_Flip,
                    Flip_Change)),
        cells_body( 
          columns = c(Z_OI, 
                      Z_OI_Change,
                      Z_NonComm_Net,
                      Z_NonComm_Net_Week_Change,
                      Z_NonComm_Positions_Long_All,
                      Z_NonComm_Long_Change,
                      Z_NonComm_Positions_Short_All,
                      Z_NonComm_Short_Change,
                      Pct_of_OI_NonComm_Short_All,
                      Z_Flip,
                      Flip_Change),
          rows = everything())
      ) 
    ) %>% 
    tab_style(
      style = cell_borders(
        sides = "top",
        color = "black",
        weight = px(3),
        style = "solid"),
      locations = (cells_column_labels(columns = everything()))
    ) %>% #### COLUMN HEADER FILL COLORS #####
  tab_style(
    style = cell_fill(color = "#F7D9EF"),
    locations = cells_column_labels(columns = c(Open_Interest_All, Z_OI, OI_Week_Change, Z_OI_Change))
  ) %>% 
    tab_style(
      style = cell_fill(color = "#BDD7EE"),
      locations = cells_column_labels(columns = c(NonComm_Net, Z_NonComm_Net, Net_Week_Change, Z_NonComm_Net_Week_Change))
    ) %>% 
    tab_style(
      style = cell_fill(color = "#00B050"),
      locations = cells_column_labels(columns = c(NonComm_Positions_Long_All, Z_NonComm_Positions_Long_All, NonComm_Long_Change, Z_NonComm_Long_Change))
    ) %>% 
    tab_style(
      style = cell_fill(color = "#00B050"),
      locations = cells_column_labels(columns = c(NonComm_Positions_Long_All, Z_NonComm_Positions_Long_All))
    ) %>% 
    tab_style(
      style = cell_fill(color = "#6BFE1A"),
      locations = cells_column_labels(columns = c(NonComm_Long_Change, Z_NonComm_Long_Change))
    ) %>% 
    tab_style(
      style = cell_fill(color = "#FF7C80"),
      locations = cells_column_labels(columns = c(NonComm_Positions_Short_All, Z_NonComm_Positions_Short_All))
    ) %>% 
    tab_style(
      style = cell_fill(color = "#FF2C09"),
      locations = cells_column_labels(columns = c(NonComm_Short_Change, Z_NonComm_Short_Change))
    ) %>% 
    tab_style(
      style = cell_fill(color = "#FFE699"),
      locations = cells_column_labels(columns = c(Pct_of_OI_NonComm_Long_All, Pct_of_OI_NonComm_Short_All))
    ) %>%   tab_style(
      style = cell_fill(color = "#D6DCE4"),
      locations = cells_column_labels(columns = c(Flip, Z_Flip, Flip_Change))
    ) %>% 
    cols_width(
      starts_with("Z") ~ px(45),
      starts_with("Pct") ~ px(55),
      Flip ~ px(50),
      Flip_Change ~ px(55),
      Report_Date_as_MM_DD_YYYY ~ px(90),
      everything() ~ px(80)
    ) %>% 
    cols_align(
      align = "center",
      columns = everything()
    ) %>% 
    opt_table_outline(style = "solid", width = px(3), color = "black"
    ) %>% 
    opt_table_font(font = google_font(name = "Mulish"), weight = "bold", style = NULL, add = TRUE) %>% 
    opt_vertical_padding(scale = 0.75)  
  }


