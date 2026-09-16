#!/usr/bin/env bash
# Beat 1: one web VM behind an HTTP-only NSG.
set -euo pipefail

RG="rg-recitation-bash"
LOC="eastus"
NSG="webNSG"
VM="webServer"

az group create --name "$RG" --location "$LOC"

az network nsg create --resource-group "$RG" --name "$NSG"

az network nsg rule create \
  --resource-group "$RG" \
  --nsg-name "$NSG" \
  --name Allow-HTTP-From-Internet \
  --priority 100 \
  --access Allow \
  --protocol Tcp \
  --destination-port-range 80 \
  --source-address-prefix '*'

# Slow. Leave this terminal running and talk over slides.
# az vm create invents the VNet, subnet, NIC, and public IP.
az vm create \
  --resource-group "$RG" \
  --name "$VM" \
  --image Canonical:ubuntu-24_04-lts:server:latest \
  --size Standard_D2ls_v7 \
  --admin-username azureuser \
  --admin-password CloudAdmin123! \
  --vnet-name testVNet \
  --subnet webSubnet \
  --nsg "$NSG" \
  --nsg-rule NONE \
  --public-ip-sku Standard

echo "Done. ${VM} is up in ${RG}."
