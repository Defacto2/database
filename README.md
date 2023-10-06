# Defacto2 database

Defacto2 releases daily exports of the MySQL database for download. You will need [Docker](https://www.docker.com/products/docker-desktop/) or a preconfigured and running database server that can handle MySQL syntax.

There's also a repository for a Docker, [Defacto2 Postgres database](https://github.com/Defacto2/database-ps).

## Table of contents

- [Defacto2 database](#defacto2-database)
  - [Table of contents](#table-of-contents)
  - [Docker](#docker)
    - [Remove, reset or resync the database data](#remove-reset-or-resync-the-database-data)
  - [SQL create and import](#sql-create-and-import)
      - [Create](#create)
      - [Insert](#insert)
      - [Update](#update)
      - [Instructions](#instructions)
  - [License](#license)
  - [Datasets](#datasets)
    - [Files](#files)
    - [Groups](#groups)
    - [Netresources](#netresources)

## Docker

The recommended and easiest way to create the database is with [Docker Compose](https://www.docker.com/products/docker-desktop/). Which will download and setup a database server with a website admin interface.

```sh
# download this repository
git clone git@github.com:Defacto2/database.git

# change to the database directory
cd database

# run the import and start the database
# (tap Ctrl+c to later stop)
docker compose up
```

Afterwards, the web interface for the database is found at http://localhost:8080/?server=db&username=root&db=defacto2-inno.

- _System_ `MySQL`
- _Server_ `db`
- _Username_ `root`
- __Password__ `example`
- _Database_ `defacto2-inno`

Congratulations, you now have a running database server with the Defacto2 data.

To stop the database server, tap `Ctrl+c` in the terminal.

The rest of the readme can be ignored. It's for those who want to create the database from scratch.

### Remove, reset or resync the database data

The simplist way to reset the database is to delete the container and start again. **This will delete all the data and the database container.**

```sh
cd database

# force-stop the database container
docker compose kill

# delete all the containers and associated volumes
docker compose rm -v sql_dump database web_admin
```

Then rerun the [Docker instructions](#docker) above.


## SQL create and import

Using your preferred database application, you can use one of the following SQL statements to create the database and import the data.

Either of these database applications should be suitable.

- [MySQL Community](https://dev.mysql.com/downloads/mysql/)
- [Percona for MySQL](https://www.percona.com/software/mysql-database/percona-server)
- [MariaDB](https://mariadb.com)

#### Create

Create is a one-time statement that initializes a new database, file table, and table columns.

__[CREATE TABLE SQL download](https://raw.githubusercontent.com/Defacto2/database/main/sql/create-table.sql)__ 

`create-table.sql`

#### Insert

Insert is the daily export that uses an `INSERT` statement __to create all new__ data.

__[INSERT SQL download](https://defacto2.net/sql/d2-sql-insert.sql)__ <small>([SHA1](https://defacto2.net/sql/d2-sql-insert.sql.sha1))</small>

`d2-sql-insert.sql`

#### Update

The daily export update uses `REPLACE INTO` statements __to update__ any existing data.

__[UPDATE SQL download](https://defacto2.net/sql/d2-sql-update.sql)__ <small>([SHA1](https://defacto2.net/sql/d2-sql-update.sql.sha1))</small>

`d2-sql-update.sql`

#### Instructions

In a terminal, use the MySQL client to import the data:

```bash
# download both the create table and insert data SQL statements
curl https://raw.githubusercontent.com/Defacto2/database/main/sql/create-table.sql --output create-table.sql
curl https://defacto2.net/sql/d2-sql-insert.sql --output d2-sql-insert.sql

# import the create table statement to the database using 
# the root account and prompt the root password
mysql -u root -p < create-table.sql

# import the SQL data to the new defacto2-inno database 
mysql -u root -p --database defacto2-inno < d2-sql-insert.sql
```

To test the table creation and data.

```bash
mysql -u root -p --database defacto2-inno
```

```mysql
mysql> SELECT COUNT(*) FROM files;

+----------+
| COUNT(*) |
+----------+
|    41384 |
+----------+
1 row in set (0.01 sec)

mysql> exit
```

## License

The data and these exports are under a [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/) license.

## Datasets

The data gets separated into three tables, `files`, `groups`, and `netresources`.

- `files` that form the site's core and compose of tens of thousands rows of hosted data.
- `groups` comprise of only initialisms and acronyms for scene groups.
- `netresources` are online links to other scene resources, usually websites.

### Files

| Column                    | Description                                                         | Example value                              |
| ------------------------- | ------------------------------------------------------------------- | ------------------------------------------ |
| id                        | Primary key                                                         | `8968`                                     |
| uuid                      | Unique identifier used as the stored file and images name           | `b826e39b-66c6-4929-8e5a-f59b07ffaa00`     |
| list_relations            | List of associated Defacto2 records                                 | Alternative;a84626                         |
| web_id_github             | Github repository Id                                                |                                            |
| web_id_youtube            | YouTube video Id                                                    |                                            |
| web_id_pouet              | Pouët record Id                                                     |                                            |
| web_id_demozoo            | Demozoo record Id                                                   | `158448`                                   |
| group_brand_for           | Group or brand authorship                                           | The Dream Team                             |
| group_brand_by            | Group or brand authorship                                           |                                            |
| record_title              | Production title or magazine issue                                  | Midwinter II                               |
| date_issued_year          | Published year                                                      | 1992                                       |
| date_issued_month         | Published month                                                     | 3                                          |
| date_issued_day           | Published day                                                       | 26                                         |
| credit_text               | Writing credits                                                     |                                            |
| credit_program            | Programming credits                                                 |                                            |
| credit_illustration       | Artist credits                                                      |                                            |
| credit_audio              | Composer credits                                                    |                                            |
| filename                  | Filename of the download                                            | `MID2TDT1.ZIP`                             |
| filesize                  | Size of the download                                                | 30923                                      |
| list_links                | List of associated URLs                                             |                                            |
| file_security_alert_url   | A URL to the results of a virus scan                                |                                            |
| file_zip_content          | List of files and directories contained in the download archive     | DREAM.NFO INTRO.EXE MUSIC TEXT             |
| file_magic_type           | File type metadata                                                  | Zip archive data, at least v1.0 to extract |
| preview_image             | The name of a file within the archive that was used as a screenshot |                                            |
| file_integrity_strong     | SHA386 hash value of the download                                   | 22370b5e81...                              |
| file_integrity_weak       | MD5 hash value of the download                                      | c00fccc640...                              |
| file_last_modified        | Last modified date value of the download                            | 2017-03-19 05:49:14                        |
| platform                  | Computer platform tag                                               | dOS                                        |
| section                   | Category tag                                                        | releaseadvert                              |
| comment                   | Description of the download                                         |                                            |
| deletedat                 | When this record was disabled                                       |                                            |
| deletedby                 | The id of the account which disabled this record                    |                                            |
| createdat                 | When this record was created                                        | 2014-10-13 12:08:52                        |
| dosee_run_program         | Program filename to run in DOSee, the MS-DOS emulator               |                                            |
| retrotxt_readme           | The filename of a text file to display in the browser               | `DREAM.NFO`                                |
| retrotxt_no_readme        | Toggle to disable retrotxt_readme                                   |                                            |
| dosee_hardware_cpu        | DOSee CPU emulation selection                                       | 486                                        |
| dosee_hardware_graphic    | DOSee graphic card selection                                        | vga                                        |
| dosee_hardware_audio      | DOSee audio card selection                                          | covox                                      |
| dosee_no_aspect_ratio_fix | DOSee aspect-ratio toggle                                           |                                            |
| dosee_incompatible        | Flag this record as incompatible with DOSee                         |                                            |
| dosee_no_ems              | DOSee Expanded memory toggle                                        | 1                                          |
| dosee_no_xms              | DOSee Extended memory toggle                                        | 1                                          |
| dosee_no_umb              | DOSee Upper memory toggle                                           | 1                                          |
| dosee_load_utilities      | Load DOSee utilities                                                |                                            |
| updatedby                 | The id of the account which updated this record                     | `ADB7C2BF-7221-467B-B813-3636FE4AE16B`     |
| updatedat                 | When this record was last updated                                   | 2017-03-19 05:57:12                        |

### Groups

| Column      | Description                 | Example value    |
| ----------- | --------------------------- | ---------- |
| id          | Primary key                 | `9`        |
| pubname     | Unique group id             | Razor 1911 |
| initialisms | Acronym or initialism value | RZR        |

### Netresources

| Column           | Description                                        | Example value                                            |
| ---------------- | -------------------------------------------------- | -------------------------------------------------- |
| id               | Primary key                                        | `675`                                              |
| uuid             | Unique identifier                                  | `6c43b299-d7da-4670-a687-70c642b3a33e`             |
| legacyid         | Callback to the original database used by Defacto2 |                                                    |
| httpstatuscode   | HTTP code results from a ping                      | `200`                                              |
| httpstatustext   | HTTP text results from a ping                      | `OK`                                               |
| httplocation     | Unused                                             |                                                    |
| httpetag         | HTTP etag result that's used for cache             |                                                    |
| httplastmodified | HTTP lastmodified result that's used for cache     |                                                    |
| metatitle        | Title metatag                                      | Demozoo                                            |
| metadescription  | Description metatag                                |                                                    |
| metaauthors      | Authors metatag                                    |                                                    |
| metakeywords     | Keywords metatag                                   |                                                    |
| uriref           | Web address                                        | http://demozoo.org                                 |
| title            | Name of the site                                   | Demozoo                                            |
| date_issued_year | Publication year                                   |                                                    |
| date_issued_year | Publication month                                  |                                                    |
| date_issued_year | Publication day                                    |                                                    |
| comment          | About this web resource                            | The world's largest database of scene productions. |
| categorykey      | Category tag                                       | cracktro                                           |
| categorysort     | Subcategory tag                                    | gallery                                            |
| deletedat        | When this record was disabled                      |                                                    |
| deletedatcomment | The reason this record was disabled                |                                                    |
| createdat        | When this record was created                       | 2016-05-07 20:43:36                                |
| updatedat        | When this record was last updated                  | 2017-01-27 22:11:23                                |
