SELECT       datepart(week , a.date),a.band,avg( cast(a.db as int)) AS snr

FROM            dbo.rbn2017 AS a 
WHERE        (a.band = '160m' or a.band = '80m' or a.band = '40m' or a.band = '20m' or a.band = '15m' or a.band = '10m')

AND a.date >= Convert(datetime, '2017-01-01 22:00')
    AND a.date < Convert(datetime, '2017-12-30 16:00')
AND a.tx_mode='CW'
group by datepart(week , a.date),a.band
order by 1,2