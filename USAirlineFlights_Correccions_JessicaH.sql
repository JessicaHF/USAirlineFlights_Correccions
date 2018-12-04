/*CORRECCIONS
4-. Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen (mateixa
consulta que abans i amb el mateix ordre). Però a més, ara volen que en comptes
del codi de l’aeroport es mostri el nom de la ciutat.*/
SELECT City,colYear as Year,colMonth as Month,if(avg(ArrDelay) >0,'RETARD',"") as Retrasos
FROM Flights
LEFT JOIN USAirports
ON Origin=IATA
GROUP BY City, colYear, colMonth;
/*5-. Les companyies amb més vols cancelats. A més, han d’estar ordenades de forma
que les companyies amb més cancelacions apareguin les primeres.*/
SELECT Description, count(Cancelled) as Cancelled
FROM carriers
INNER JOIN Flights
ON Code = UniqueCarrier
WHERE Cancelled is not null
GROUP BY Description
ORDER BY Cancelled;
/*6-.L’identificador dels 10 avions que més distància han recorregut fent vols.*/
SELECT sum(Distance) AS TotalDistance, FlightNum, TailNum
FROM Flights
WHERE TailNum NOT LIKE '%NA%'
GROUP BY FlightNum, TailNum
ORDER BY TotalDistance ASC LIMIT 10
