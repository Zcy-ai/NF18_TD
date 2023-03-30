CREATE TABLE dpt2 (
    num CHAR(2) PRIMARY KEY,
    nom VARCHAR UNIQUE NOT NULL,
    population INTEGER NOT NULL
);

-- CSV：指定数据文件格式为 CSV 格式。 HEADER：指定数据文件包含表头，即第一行数据为字段名
\copy dpt2 FROM ./dpt2.csv WITH DELIMITER AS ';' CSV HEADER;
