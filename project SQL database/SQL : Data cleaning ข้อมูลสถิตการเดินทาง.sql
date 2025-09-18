-- JOIN TABLE ข้อมูลการเดินทางปี 62, 63-67, 68
SELECT 
    รูปแบบการเดินทาง, วัตถุประสงค์, [สาธารณะ/ส่วนบุคคล],
    หน่วยงาน, [ยานพาหนะ/ท่า], ปริมาณ, หน่วย
FROM (
    SELECT * FROM passenger62
    UNION
    SELECT * FROM passenger6367
    UNION
    SELECT * FROM passenger68
) AS all_passenger;

-- ต้องการดูข้อมูลแต่ละ sesseion
SELECT 	
	  รูปแบบการเดินทาง,
    [สาธารณะ/ส่วนบุคคล],
    SUM(ปริมาณ) AS ปริมาณทั้งหมด,
    SUM(ปริมาณ) * 100.0 / total.รวมปริมาณทั้งหมด AS percentage
FROM passenger6367
CROSS JOIN (
    SELECT SUM(ปริมาณ) AS รวมปริมาณทั้งหมด
    FROM passenger6367
    WHERE ปริมาณ IS NOT NULL
) AS total
WHERE ปริมาณ IS NOT NULL
GROUP BY รูปแบบการเดินทาง, [สาธารณะ/ส่วนบุคคล], total.รวมปริมาณทั้งหมด;
-- ข้อมูลการเดินทางด้วยรถไฟฟ้า
SELECT 
	    หน่วยงาน,
      [ยานพาหนะ/ท่า],
      SUM(ปริมาณ)
FROM passenger6367
WHERE [ยานพาหนะ/ท่า] LIKE ('รถไฟฟ้า%')
GROUP BY [ยานพาหนะ/ท่า];

SELECT 
    รูปแบบการเดินทาง, วัตถุประสงค์, [สาธารณะ/ส่วนบุคคล],
    หน่วยงาน, [ยานพาหนะ/ท่า], SUM(ปริมาณ), หน่วย
FROM (
    SELECT * FROM passenger62
    UNION
    SELECT * FROM passenger6367
    UNION
    SELECT * FROM passenger68
) AS all_passenger
WHERE รูปแบบการเดินทาง LIKE('ทางราง')
GROUP BY [ยานพาหนะ/ท่า];
