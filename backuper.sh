#!/bin/zsh -e
set -v

cd /home/jiankunli/archlinux.conf
backupRepo="/run/media/jiankunli/Repo1-Jiankunli"

#Step0: 清理垃圾
rm -rf "/home/jiankunli/.mozilla/firefox/Crash Reports"

#Step1: 备份安装软件清单
#参考：https://blog.csdn.net/jyfu2_12/article/details/79853360
#一般软件包：
pacman -Qqen > packages-repository.txt
# recovery: pacman --needed -S - < packages-repository.txt
#AUR：
pacman -Qqem > packages-AUR.txt
# recovery: cat packages-AUR.txt | xargs yay -S --needed --noconfirm


#Step2: 全盘备份Home分区，排除小部分文件
#参考：https://blog.csdn.net/apersonlikep/article/details/89332160
sudo rsync --archive --one-file-system --inplace --hard-links \
  --acls --xattrs --sparse \
  --human-readable --numeric-ids --delete --delete-excluded \
  --itemize-changes --progress \
  --exclude-from=backuper.exclude \
  /home $backupRepo/

#Step3: 备份 etc
sudo rsync --archive --one-file-system --inplace --hard-links \
  --acls --xattrs --sparse \
  --human-readable --numeric-ids --delete --delete-excluded \
  --itemize-changes --verbose --progress \
  /etc $backupRepo/ 
