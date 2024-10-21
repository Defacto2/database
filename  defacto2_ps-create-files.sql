-- Adminer 4.8.1 PostgreSQL 16.4 (Ubuntu 16.4-0ubuntu0.24.04.2) dump

\connect "defacto2_ps";

CREATE SEQUENCE files_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."files" (
    "id" bigint DEFAULT nextval('files_id_seq') NOT NULL,
    "uuid" character(36) DEFAULT 'UUID()',
    "list_relations" character varying(255),
    "web_id_16colors" character varying(1024),
    "web_id_github" character varying(1024),
    "web_id_youtube" character(11),
    "web_id_pouet" bigint,
    "web_id_demozoo" bigint,
    "group_brand_for" character varying(100),
    "group_brand_by" character varying(100),
    "record_title" character varying(100),
    "date_issued_year" smallint,
    "date_issued_month" smallint,
    "date_issued_day" smallint,
    "credit_text" character varying(1024),
    "credit_program" character varying(100),
    "credit_illustration" character varying(1024),
    "credit_audio" character varying(100),
    "filename" character varying(255),
    "filesize" bigint,
    "list_links" character varying(2048),
    "file_security_alert_url" character varying(256),
    "file_zip_content" text,
    "file_magic_type" character varying(255),
    "preview_image" character varying(1024),
    "file_integrity_strong" character(96),
    "file_integrity_weak" character(32),
    "file_last_modified" timestamptz,
    "platform" character(25),
    "section" character(25),
    "comment" text,
    "createdat" timestamptz,
    "updatedat" timestamptz,
    "deletedat" timestamptz,
    "updatedby" character(36),
    "deletedby" character(36),
    "retrotxt_readme" character varying(255),
    "retrotxt_no_readme" smallint,
    "dosee_run_program" character varying(255),
    "dosee_hardware_cpu" character varying(6),
    "dosee_hardware_graphic" character varying(8),
    "dosee_hardware_audio" character varying(9),
    "dosee_no_aspect_ratio_fix" smallint,
    "dosee_incompatible" smallint,
    "dosee_no_ems" smallint,
    "dosee_no_xms" smallint,
    "dosee_no_umb" smallint,
    "dosee_load_utilities" smallint,
    CONSTRAINT "idx_16386_primary" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "idx_16386_browsing" ON "public"."files" USING btree ("date_issued_year", "date_issued_month", "date_issued_day", "section", "platform", "filename", "createdat");

CREATE INDEX "idx_16386_pubfor_pubby_pubedition_filename_comment" ON "public"."files" USING btree ("group_brand_for", "group_brand_by", "record_title", "filename", "comment");

COMMENT ON TABLE "public"."files" IS 'This database is the complete collection of files for download';

COMMENT ON COLUMN "public"."files"."id" IS 'Primary key';

COMMENT ON COLUMN "public"."files"."uuid" IS 'Global identifier';

COMMENT ON COLUMN "public"."files"."list_relations" IS 'List of associated records';

COMMENT ON COLUMN "public"."files"."web_id_16colors" IS 'URI for a 16colo.rs page';

COMMENT ON COLUMN "public"."files"."web_id_github" IS 'Id for a GitHub repository';

COMMENT ON COLUMN "public"."files"."web_id_youtube" IS 'Id for a related YouTube video';

COMMENT ON COLUMN "public"."files"."web_id_pouet" IS 'Id for a Pouët record';

COMMENT ON COLUMN "public"."files"."web_id_demozoo" IS 'Id for a Demozoo record';

COMMENT ON COLUMN "public"."files"."group_brand_for" IS 'Group or brand used to credit the file';

COMMENT ON COLUMN "public"."files"."group_brand_by" IS 'Optional alternative Group or brand used to credit the file';

COMMENT ON COLUMN "public"."files"."record_title" IS 'Display title or magazine edition';

COMMENT ON COLUMN "public"."files"."date_issued_year" IS 'Published date year';

COMMENT ON COLUMN "public"."files"."date_issued_month" IS 'Published date month';

COMMENT ON COLUMN "public"."files"."date_issued_day" IS 'Published date day';

COMMENT ON COLUMN "public"."files"."credit_text" IS 'Writing credits';

COMMENT ON COLUMN "public"."files"."credit_program" IS 'Programming credits';

COMMENT ON COLUMN "public"."files"."credit_illustration" IS 'Artist credits';

COMMENT ON COLUMN "public"."files"."credit_audio" IS 'Composer credits';

COMMENT ON COLUMN "public"."files"."filename" IS 'File name';

COMMENT ON COLUMN "public"."files"."filesize" IS 'Size of the file in bytes';

COMMENT ON COLUMN "public"."files"."list_links" IS 'List of URLs related to this file';

COMMENT ON COLUMN "public"."files"."file_security_alert_url" IS 'URL showing results of a virus scan';

COMMENT ON COLUMN "public"."files"."file_zip_content" IS 'Content of archive';

COMMENT ON COLUMN "public"."files"."file_magic_type" IS 'File type meta data';

COMMENT ON COLUMN "public"."files"."preview_image" IS 'Internal file to use as a screenshot';

COMMENT ON COLUMN "public"."files"."file_integrity_strong" IS 'SHA384 hash of file';

COMMENT ON COLUMN "public"."files"."file_integrity_weak" IS 'MD5 hash of file';

COMMENT ON COLUMN "public"."files"."file_last_modified" IS 'Date last modified attribute saved to file';

COMMENT ON COLUMN "public"."files"."platform" IS 'Computer platform';

COMMENT ON COLUMN "public"."files"."section" IS 'Category';

COMMENT ON COLUMN "public"."files"."comment" IS 'Description';

COMMENT ON COLUMN "public"."files"."createdat" IS 'Timestamp when record was created';

COMMENT ON COLUMN "public"."files"."updatedat" IS 'Timestamp when record was revised';

COMMENT ON COLUMN "public"."files"."deletedat" IS 'Timestamp used to ignore record';

COMMENT ON COLUMN "public"."files"."updatedby" IS 'UUID of the user who last updated this record';

COMMENT ON COLUMN "public"."files"."deletedby" IS 'UUID of the user who removed this record';

COMMENT ON COLUMN "public"."files"."retrotxt_readme" IS 'Text file contained in archive to display';

COMMENT ON COLUMN "public"."files"."retrotxt_no_readme" IS 'Disable the use of RetroTxt';

COMMENT ON COLUMN "public"."files"."dosee_run_program" IS 'Program contained in archive to run in DOSBox';

COMMENT ON COLUMN "public"."files"."dosee_hardware_cpu" IS 'DOSee turn off expanded memory (EMS)';

COMMENT ON COLUMN "public"."files"."dosee_hardware_graphic" IS 'DOSee graphics/machine override';

COMMENT ON COLUMN "public"."files"."dosee_hardware_audio" IS 'DOSee audio override';

COMMENT ON COLUMN "public"."files"."dosee_no_aspect_ratio_fix" IS 'DOSee disable aspect ratio corrections';

COMMENT ON COLUMN "public"."files"."dosee_incompatible" IS 'Flag DOS program as incompatible for DOSBox';

COMMENT ON COLUMN "public"."files"."dosee_no_ems" IS 'DOSBox turn off EMS';

COMMENT ON COLUMN "public"."files"."dosee_no_xms" IS 'DOSee turn off extended memory (XMS)';

COMMENT ON COLUMN "public"."files"."dosee_no_umb" IS 'DOSee turn off upper memory block access (UMB)';

COMMENT ON COLUMN "public"."files"."dosee_load_utilities" IS 'DOSee load utilities';


-- 2024-10-17 22:41:46.284324+00
