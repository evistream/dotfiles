
cd ~
mkdir -m 700 .ssh
cd .ssh
touch authorized_keys
chmod 600 authorized_keys
echo 'ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBADTuFA7x6wRsNCgtToOYTNBT4EqJvjn/gzvoJPxqgkHQlEJjouXEV29sFVzzCck1j0tup383PkxKT9wubh1PNl9egFrTX3tWoBPN9l2zj/xBaDuta1UJ0Xg8oGwni8HHbxFiWFyvXG0yTYYTb7HOQLWtufUIGeTJDAvxavZOcqkIdLyEg== sucknmba' >> authorized_keys

cd ~
python3.6 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install numpy scipy pandas matplotlib jupyter h5py parse autopep8

ln -s ~/dotfiles/zshrc ~/.zshrc

# export JUPYTER_CONFIG_DIR=$VIRTUAL_ENV/etc/jupyter
# export JUPYTER_DATA_DIR=$VIRTUAL_ENV/share/jupyter
# export JUPYTER_RUNTIME_DIR=$VIRTUAL_ENV/share/jupyter/runtime

export JUPYTER_CONFIG_DIR=~/.jupyter
rm -rf $JUPYTER_CONFIG_DIR 
ln -s ~/dotfiles/jupyter $JUPYTER_CONFIG_DIR

pip install jupyter_contrib_nbextensions
jupyter contrib nbextension install --sys-prefix
pip install jupyter_nbextensions_configurator
jupyter nbextensions_configurator enable --sys-prefix

mkdir -p ~/Documents/sakurayama_workspace