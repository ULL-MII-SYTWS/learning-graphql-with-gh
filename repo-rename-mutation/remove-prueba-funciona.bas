REPO=$1
if [ -z "$REPO" ]; then
  REPO="ULL-ESIT-DMSI-1920/prueba-funciona"
fi

gh repo delete $REPO --confirm