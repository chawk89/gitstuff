##
## Code Snippet to run the dashboard
## NOTE: YOU WILL NOT BE ABLE TO RUN THIS since you don't have the data.
##

##
## SBCpip is available from:
## https://bnaras.github.com/SBCpip
## or
## https://github.com/bnaras/SBCpip
##

library(SBCpip)

set_config_param(param = "output_folder",
                 value = "~/R/packages/platelet-data/Blood_Center_Outputs")
set_config_param(param = "log_folder",
                 value = "~/R/packages/platelet-data/Blood_Center_Logs")

set_config_param(param = "report_folder",
                 value = "~/R/packages/platelet-data/Blood_Center_Reports")

## Incremental Data
config <- set_config_param(param = "data_folder",
                           value = "~/R/packages/platelet-data/Blood_Center_inc")


sbc_dashboard()
