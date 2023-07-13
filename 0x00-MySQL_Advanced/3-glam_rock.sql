-- Import the table dump
SOURCE metal_bands.sql.zip;
-- List all bands with Glam rock as their main style, ranked by their longevity
SELECT band_name,
    -- Compute the lifespan in years until 2022
    CASE
        WHEN split IS NULL THEN 2022 - formed -- If the band is still active, use 2022 as the end year
        ELSE split - formed -- If the band is not active, use the split year as the end year
    END AS lifespan
FROM bands
WHERE style = 'Glam rock' -- Filter by the main style
ORDER BY lifespan DESC;
-- Order by the longevity in descending order