LAB=$1
if [ -z "$LAB" ]; then
  LAB=prueba
fi

GETID='
query getRepoId($owner: String!, $lab: String!) {
  repository(owner: $owner, name: $lab) {
    id
  }
}'

gh api graphql -f owner="$(gh pwd)" -f lab="$LAB" -F query="$GETID" --jq '.data.repository.id'