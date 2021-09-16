#!/bin/bash
# Instructions taken from COPR repo homepage:
# https://copr.fedorainfracloud.org/coprs/frgt10/facetimehd-dkms/

install_firmware() {
    # Downloads and installs firmware appropriate to device model
    # Dependencies: curl, xzcat, cpio
    sudo dnf install kernel-devel
    git clone https://github.com/patjak/facetimehd-firmware.git &&
        cd facetimehd-firmware &&
        make &&
        sudo make install &&
        sudo depmod &&
        sudo modprobe facetimehd
    lsmod | grep facetimehd
    return $?
}

dracut_config() {
    echo 'install_items+=" /usr/lib/firmware/facetimehd/firmware.bin "' |
        sudo tee /etc/dracut.conf.d/facetimehd.conf
}

install_copr() {
    sudo dnf copr enable frgt10/facetimehd-dkms
    sudo dnf install facetimehd
}

sensor_calibration_files() {
    # https://github.com/patjak/bcwc_pcie/wiki/Extracting-the-sensor-calibration-files
    # Download packge: https://support.apple.com/kb/DL1837
    # Extract the \BootCamp\Drivers\Apple\AppleCamera64.exe file
    # Run: unrar x AppleCamera64.exe --> AppleCamera.sys file

    # Check this
    local ft_firmware_dir="/lib/firmware/facetimehd/"

    local bootcamp_firmware_file="AppleCamera64.exe"
    unrar x "$bootcamp_firmware_file"
    local sys_file="${bootcamp_firmware_file/64.exe/.sys}"

    local -a dat_files=(
        9112_01XX.dat
        1771_01XX.dat
        1871_01XX.dat
        1874_01XX.dat
    )
    local -A skip=(
        [${dat_files[0]}]=1663920
        [${dat_files[1]}]=1644880
        [${dat_files[2]}]=1606800
        [${dat_files[3]}]=1625840
    )
    local -A count=(
        [${dat_files[0]}]=33060
        [${dat_files[1]}]=19040
        [${dat_files[2]}]=19040
        [${dat_files[3]}]=19040
    )

    # TODO: Add code to check these before copying to driver dir
    local -A checksums=(
        [${dat_files[0]}]=a1831db76ebd83e45a016f8c94039406
        [${dat_files[1]}]=017996a51c95c6e11bc62683ad1f356b
        [${dat_files[2]}]=3c3cdc590e628fe3d472472ca4d74357
        [${dat_files[3]}]=479ae9b2b7ab018d63843d777a3886d1
    )


    for d in "${dat_files[@]}"; do
        dd \
            bs=1 \
            skip="${skip[$d]}" \
            count="${count[$d]}" \
            if="$sys_file" \
            of="$d" &&
        sudo cp "$d" "$ft_firmware_dir" ||
        { echo "Failed to dd .dat file '$d'" >&2; return -1; }
    done
}

main() {
    install_firmware &&
        dracut_config &&
        install_copr
    # sensor_calibration_files
}
