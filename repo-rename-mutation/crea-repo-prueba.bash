REPO=$1
if [ -z "$REPO" ]; then
  REPO=prueba
fi
gh repo create "$(gh pwd)/$REPO" --public