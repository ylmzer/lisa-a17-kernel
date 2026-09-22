#!/bin/bash
set -e

CONFIG_FILE="$1"
echo "[+] Patching config file: $CONFIG_FILE for Android 17 (ACK 6.12 GKI baseline) & HyperOS 4.0..."

# Helper function to enable or add config
set_config() {
    local key="$1"
    local val="$2"
    if grep -q "^# ${key} is not set" "$CONFIG_FILE"; then
        sed -i "s/^# ${key} is not set/${key}=${val}/" "$CONFIG_FILE"
    elif grep -q "^${key}=" "$CONFIG_FILE"; then
        sed -i "s/^${key}=.*/${key}=${val}/" "$CONFIG_FILE"
    else
        echo "${key}=${val}" >> "$CONFIG_FILE"
    fi
}

# 1. Android 17 eBPF requirements
set_config "CONFIG_BPF" "y"
set_config "CONFIG_BPF_SYSCALL" "y"
set_config "CONFIG_BPF_JIT" "y"
set_config "CONFIG_BPF_JIT_ALWAYS_ON" "y"
set_config "CONFIG_CGROUP_BPF" "y"
set_config "CONFIG_NETFILTER_XT_MATCH_BPF" "y"
set_config "CONFIG_BPF_STREAM_PARSER" "y"

# 2. Cgroups v2 and Process Freezer (Required for A16/A17 init)
set_config "CONFIG_CGROUPS" "y"
set_config "CONFIG_CGROUP_FREEZER" "y"
set_config "CONFIG_PSI" "y"
set_config "CONFIG_PSI_DEFAULT_DISABLED" "n"
set_config "CONFIG_MEMCG" "y"
set_config "CONFIG_MEMCG_SWAP" "y"

# 3. File systems
set_config "CONFIG_EROFS_FS" "y"
set_config "CONFIG_EROFS_FS_ZIP" "y"
set_config "CONFIG_F2FS_FS" "y"
set_config "CONFIG_OVERLAY_FS" "y"

# 4. HyperOS & Vendor compatibility
# Disable modversions so stock HyperOS vendor .ko drivers can load without signature mismatch
set_config "CONFIG_MODVERSIONS" "n"
set_config "CONFIG_MODULE_SIG" "n"
set_config "CONFIG_MODULE_SIG_ALL" "n"

# 5. SELinux permissive capability
set_config "CONFIG_SECURITY_SELINUX_DEVELOP" "y"

# 6. Built-in UFS Storage & Core SoC Drivers (Instant booting on both A16 & A17 without DLKM dependency)
set_config "CONFIG_SCSI_UFSHCD" "y"
set_config "CONFIG_SCSI_UFSHCD_PLATFORM" "y"
set_config "CONFIG_SCSI_UFS_QCOM" "y"
set_config "CONFIG_PHY_QCOM_UFS" "y"
set_config "CONFIG_PHY_QCOM_UFS_QMP_V4_LAHAINA" "y"
set_config "CONFIG_SCSI_UFS_CRYPTO" "y"
set_config "CONFIG_SCSI_UFS_CRYPTO_QTI" "y"
set_config "CONFIG_COMMON_CLK_QCOM" "y"
set_config "CONFIG_QCOM_SCM" "y"

# 7. Display & Touchscreen Subsystems (Direct hardware init without msm_drm.ko failure)
set_config "CONFIG_DRM_MSM" "y"
set_config "CONFIG_DRM_MSM_DPU" "y"
set_config "CONFIG_DRM_MSM_DSI" "y"
set_config "CONFIG_MSM_MMRM" "y"
set_config "CONFIG_DRM_PANEL" "y"
set_config "CONFIG_BACKLIGHT_CLASS_DEVICE" "y"
set_config "CONFIG_BACKLIGHT_GENERIC" "y"
set_config "CONFIG_TOUCHSCREEN_XIAOMI_TOUCHFEATURE" "y"
set_config "CONFIG_MODULE_FORCE_LOAD" "y"

echo "[+] Config patching complete!"

