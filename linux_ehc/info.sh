#!/bin/bash

# awk /condition/
# -F"condition to separate each atribute"
# {print $x} x is the position of atribute in the table like lscpu, free -h
# free -h to show info in GB format, free show in kilobytes format

echo "===== THONG TIN HE THONG ====="
echo "- Ten may: $(hostname)"
echo "- Username: $USER"

echo "- Ten ban phan phoi: $(lsb_release -s -d | awk '{print $1}')"
echo "- Phien ban he dieu hanh: $(lsb_release -r -s)"

echo "- Thong tin CPU:"
echo -e "\tTen CPU: $(lscpu | grep 'Model name' | awk -F":" '{print $2}' | sed 's/^ *//')"
echo -e "\tCPU bit: $(lscpu | grep 'CPU op-mode' | awk -F":" '{print $2}' | sed 's/^ *//')"
echo -e "\tToc do: $(cat /proc/cpuinfo | grep "cpu MHz" | uniq | awk -F ':' '{print $2}') MHz"

echo "- Thong tin bo nho vat li (tong bao nhieu GB): $(df -h | grep '/dev/sda3' | awk '{print $2}' | sed 's/Gi/G/')"
echo "- Thong tin o dia con trong bao nhieu GB: $(df -h | grep '/dev/sda3' | awk '{print $4}' | sed 's/Gi/G/')"

# Show info ipv4 of network system
echo "- Danh sach dia chi IP cua he thong:"
echo "$(ip -4 addr | grep inet | awk '{print $2}')"

# sort by alphabet
# getent can run from anywhere 
echo "- Danh sach user tren he thong:"
getent passwd | awk -F: '/\/bin\/(bash|sh)$/ {print $1}' | sort > users.txt
echo -e "\t---> Writen to file \"users.txt\"successfully"


echo "- Thong tin cac tien trinh dang chay voi quyen root:"
ps aux | grep '^root' | awk '{print $11}' | sort > root_proc.txt
echo -e "\t---> Writen to file \"root_proc.txt\"successfully"

# sort -n sort by number
# -o print parts that match the regex, -E is for extend the regex
echo "- Cac port dang mo:"
echo "$(netstat -tuln | grep "LISTEN" | awk '{print $4}' | grep -oE "[0-9]+$" | sort -n | uniq)"


echo "- Danh sach cac thu muc other co quyen write:"
find / -type d -perm -o=w 2>/dev/null > other-dir.txt
echo -e "        ---> Writen to file \"other-dir.txt\"successfully"
