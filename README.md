# 🚀 Xiaomi 11 Lite 5G NE (lisa) - Android 17 & HyperOS 4.0 Kernel Builder

Bu depo, **Xiaomi 11 Lite 5G NE (`lisa` - SM7325 / Snapdragon 778G)** cihazı için **Android 17 (ACK 6.12 GKI baseline)** gereksinimlerini karşılayan ve **HyperOS 4.0** donanım sürücüleriyle %100 uyumlu özel çekirdeği (Custom Kernel) oluşturmak için hazırlanmıştır.

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
