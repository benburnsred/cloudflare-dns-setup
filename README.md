# Cloudflare DNS Setup – Steam Deck / Linux

Switch your Steam Deck or Linux PC to **Cloudflare's free, private DNS** (1.1.1.1) by pasting **one line**.

On Windows? Use the [Windows version](https://github.com/benburnsred/cloudflare-dns-setup) instead.

## What is this?

DNS is like your device's "phone book": it turns website names into addresses. By default, your device uses the one from your internet provider. This switches it to Cloudflare's, which is fast and private, so your lookups stay between you and Cloudflare.

It's a common tweak if some websites or apps don't load properly.

## How to set it up

**1. Steam Deck only: switch to Desktop Mode**

Press the **Steam** button → **Power** → **Switch to Desktop**.

**2. Open Konsole**

Click the app menu in the bottom-left corner → **System** → **Konsole**.
(On other Linux: open the app called **Terminal**.)

**3. Copy this line, paste it into Konsole and press Enter**

```
curl -sL https://raw.githubusercontent.com/benburnsred/cloudflare-dns-setup/linux/set-cloudflare-dns.sh | bash
```

To paste, right-click → **Paste**. On a Steam Deck, press **Steam + X** if you need the on-screen keyboard.

**4. Wait for "Done!"**

Your Wi-Fi reconnects for a second, which is normal. Then close and reopen any apps or browsers that were open.

✅ That's it!

If it asks for a password and you never made one, type `passwd` in Konsole, press Enter, create a password, and then try step 3 again.

---

## How to reset to default

Do the same steps with this line instead:

```
curl -sL https://raw.githubusercontent.com/benburnsred/cloudflare-dns-setup/linux/reset-dns-to-default.sh | bash
```

Your device goes back to using your internet provider's default settings.

> **Note:** This does not restore any custom DNS you set up yourself before. It always resets to the default.

---

## Questions

**Is this safe?**
Yes. It only changes one internet setting: which "phone book" your device uses. Nothing is installed, and you can reset it to default anytime.

**Will this break my Steam Deck or survive updates?**
It doesn't touch the system files, only your Wi-Fi settings, so it's safe and stays in place after SteamOS updates.

**Something still doesn't load.**
Restart the device and try again.

---

<details>
<summary>For techy people: what it actually does</summary>

- Uses `nmcli` (NetworkManager, authorised via polkit, no sudo) on active Wi-Fi/Ethernet connections
- Sets Cloudflare DNS `1.1.1.1` / `1.0.0.1` and `2606:4700:4700::1111` / `2606:4700:4700::1001` with `ignore-auto-dns` (both IPv4 and IPv6, otherwise lookups can still go to the router's DNS over IPv6)
- Sets `connection.dns-over-tls opportunistic` (DNS-over-TLS when systemd-resolved is in use, otherwise ignored)
- Reconnects to apply
- Settings live in `/etc/NetworkManager`, so SteamOS's read-only system partition doesn't need unlocking
- Reset clears these back to DHCP-provided DNS

Requires NetworkManager; the script exits with a message if `nmcli` isn't present.
</details>
