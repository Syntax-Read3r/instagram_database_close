

SET       @@GLOBAL.sql_mode =
REPLACE   (
          @@GLOBAL.sql_mode,
          'ONLY_FULL_GROUP_BY',
          ''
          );