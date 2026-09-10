#!/bin/sh
# Pubblica la cartella docs/ (cruscotto) nel repository pubblico "second-brain-cruscotto".
# Da lanciare dalla radice del vault DOPO aver committato le modifiche a docs/:
#   sh docs/publish.sh
set -e
cd "$(dirname "$0")/.."
if [ -n "$(git status --porcelain docs)" ]; then
  echo "Ci sono modifiche non committate in docs/: fai prima il commit."; exit 1
fi
git push origin main
git subtree push --prefix docs pages main
echo "Cruscotto pubblicato: https://nikolatesla86.github.io/second-brain-cruscotto/"
