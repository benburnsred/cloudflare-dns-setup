#!/usr/bin/env bash
# Switch Wi-Fi/Ethernet to Cloudflare DNS (IPv4 + IPv6, encrypted when possible).
# For SteamOS (Steam Deck) and other Linux using NetworkManager. No sudo needed.
set -euo pipefail

command -v nmcli >/dev/null || { echo "This system doesn't use NetworkManager, so this script can't run here."; exit 1; }

echo "Switching to Cloudflare DNS, please wait..."
for uuid in $(nmcli -g UUID,TYPE connection show --active | awk -F: '$2 ~ /^802-(11-wireless|3-ethernet)$/ {print $1}'); do
  nmcli connection modify "$uuid" ipv4.dns "1.1.1.1 1.0.0.1" ipv4.ignore-auto-dns yes connection.dns-over-tls opportunistic
  nmcli connection modify "$uuid" ipv6.dns "2606:4700:4700::1111 2606:4700:4700::1001" ipv6.ignore-auto-dns yes 2>/dev/null || true
  nmcli connection up "$uuid" >/dev/null  # reconnect to apply
done

echo "Done! Restart any apps or browsers that were open."
