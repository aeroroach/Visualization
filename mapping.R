mapping_region <- function(dt_file, region_area, prefix) {
  png(file = paste0(prefix, "_", region_area,".png"), bg = "transparent", 
      width = 800, height = 500)
  
  dt_file %>% 
    mutate(prop = round(prop*100, digits = 0), 
           province = paste0(Adm1Name, ", (", prop, "%)")) %>% 
    filter(region == region_area) %>% 
    tm_shape() + tm_polygons(col = "prop", title = "% of GS batt",
                             lwd = 0.5, 
                             textNA = "None",
                             colorNA = "grey94",
                             border.col = "black", palette = "Blues") +
    tm_text("province", size = "AREA", col = "black") +
    tm_layout(frame = F,
              outer.margins = 0,
              legend.title.size = 1,
              legend.text.size = 0.8,
              legend.position = c("LEFT", "BOTTOM"))
  dev.off()
}

png(file = "Eastern.png", bg = "transparent", width = 800, height = 500)
th_sugar %>% 
  mutate(prop = round(prop*100, digits = 0), 
         province = paste0(Adm1Name, ", (", prop, "%)")) %>% 
  filter(region == "Eastern") %>% 
  tm_shape() + tm_polygons(col = "prop", title = "% of GS batt",
                           lwd = 0.5, 
                           textNA = "None",
                           colorNA = "grey94",
                           border.col = "black", palette = "Blues") +
  tm_text("province", size = "AREA", col = "black") +
  tm_layout(frame = F,
            outer.margins = 0,
            legend.title.size = 1,
            legend.text.size = 0.8,
            legend.position = c("LEFT", "BOTTOM"))
dev.off()

# Full --------------------------------------------------------------------

th_sugar %>% 
  mutate(prop = prop*100) %>% 
  tm_shape() + tm_polygons(col = "prop", title = "% of GS batt",
                           lwd = 0.5, 
                           textNA = "None",
                           colorNA = "grey94",
                           border.col = "white", palette = "Blues") +
  tm_text("Adm1Name", size = "AREA", col = "grey") +
  tm_layout(frame = F,
            outer.margins = 0,
            legend.title.size = 1,
            legend.text.size = 0.8,
            legend.position = c("LEFT", "BOTTOM"))
