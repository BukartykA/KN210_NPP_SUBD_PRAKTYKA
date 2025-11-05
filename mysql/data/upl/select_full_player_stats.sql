SELECT
    gr.imya AS Imya_Gravtsya,
    gr.prizvyshche AS Prizvyshche_Gravtsya,
    kom.nazva AS Komanda,
    
    COUNT(DISTINCT pm.id_matchu) AS Kilkist_Matchiv,

    COUNT(DISTINCT g.id_gola) AS Kilkist_Goliv,
    
    COUNT(DISTINCT k.id_kartky) AS Kilkist_Kartok
FROM
    gravets gr
JOIN
    komanda kom ON gr.id_komandy = kom.id_komandy
LEFT JOIN
    gol g ON gr.id_gravtsya = g.id_gravtsya
LEFT JOIN
    kartka k ON gr.id_gravtsya = k.id_gravtsya
LEFT JOIN
    (
        SELECT id_gravtsya, id_matchu FROM gol
        UNION
        SELECT id_gravtsya, id_matchu FROM kartka
    ) AS pm ON gr.id_gravtsya = pm.id_gravtsya

GROUP BY
    gr.id_gravtsya, gr.imya, gr.prizvyshche, kom.nazva
ORDER BY
    Kilkist_Goliv DESC, Kilkist_Matchiv DESC;