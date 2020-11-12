SELECT 
        q.id,
        q.year,
       IFNULL(npv, 0) npv
FROM 
        Queries q
LEFT JOIN
        NPV n
using (id, year);

