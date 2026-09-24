# Cloudflare DNS Setup – iPhone / iPad / Mac

Switch your iPhone, iPad or Mac to **Cloudflare's free, private DNS** (1.1.1.1) with **one download**. No app needed.

On Windows? Use the [Windows version](https://github.com/benburnsred/cloudflare-dns-setup). Steam Deck or Linux? Use the [Linux version](https://github.com/benburnsred/cloudflare-dns-setup/tree/linux).

## What is this?

DNS is like your phone's "phone book": it turns website names into addresses. By default, your phone uses the one from your internet or mobile provider. This switches it to Cloudflare's, which is fast, private, and encrypted, so nobody along the way can read or change your lookups.

It's a common tweak if some websites or apps don't load properly.

## How to set it up (iPhone / iPad)

**1. Download, using Safari**

Open this page in **Safari** (not Chrome or another browser), then tap:

👉 **[Download Cloudflare-DNS profile](https://github.com/benburnsred/cloudflare-dns-setup/releases/download/ios-v1.0/Cloudflare-DNS.mobileconfig)**

When it asks *"This website is trying to download a configuration profile"*, tap **Allow**, then **Close**.

**2. Open Settings**

Open the **Settings** app. Near the top, tap **Profile Downloaded**.

(Don't see it? Go to **Settings → General → VPN & Device Management** and tap **Cloudflare DNS**.)

**3. Install it**

Tap **Install** (top-right), enter your passcode, then tap **Install** again and **Done**.

It will say **"Unverified"** in red. That's normal for profiles that aren't from a big company, and it's safe to install.

✅ That's it! It works on both Wi-Fi and mobile data. Close and reopen any apps that were open.

## How to set it up (Mac)

1. Click the download link above and open the downloaded file. You'll see *"Profile installation"*.
2. Open **System Settings**, type **Profiles** in the search box, and open it.
3. Double-click **Cloudflare DNS**, click **Install**, and enter your Mac password.

---

## How to reset to default

- **iPhone / iPad:** Settings → General → **VPN & Device Management** → **Cloudflare DNS** → **Remove Profile**.
- **Mac:** System Settings → search **Profiles** → select **Cloudflare DNS** → click the **–** (minus) button.

Your device goes back to using your provider's default settings.

---

## Questions

**Is this safe?**
Yes. It only changes one internet setting: which "phone book" your device uses. It can't see your messages, photos or passwords, and you can remove it anytime.

**It doesn't seem to do anything.**
If you use a VPN or **iCloud Private Relay**, those take priority. Turn them off to use this instead.

**Is there an app instead?**
Yes: Cloudflare's free **[1.1.1.1 app](https://one.one.one.one/)** in the App Store does the same thing with an on/off switch.

---

<details>
<summary>For techy people: what it actually does</summary>

- Unsigned configuration profile with a `com.apple.dnsSettings.managed` payload (iOS / iPadOS 14+, macOS 11+)
- DNS-over-HTTPS to `https://cloudflare-dns.com/dns-query`, bootstrap addresses `1.1.1.1` / `1.0.0.1` / `2606:4700:4700::1111` / `2606:4700:4700::1001`
- Applies on all networks (no on-demand rules), removable by the user
- Can be toggled in Settings → General → VPN & Device Management → DNS
</details>
