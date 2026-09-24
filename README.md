# Cloudflare DNS Setup

Switch your computer to **Cloudflare's free, private DNS** (1.1.1.1) in **one double-click** on Windows.

Using a **Steam Deck or Linux**? See the [linux branch](https://github.com/benburnsred/cloudflare-dns-setup/tree/linux) instead.

## What is this?

DNS is like your computer's "phone book": it turns website names into addresses. By default, your computer uses the one from your internet provider. This switches it to Cloudflare's, which is fast, private, and encrypted, so nobody along the way can read or change your lookups.

It's a common tweak if some websites or apps don't load properly.

## How to set it up (Windows)

**1. Download**

👉 **[Click here to download Set-Cloudflare-DNS.cmd](https://github.com/benburnsred/cloudflare-dns-setup/releases/latest/download/Set-Cloudflare-DNS.cmd)**

If your browser says the file *"isn't commonly downloaded"* or *"could be harmful"*, choose **Keep**.

**2. Open it**

Go to your **Downloads** folder and **double-click `Set-Cloudflare-DNS`**.

**3. If a blue box says "Windows protected your PC"**

Click **More info**, then click **Run anyway**.

**4. If Windows asks "Do you want to allow this app to make changes to your device?"**

Click **Yes**.

**5. Wait for "Done!"**

Press any key to close the window. Then close and reopen any apps or browsers that were open.

✅ That's it!

Something still not loading? **Restart your computer**.

---

## How to reset to default

👉 **[Click here to download Reset-DNS-to-Default.cmd](https://github.com/benburnsred/cloudflare-dns-setup/releases/latest/download/Reset-DNS-to-Default.cmd)**

Double-click it and follow the same steps as above. Your computer goes back to using your internet provider's default settings.

> **Note:** This does not restore any custom DNS you set up yourself before. It always resets to the default.

---

## Questions

**Is this safe?**
Yes. It only changes one internet setting: which "phone book" your computer uses. Nothing is installed, and you can reset it to default anytime.

**Why do I get the blue "Windows protected your PC" warning?**
Windows shows it for any small script downloaded from the internet. It's normal.

**Does it work on Mac or phones?**
No, this is for Windows PCs only (Steam Deck and Linux: see the [linux branch](https://github.com/benburnsred/cloudflare-dns-setup/tree/linux)). On a phone, use the free **[1.1.1.1 app](https://one.one.one.one/)** from the App Store or Google Play.

---

<details>
<summary>For techy people: what it actually does</summary>

- Sets the DNS servers of active physical adapters to Cloudflare: `1.1.1.1` / `1.0.0.1` and `2606:4700:4700::1111` / `2606:4700:4700::1001` (both IPv4 and IPv6, otherwise Windows keeps using the router's DNS over IPv6)
- Registers Cloudflare's DoH template with `AutoUpgrade` on and UDP fallback off (encrypted only; Windows 11)
- Flushes the DNS cache
- Reset sets all physical adapters back to DHCP-provided DNS (previous custom DNS is not restored; the DoH template entries are left in place, which is harmless)

On Windows 10 the DoH step is skipped silently, so DNS is plain (unencrypted) Cloudflare.
</details>
