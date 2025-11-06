#!/bin/bash


SEPARATOR="══════════════════════════════════════════════════════════════════════════════════"

PROJECT_ROOT=$(pwd) 

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





function clone_repository_banco() {
    print_header "CLONAGEM DE REPOSITÓRIOS - BANCO DE DADOS"
    read -p 'Clonar o repositório da Oberon-Banco-De-Dados? (S/N): ' RESPOSTA
    
    if [[ "$RESPOSTA" =~ ^[Ss]$ ]]; then
        echo '-> Clonando repositório de banco de dados...'
        source "Oberon-Config-AWS/database/clon_repo.sh"
        echo '-> Clonagem concluída.'
    else
        echo '-> Clonagem de banco de dados foi ignorada.'
    	fi
}


function install_docker_prerequisites() {
    print_header "SETUP DE PRÉ-REQUISITOS DO HOST"
    
    read -p 'Verificar e instalar o Docker ? (S/N): ' RESPOSTA
    if [[ "$RESPOSTA" =~ ^[Ss]$ ]]; then
        echo '-> Verificando status do Docker...'
            source "$PROJECT_ROOT/docker_config/docker_config.sh"
        echo '-> Verificação de Docker concluída.'
    else
        echo '-> Verificação de Docker foi ignorada.'
    fi
}

function run_container_banco() {
    print_header "INICIANDO CONTAINER DE BANCO DE DADOS"
    read -p 'Criar e iniciar o container do Banco de Dados? (S/N): ' RESPOSTA
    
    if [[ "$RESPOSTA" =~ ^[Ss]$ ]]; then
        echo '-> Construindo e iniciando container do DB...'
        cd
            source "$PROJECT_ROOT/docker_config/config_docker_banco_de_dados.sh"
        echo '-> Container do DB iniciado.'
    else
        echo '-> Container do DB ignorado.'
    fi
}


print_separator
echo "║             SCRIPT DE CONFIGURAÇÃO INICIAL DA OBERON                     ║"
print_separator
echo """
      ███████     ███████████  ██████████ ███████████        ███████     ██████   █████
    ███▒▒▒▒▒███ ▒▒███▒▒▒▒▒███▒▒███▒▒▒▒▒█▒▒███▒▒▒▒▒███    ███▒▒▒▒▒███ ▒▒██████ ▒▒███ 
  ███     ▒▒███ ▒███    ▒███ ▒███  █ ▒  ▒███    ▒███  ███     ▒▒███ ▒███▒███ ▒███ 
  ▒███      ▒███ ▒██████████  ▒██████    ▒██████████  ▒███      ▒███ ▒███▒▒███▒███ 
  ▒███      ▒███ ▒███▒▒▒▒▒███ ▒███▒▒█    ▒███▒▒▒▒▒███ ▒███      ▒███ ▒███ ▒▒██████ 
  ▒▒███     ███  ▒███    ▒███ ▒███ ▒  █ ▒███    ▒███ ▒▒███     ███  ▒███  ▒▒█████ 
  ▒▒▒███████▒  ███████████  ██████████ █████  █████ ▒▒▒███████▒  █████  ▒▒█████
    ▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒ ▒▒▒▒▒  ▒▒▒▒▒    ▒▒▒▒▒▒▒    ▒▒▒▒▒    ▒▒▒▒▒    
"""
print_separator
echo "║             CONFIGURAÇÃO DO AMBIENTE VIRTUAL DA OBERON                     ║"
print_separator

cd ~ 
create_target_directory # Cria e navega para ~/oberon

# 2. FLUXO DE SETUP
clone_repository_banco

install_docker_prerequisites 

run_container_banco

print_header "FINALIZAÇÃO DO SETUP"
echo "O script de configuração foi concluído. Verifique o output para erros."
echo "Próximo passo: Use os comandos de start (run_db.sh e run_web.sh) para iniciar os serviços!"
print_separator
