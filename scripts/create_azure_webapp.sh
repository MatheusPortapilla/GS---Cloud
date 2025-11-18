#!/usr/bin/env bash
set -euo pipefail

# Parametrização básica (altere conforme necessário ou exporte variáveis antes de executar)
RESOURCE_GROUP="${RESOURCE_GROUP:-rg-gs-cloud-2tsc}"
LOCATION="${LOCATION:-brazilsouth}"
PLAN_NAME="${PLAN_NAME:-plan-gs-cloud-2tsc}"
WEBAPP_NAME="${WEBAPP_NAME:-webapp-luish-2tsc}"
RUNTIME="${RUNTIME:-PYTHON:3.12}"

print_step() {
  echo "============================"
  echo "$1"
  echo "============================"
}

print_step "Criando Resource Group"
az group create \
  --name "$RESOURCE_GROUP" \
  --location "$LOCATION"

print_step "Criando App Service Plan"
az appservice plan create \
  --name "$PLAN_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --sku B1 \
  --is-linux

print_step "Criando WebApp Linux"
az webapp create \
  --name "$WEBAPP_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --plan "$PLAN_NAME" \
  --runtime "$RUNTIME"

print_step "Aplicando configurações do WebApp"
az webapp config appsettings set \
  --name "$WEBAPP_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --settings \
    WEBSITE_RUN_FROM_PACKAGE=1 \
    SCM_DO_BUILD_DURING_DEPLOYMENT=false

print_step "Configurando logs do WebApp"
az webapp log config \
  --name "$WEBAPP_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --application-logging filesystem \
  --web-server-logging filesystem \
  --level information

print_step "Infraestrutura criada com sucesso!"
echo "URL do WebApp: https://$WEBAPP_NAME.azurewebsites.net/"
