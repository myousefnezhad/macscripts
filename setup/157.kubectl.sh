sudo mkdir -p ~/opt/oh-my-zsh/custom/plugins/kubectl-autocomplete/
sudo kubectl completion zsh > /tmp/kubectl-autocomplete.plugin.zsh
sudo cp /tmp/kubectl-autocomplete.plugin.zsh ~/opt/oh-my-zsh/custom/plugins/kubectl-autocomplete/kubectl-autocomplete.plugin.zsh
sudo mkdir -p ~/opt/oh-my-zsh/completions
sudo curl -L https://raw.githubusercontent.com/ahmetb/kubectx/master/completion/kubectx.zsh -o ~/opt/oh-my-zsh/completions/_kubectx.zsh
sudo curl -L https://raw.githubusercontent.com/ahmetb/kubectx/master/completion/kubens.zsh -o ~/opt/oh-my-zsh/completions/_kubens.zsh
