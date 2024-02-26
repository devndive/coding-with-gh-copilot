#!/bin/bash

# Variables
RESOURCE_GROUP="rg-sample-app99a"
LOCATION="southcentralus"
ENVIRONMENT="env-sample-app"
APP_NAME="sample-app"
REGISTRY_NAME="registrysampleapp5543r4"
IDENTITY_NAME="identity-sample-app"

az group create \
  --name $RESOURCE_GROUP \
  --location $LOCATION

az acr create \
    --name $REGISTRY_NAME \
    --resource-group $RESOURCE_GROUP \
    --location $LOCATION \
    --sku Basic

ACR_ID=$(az acr show --name $REGISTRY_NAME --resource-group $RESOURCE_GROUP --query "id" -otsv)

az acr build \
    --registry $REGISTRY_NAME \
    --image ${APP_NAME}:latest \
    --file Dockerfile .

az identity create \
  --resource-group $RESOURCE_GROUP \
  --name $IDENTITY_NAME

IDENTITY_ID=$(az identity show --name $IDENTITY_NAME --resource-group $RESOURCE_GROUP --query "id" -otsv)
IDENTITY_CLIENT_ID=$(az identity show --name $IDENTITY_NAME --resource-group $RESOURCE_GROUP --query "clientId" -otsv)

az role assignment create \
  --assignee $IDENTITY_CLIENT_ID \
  --role "AcrPull" \
  --scope $ACR_ID

az containerapp env create \
  --name $ENVIRONMENT \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION

az containerapp create \
  --name ${APP_NAME} \
  --environment $ENVIRONMENT \
  --resource-group $RESOURCE_GROUP \
  --ingress external \
  --target-port 80 \
  --registry-identity $IDENTITY_ID \
  --registry-server $REGISTRY_NAME.azurecr.io \
  --image $REGISTRY_NAME.azurecr.io/${APP_NAME}:latest \
  --query properties.configuration.ingress.fqdn
