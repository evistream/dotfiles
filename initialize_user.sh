
cd ~
mkdir -m 700 .ssh
cd .ssh
touch authorized_keys
chmod 600 authorized_keys
echo 'ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBADTuFA7x6wRsNCgtToOYTNBT4EqJvjn/gzvoJPxqgkHQlEJjouXEV29sFVzzCck1j0tup383PkxKT9wubh1PNl9egFrTX3tWoBPN9l2zj/xBaDuta1UJ0Xg8oGwni8HHbxFiWFyvXG0yTYYTb7HOQLWtufUIGeTJDAvxavZOcqkIdLyEg== sucknmba' >> authorized_keys

mkdir -p ~/Documents/sakurayama_workspace
cd ~/Documents/sakurayama_workspace
python3.6 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install numpy scipy pandas matplotlib jupyter h5py parse
