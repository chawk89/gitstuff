#' Create a ggplot barplot of timezone by operating system
#'
#' @description Generate a bar plot of browser agent data by operating system windows or nonwindows.
#'
#' @param data the browser agent data as a list containing variables `tz` for timezone and
#' `a` for agent
#' @param color colors to use for bars, default `blue`
#'
#' @export
#'
#' @importFrom tibble tibble
#' @importFrom dplyr group_by mutate select summarize arrange desc inner_join n slice ungroup
#' @importFrom ggplot2 ggplot aes geom_bar coord_flip scale_y_continuous scale_fill_manual
#' @importFrom scales percent_format
#' @importFrom magrittr %>%
#'
#' @examples
#' data(bitly)
#' plotTzByOS(bitly)
#' @keywords dplot
plotTzByOS <- function(data, color = c("blue", "#E69F00")) {
    tzAndOs <- tibble(tz = unlist(lapply(data, function(x) x$tz)),
                      agent = unlist(lapply(data, function(x) x$a))) %>%
        mutate(tz = ifelse(tz == "", "Unknown", tz),
                  os = ifelse(grepl("Windows", agent), "Windows", "Nonwindows")) %>%
        select(tz, os)

    topTenTz <- tzAndOs %>%
        group_by(tz) %>%
        summarize(count = n()) %>%
        arrange(desc(count)) %>%
        slice(seq_len(10)) %>%
        select(tz)

    topTenTzAndOs <- tzAndOs %>%
        inner_join(topTenTz) %>%
        group_by(tz, os) %>%
        summarize(count = n()) %>%
        ungroup %>%
        mutate(tz = factor(tz, levels = rev(topTenTz$tz)))

    topTenTzAndOs %>%
        ggplot(aes(x = tz, y = count, fill = os)) +
        geom_bar(position = "fill", stat = "identity") +
        scale_y_continuous(labels = percent_format()) +
        scale_fill_manual(values = color) +
        coord_flip()
}

