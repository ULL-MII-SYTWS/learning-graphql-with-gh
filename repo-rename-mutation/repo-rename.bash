POSITIONAL_ARGS=()
while [[ $# -gt 0 ]]; do
  case $1 in
    -s|--source)
     SOURCE=$2
     shift # past argument
     shift # past value
     ;;
    -t|--target)
      TARGET=$2
      shift # past argument
      shift # past value
      ;;
    -*|--*)
      echo "USAGE"
      echo "  $0 [options]"
      echo "Available options:"
      echo "  -s, --source <source>  Source repository name"
      echo "  -t, --target <target>  Target repository name"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

if [ -z "$SOURCE" ]; then
  SOURCE=prueba
fi
echo $SOURCE

ID=$(source get-repo.bash)
echo "$SOURCE $ID"

if [ -z "$TARGET" ]; then
  TARGET=prueba-funciona
fi
echo $TARGET
gh api graphql -f target="$TARGET" -F id="$ID" -F query="@rename.gql" 