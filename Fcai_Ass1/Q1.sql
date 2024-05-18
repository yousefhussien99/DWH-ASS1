USE DW_Ass;
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Data_From_Api')
BEGIN
    CREATE TABLE Data_From_Api (
        Id NVARCHAR(50),
        Rank INT,
        Symbol NVARCHAR(10),
        Name NVARCHAR(100),
        Supply DECIMAL(30, 15),
        MaxSupply DECIMAL(30, 15),
        MarketCapUsd DECIMAL(30, 15),
        VolumeUsd24Hr DECIMAL(30, 15),
        PriceUsd DECIMAL(30, 15),
        ChangePercent24Hr DECIMAL(30, 15),
        Vwap24Hr DECIMAL(30, 15),
        Explorer NVARCHAR(255)
    );
END
delete from Data_From_Api
select * from Data_From_Api