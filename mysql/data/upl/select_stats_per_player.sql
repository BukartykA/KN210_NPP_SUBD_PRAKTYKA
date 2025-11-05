SELECT
    -- 1. Колонка: Футболіст
    gr.imya AS Imya,
    gr.prizvyshche AS Prizvyshche,
    
    -- 2. Колонка: Кількість Голів
    COUNT(DISTINCT g.id_gola) AS Kilkist_Goliv,
    
    -- 3. Колонка: Кількість Карток
    COUNT(DISTINCT k.id_kartky) AS Kilkist_Kartok
FROM
    gravets gr
LEFT JOIN
    gol g ON gr.id_gravtsya = g.id_gravtsya
LEFT JOIN
    kartka k ON gr.id_gravtsya = k.id_gravtsya
GROUP BY
    gr.id_gravtsya, gr.imya, gr.prizvyshche
ORDER BY
    Kilkist_Goliv DESC, Kilkist_Kartok DESC;