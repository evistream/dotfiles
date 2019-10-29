# 研究室で計算用サーバーを設定するためのファイル
HOSTNAME=node2
LOCAL_IP=157.82.23.245/24
ADDUSERNAME=node

# selinux
mv /etc/selinux/config{,.org}
sed s/SELINUX=.*$/SELINUX=disabled/ /etc/selinux/config.org > /etc/selinux/config

## ネットワーク	
# nmcliを使用して設定。
# 設定を修正する場合、nmcli con addの操作は冪等ではないのでnmtuiを使いマニュアルで再設定するべし。
GW_IP=157.82.23.1
CONNAME=ether1
IFNAME=`nmcli device status | grep ethernet | head -n1 | awk '{print $1}'`
nmcli con add type ethernet con-name $CONNAME ifname $IFNAME ip4 $LOCAL_IP \
gw4 $GW_IP
nmcli con mod $CONNAME ipv4.dns "133.11.123.45 133.11.124.164"
nmcli con up $CONNAME ifname $IFNAME
# ホスト名の変更
OFFICENAME=nelab
hostnamectl set-hostname $HOSTNAME.$OFFICENAME

## タイムゾーン
timedatectl set-local-rtc 0
timedatectl set-timezone Asia/Tokyo

## Firewall
firewall-cmd --zone=public --add-port 8888/tcp --permanent #jupyter
firewall-cmd --zone=public --add-port 5901/tcp --permanent #vncserver
firewall-cmd --reload

## パッケージインストール
yum install -y epel-release
yum install -y zsh python36

## ユーザーの初期設定
chsh -s /bin/zsh $ADDUSERNAME
sudo -u $ADDUSERNAME sh ./dotfiles/initialize_user.sh

## vncserver
yum install -y tigervnc-server
