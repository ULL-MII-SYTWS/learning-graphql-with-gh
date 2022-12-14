REPO=$1
if [ -z "$REPO" ]; then
  REPO="prueba-funciona"
fi
REPO="$(gh pwd)/$REPO"
gh repo delete $REPO --confirm