DROP TABLE IF EXISTS Rain;

CREATE TABLE rain(
	City TEXT NOT NULL,
	Average_Rainfall TEXT,
	Winter_Rainfall TEXT,
	Spring_Rainfall TEXT,
	Summer_Rainfall TEXT,
	Fall_Rainfall TEXT,
	Latitude TEXT,
	Longitude TEXT,
	Cluster TEXT);
COMMENT ON TABLE rain IS 'Average rain for each city in Texas';