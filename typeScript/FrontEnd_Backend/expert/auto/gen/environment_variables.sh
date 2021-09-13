echo "DB_HOST = localhost
DB_PORT = 3306
DB_NAME = solutionsTech
DB_USER = dev
DB_PASS = secret" > ./.env


echo "root = true

[*]
indent_style = space
indent_size = 4
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = false" > ./.editorconfig


echo "*node_modules
cmd.sh
.env
.dist" > ./.gitignore