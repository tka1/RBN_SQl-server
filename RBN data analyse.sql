SELECT       'RBN' as title,  a.callsign AS Decall, a.dx AS Dxcall, a.freq, a.band, b.["country"] AS Country, a.db AS sig_noise, a.date AS date_time, a.date AS insert_time, a.mode, c.["continent"] AS De_continent, b.["continent"] AS Dx_continent, 
                         c.["country"] AS De_country, a.tx_mode AS skimmode
FROM            dbo.cqww2024 AS a LEFT OUTER JOIN
                             (SELECT DISTINCT ["prim_dxcc_prefix"], ["country"], ["continent"]
                               FROM            dbo.dxcc_new) AS b ON a.dx_pfx = b.["prim_dxcc_prefix"] LEFT OUTER JOIN
                             (SELECT DISTINCT ["prim_dxcc_prefix"], ["country"], ["continent"]
                               FROM            dbo.dxcc_new AS dxcc_1) AS c ON a.de_pfx = c.["prim_dxcc_prefix"]
WHERE        (a.band = '160m' or a.band = '80m' or a.band = '40m' or a.band = '20m' or a.band = '15m' or a.band = '10m')

AND a.date >= Convert(datetime, '2024-11-23 00:00')
    AND a.date < Convert(datetime, '2024-11-25 00:00')
AND a.tx_mode='CW'