#!/bin/bash

# ฟังก์ชันแสดงเมนู
show_menu() {
    echo "===================================="
    echo "         จัดการ V2Ray"
    echo "===================================="
    echo "1. ติดตั้ง V2Ray"
    echo "2. ตรวจสอบสถานะ V2Ray"
    echo "3. รีสตาร์ท V2Ray"
    echo "4. หยุดการทำงาน V2Ray"
    echo "5. ดูไฟล์การตั้งค่า V2Ray"
    echo "6. ออกจากโปรแกรม"
    echo "===================================="
}

# ฟังก์ชันติดตั้ง V2Ray
install_v2ray() {
    echo "กำลังติดตั้ง V2Ray..."
    bash <(curl -L -s https://install.direct/go.sh)
    echo "ติดตั้ง V2Ray เสร็จเรียบร้อย!"
}

# ฟังก์ชันตรวจสอบสถานะ V2Ray
check_status() {
    echo "ตรวจสอบสถานะ V2Ray..."
    systemctl status v2ray
}

# ฟังก์ชันรีสตาร์ท V2Ray
restart_v2ray() {
    echo "กำลังรีสตาร์ท V2Ray..."
    systemctl restart v2ray
    echo "รีสตาร์ท V2Ray เสร็จเรียบร้อย!"
}

# ฟังก์ชันหยุดการทำงานของ V2Ray
stop_v2ray() {
    echo "กำลังหยุดการทำงานของ V2Ray..."
    systemctl stop v2ray
    echo "หยุดการทำงานของ V2Ray เสร็จเรียบร้อย!"
}

# ฟังก์ชันดูไฟล์การตั้งค่า V2Ray
view_config() {
    echo "ไฟล์การตั้งค่า V2Ray (/etc/v2ray/config.json):"
    cat /etc/v2ray/config.json
}

# ลูปเมนูเพื่อเลือกการกระทำ
while true; do
    show_menu
    read -p "กรุณาเลือกตัวเลือก [1-6]: " choice
    case $choice in
        1)
            install_v2ray
            ;;
        2)
            check_status
            ;;
        3)
            restart_v2ray
            ;;
        4)
            stop_v2ray
            ;;
        5)
            view_config
            ;;
        6)
            echo "ออกจากโปรแกรม..."
            exit 0
            ;;
        *)
            echo "ตัวเลือกไม่ถูกต้อง กรุณาลองอีกครั้ง."
            ;;
    esac
done
