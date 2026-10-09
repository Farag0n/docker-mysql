#!/bin/sh

apply_permissions() {
  : "${MYSQL_ROOT_PASSWORD:?MYSQL_ROOT_PASSWORD must be set}"
  : "${MYSQL_USER:?MYSQL_USER must be set}"

  case "$MYSQL_USER" in
    *[!abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_]*)
      printf '%s\n' "MYSQL_USER may contain only letters, numbers, and underscores." >&2
      return 1
      ;;
  esac

  MYSQL_PWD="$MYSQL_ROOT_PASSWORD" mysql --protocol=socket -uroot <<SQL
GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%';
SQL
}

apply_permissions