#!/bin/bash
# push.sh — atualiza o arquivo e faz deploy automático na Vercel via GitHub
# Uso: ./push.sh [mensagem opcional]
# Exemplo: ./push.sh "ajusta copy do hero"

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Mensagem de commit: usa o argumento passado ou gera automática com data/hora
MSG="${1:-atualiza calculadora $(date '+%d/%m/%Y %H:%M')}"

git add index.html
git commit -m "chore: $MSG" 2>/dev/null || echo "Nenhuma alteração para commitar."
git push origin main

echo ""
echo "Publicado! A Vercel fará o deploy automaticamente em ~30 segundos."
