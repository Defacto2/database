# Defacto2, database

The Defacto2 database collects thousands of records documenting the history of the PC Scene. This data powers the [Defacto2](https://defacto2.net) website.

You can download a daily export of the [Postgres](https://www.postgresql.org) database as an SQL document from https://defacto2.net/sql/files.sql.

> [!NOTE] Postgres version 16+ is recommended for the best compatibility.

### First time setup

These instructions are for a Linux or macOS environment with a running Postgres application and
assumes the `postgres` username.

1. Download the SQL export file
2. Create a new database in your Postgres server
3. Import the SQL export file into the new database
4. Test the table creation and data

```sh
# download the latest SQL file
cd ~
curl https://defacto2.net/sql/files.sql --output files.sql

# create the database
createdb --username=postgres defacto2_ps

# import the table and the data
psql --username=postgres --dbname=defacto2_ps --file=files.sql
```

To test the table creation and data.

```sh
psql --username=postgres --dbname='defacto2_ps' --command='SELECT COUNT(*) FROM files;'
```

```sql
 count 
-------
  50000
(1 row)
```
> [!TIP] The count result will depend on the latest export which will not be 50000 exactly.

### Update records with the latest data

Download and import the latest SQL file.

```sh
cd ~
curl https://defacto2.net/sql/files.sql --output files.sql
psql --username=postgres --dbname=defacto2_ps --file=files.sql
```

### Update a Docker container with the latest data

These instructions are for a Linux or macOS environment with a running a Docker [Postgres container](https://hub.docker.com/_/postgres) with the following assumptions:

- Container name: `pgdb` 
- Database name: `defacto2_ps`
- Database username: `postgres`

```sh
# download the SQL file
cd ~
curl https://defacto2.net/sql/files.sql --output files.sql

# copy the SQL file into the container
docker cp files.sql pgdb:/tmp/files.sql

# restore the data
docker exec pgdb psql --username=postgres --dbname=defacto2_ps --file=/tmp/files.sql

# cleanup
docker exec pgdb rm /tmp/files.sql
```

To test the data import.

```sh
docker exec -it pgdb psql --username=postgres --dbname='defacto2_ps' --command='SELECT COUNT(*) FROM files;'
```

```sql
 count
-------
  50000
(1 row)
```