help:
	cat Makefile

sync:
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

clean:
	rm -f plugin/packer_compiled.lua
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerClean'

