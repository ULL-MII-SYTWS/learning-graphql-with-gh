ID=$(source get-repo.bash)
echo $ID
TARGET="$1"
if [ -z "$TARGET" ]; then
  TARGET=prueba-funciona
fi
echo $TARGET
gh api graphql -f target="prueba-funciona" -F id="$ID" -F query="@rename.gql" 