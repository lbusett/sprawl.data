library(sprawl)
library(dplyr)
library()
in_vect <- get_boundaries("ITA", level = 2) %>%
  dplyr::filter(NAME_1 == "Lombardia")
geom <- in_vect %>%
  dplyr::select(NAME_1, NAME_2)
st_geometry(in_vect) <- NULL
in_data <- in_vect  %>%
  dplyr::select(NAME_1, NAME_2) %>%
  dplyr::mutate(`2003` = sample(dim(.)[1]),
                `2016` = 3*sample(dim(.)[1])) %>%
  tidyr::gather(year, population, -NAME_1, -NAME_2)
in_vect <- dplyr::left_join(in_data, geom) %>%
  sf::st_as_sf()
