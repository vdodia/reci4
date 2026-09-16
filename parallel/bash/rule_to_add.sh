# Paste into infra.sh for beat 2. A second VM.
# Commenting this out later does NOT delete webServer2 — there is no az vm delete.
az vm create \
  --resource-group "$RG" \
  --name webServer2 \
  --image Canonical:ubuntu-24_04-lts:server:latest \
  --size Standard_D2ls_v7 \
  --admin-username azureuser \
  --admin-password CloudAdmin123! \
  --vnet-name testVNet \
  --subnet webSubnet \
  --nsg "$NSG" \
  --nsg-rule NONE \
  --public-ip-sku Standard
