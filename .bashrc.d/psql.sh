psql-create-from-csv () {
    IFS= read -r header
    psql-create "$1" "$header"
    psql-copy-csv "$1" "$header"
}

psql-insert-from-csv () {
    IFS= read -r header
    psql-copy-csv "$1" "$header"
}


psql-create () {
    {
      echo "CREATE TABLE $1 ("

      IFS=$'\t'
        for field in $2; do
          echo "  $field VARCHAR,"
        done
      unset IFS
      echo "  _last_field VARCHAR"

      echo ');'
    } | psql
}

psql-copy-csv () {
  {
    echo "\\copy $1(${header//$(printf '\t')/,}) from stdin"
    pv -l
  } | psql
}

psql-read-csv () {
  echo "\\copy (select * from $1) to stdout header" | psql
}
