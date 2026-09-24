#!/usr/bin/env bash
# Reset Wi-Fi/Ethernet DNS to automatic (your internet provider's default). Does not restore any custom DNS you had before.
set -euo pipefail

command -v nmcli >/dev/null || { echo "This system doesn't use NetworkManager, so this script can't run here."; exit 1; }

echo "Resetting DNS to default, please wait..."
for uuid in $(nmcli -g UUID,TYPE connection show --active | awk -F: '$2 ~ /^802-(11-wireless|3-ethernet)$/ {print $1}'); do
  nmcli connection modify "$uuid" ipv4.dns "" ipv4.ignore-auto-dns no connection.dns-over-tls default
  nmcli connection modify "$uuid" ipv6.dns "" ipv6.ignore-auto-dns no 2>/dev/null || true
  nmcli connection up "$uuid" >/dev/null  # reconnect to apply
done

echo "Done! DNS is reset to your internet provider's default."
