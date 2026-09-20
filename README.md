# 🚀 Xiaomi 11 Lite 5G NE (lisa) - Android 17 & HyperOS 4.0 Kernel Builder

Bu depo, **Xiaomi 11 Lite 5G NE (`lisa` - SM7325 / Snapdragon 778G)** cihazı için **Android 17 (ACK 6.12 GKI baseline)** gereksinimlerini karşılayan ve **HyperOS 4.0** donanım sürücüleriyle %100 uyumlu özel çekirdeği (Custom Kernel) **GitHub Actions bulut sunucularında ücretsiz olarak derlemek** için hazırlanmıştır.

---

## 🛠️ Entegre Edilen A17 & HyperOS Özellikleri

1. **eBPF Alt Sistemi:**
   * `CONFIG_BPF=y`, `CONFIG_BPF_SYSCALL=y`, `CONFIG_BPF_JIT=y`, `CONFIG_CGROUP_BPF=y`
   * Android 17 `bpfloader` ve `netd` ağ sayaçlarının çökmesini önler.
2. **Cgroups v2 & Process Freezer:**
   * Android 17 `init` ve Zygote'un gereksinim duyduğu modern kaynak yönetimi.
3. **HyperOS / Vendor Uyumluluğu:**
   * `CONFIG_MODVERSIONS=n` (Lisa'nın orijinal HyperOS vendor modüllerinin `.ko` imza hatası vermeden yüklenmesini sağlar).
4. **Dosya Sistemleri:**
   * EROFS ve F2FS tam çekirdek içi desteği.

---

## ⚡ Nasıl Derlenir? (3 Basit Adım)

1. **GitHub'da Yeni Bir Depo Açın:**
   * [GitHub.com](https://github.com) adresine gidin ve **New repository** (Yeni Depo) oluşturun (Örn: `lisa-a17-kernel`).
2. **Kodları Gönderin (Push):**
   * Terminalden / PowerShell'den şu komutları çalıştırın (kendi kullanıcı adınızı yazarak):
     ```bash
     cd c:\Users\eyilm\Documents\Port\lisa_kernel_builder
     git remote add origin https://github.com/KULLANICI_ADINIZ/lisa-a17-kernel.git
     git branch -M main
     git push -u origin main
     ```
3. **Tek Tıkla Derlemeyi Başlatın:**
   * GitHub deponuzda **Actions** sekmesine tıklayın.
   * **"Build Lisa Kernel (Android 17 & HyperOS 4.0)"** iş akışını seçin ve **Run workflow** butonuna basın.
   * Yaklaşık 12-15 dakika sonra derleme tamamlanacak ve **Artifacts** bölümünden doğrudan **`Lisa_A17_HyperOS4_Kernel.zip`** ve **`Image`** çekirdek dosyasını indirebileceksiniz!
