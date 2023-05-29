git clone --depth 1 https://github.com/wbthomason/packer.nvim\\n ~/.local/share/nvim/site/pack/packer/start/packer.nvim
# Python Debuger
mkdir ~/.virtualenvs
cd ~/.virtualenvs
python -m venv debugpy
debugpy/bin/python -m pip install debugpy
# Javascript Debugger
git clone https://github.com/microsoft/vscode-js-debug ~/.vscode-js-debug
cd ~/.vscode-js-debug
npm install --legacy-peer-deps
npx gulp vsDebugServerBundle
mv dist out

ln -sf $HOME/opt/scripts/settings/nvim $HOME/.config/nvim
