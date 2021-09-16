# Fedora Linux on Macbook Pro

## Packages

* mbpfan
    * [Github repo](https://github.com/linux-on-mac/mbpfan)
    * Requires kernel modules:
        * applesmc
        * coretemp
            ```bash
            lsmod | grep -e applesmc -e coretemp || {
                cat <<-MODULES | sudo tee -a /etc/modules
            		coretemp
            		applesmc
            		MODULES
                }
            ```
* powertop
    * Can use `powertop --autotune` to improve battery life

### Alternatives / possibilities

* thermald
    * A general (i.e., non-MBP-specific) thermal management daemon
* `dnf copr search macbook`

## Camera

* [COPR](https://copr.fedorainfracloud.org/coprs/frgt10/facetimehd-dkms/)
