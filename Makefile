help:
	cat Makefile

install:
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

sync:
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

clean:
	rm -f plugin/packer_compiled.lua
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerClean'

