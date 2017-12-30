SELECT       'RBN' as title,  a.callsign AS decall, a.dx AS dxcall, a.freq, a.band, b.["country"] AS country, a.db AS sig_noise, a.date AS date_time, a.date AS insert_time, a.mode, c.["continent"] AS de_continent, b.["continent"] AS dx_continent, 
                         c.["country"] AS de_country, a.tx_mode AS skimmode
FROM            dbo.cqww AS a LEFT OUTER JOIN
                             (SELECT DISTINCT ["prim_dxcc_prefix"], ["country"], ["continent"]
                               FROM            dbo.dxcc) AS b ON a.dx_pfx = b.["prim_dxcc_prefix"] LEFT OUTER JOIN
                             (SELECT DISTINCT ["prim_dxcc_prefix"], ["country"], ["continent"]
                               FROM            dbo.dxcc AS dxcc_1) AS c ON a.de_pfx = c.["prim_dxcc_prefix"]
WHERE        (a.band = '160m' or a.band = '80m' or a.band = '40m' or a.band = '20m' or a.band = '15m' or a.band = '10m')

AND a.date >= Convert(datetime, '2017-12-01 22:00')
    AND a.date < Convert(datetime, '2017-12-03 16:00')
AND a.tx_mode='CW'