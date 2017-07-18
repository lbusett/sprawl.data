library(raster)


pp <- "inst/extdata/gNDVI.tif"
pp <- raster(pp)
plot(pp)

rast <- stack("inst/extdata/sprawl_EVItest.tif")[[20]]

inset_raster(rast)

ggplot() + geom_spraster_rgb(rast, interpolate = TRUE) +
  coord_fixed()
