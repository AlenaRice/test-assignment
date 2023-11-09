WITH RECURSIVE Months(MonthNumber) AS (
    SELECT 1
    UNION ALL
    SELECT MonthNumber + 1 FROM Months WHERE MonthNumber < 12
)
SELECT
    MonthNumber AS Месяц,
    CASE
        WHEN MonthNumber IN (1, 3, 5, 7, 8, 10, 12) THEN 31
        WHEN MonthNumber IN (4, 6, 9, 11) THEN 30
        ELSE CASE
            WHEN (strftime('%Y', 'now') % 4 = 0 AND strftime('%Y', 'now') % 100 != 0) OR (strftime('%Y', 'now') % 400 = 0)
            THEN 29
            ELSE 28
        END
    END AS Количество_дней
FROM Months;
