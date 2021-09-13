# docs: https://www.elastic.co/guide/en/cloud-on-k8s/master/k8s-deploy-eck.html

ECK_VERSION="1.7.1"
TMP_DIR="/tmp/eck_crds"

mkdir -p $TMP_DIR

wget "https://download.elastic.co/downloads/eck/$ECK_VERSION/operator.yaml" -O ../templates/operator.yaml
wget "https://download.elastic.co/downloads/eck/$ECK_VERSION/crds.yaml" -O $TMP_DIR/crds.yaml

# split the CRD definitions in separate files
csplit --silent --prefix="$TMP_DIR/crd_" --suffix-format="%d.yaml" --suppress-matched -z $TMP_DIR/crds.yaml '/^---/' '{*}'
rm $TMP_DIR/crds.yaml

# rename the files to appropriate CRD kind names
for file in $(ls $TMP_DIR); do cp "$TMP_DIR/$file" "../crds/$(cat $TMP_DIR/$file | grep 'kind:' | head -2 | tail -1 | cut -d ':' -f 2 | tr -d ' ' | tr '[:upper:]' '[:lower:]').yaml"; done

rm -rf $TMP_DIR
