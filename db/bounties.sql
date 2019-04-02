DROP TABLE IF EXISTS bounties;

CREATE TABLE bounties (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  value INT,
  last_location VARCHAR(255)
);
