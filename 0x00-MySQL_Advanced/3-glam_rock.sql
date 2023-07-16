-- This script lists all bands with Glam rock as their main style, ranked by their longevity.
-- The columns returned are band_name and lifespan (in years until 2022).

SELECT band_name, 
       YEAR('2022-01-01') - YEAR(formed) AS lifespan
FROM bands
WHERE main_style = 'Glam rock'
ORDER BY lifespan DESC;
