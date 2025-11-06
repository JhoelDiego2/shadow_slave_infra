#!/bin/bash

SEPARATOR="══════════════════════════════════════════════════════════════════════════════════"

# Variáveis do Diretório e Repositório
REPO_URL="https://github.com/JhoelDiego2/shadow_slave_banco.git"

REPO_NAME="shadow_slave_banco"

print_separator() {
    echo "║$SEPARATOR║"
}

print_header() {
    echo ""
    echo "$SEPARATOR"
    echo "║  $1"
    echo "$SEPARATOR"
    echo ""
}

check_and_clone_repo() {
    print_header "VERIFICAÇÃO DE AMBIENTE E CLONAGEM"

    echo "-> Iniciando verificação a partir de: $(pwd)"

    # 2. Lógica de Clonagem (dentro de ~/oberon)
    print_header "CLONAGEM DO REPOSITÓRIO: $REPO_NAME"

    if [ -d "$REPO_NAME" ]; then
        echo "-> Repositório '$REPO_NAME' já existe. Nenhuma ação de clonagem necessária."
    else
        echo "-> Clonando repositório '$REPO_NAME' de $REPO_URL..."
        git clone "$REPO_URL"
        
        if [ $? -ne 0 ]; then
            echo "ERRO: Falha ao clonar o repositório. Abortando provisão."
        fi
    fi

    cd ~
    echo ""
    echo "CLONAGEM CONCLUÍDA. Retornando ao diretório: $(pwd)"
}

# Execução do Script
check_and_clone_repo