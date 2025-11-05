SELECT 
    id_gravtsya,
    imya,
    prizvyshche,
    nomer,
    id_komandy
FROM 
    gravets
WHERE 
    prizvyshche LIKE 'S%';