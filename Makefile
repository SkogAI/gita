.PHONY: dist test install clean twine auto-completion

install:
	uv venv --seed
	uv tool install -e .
uninstall:
	uv tool uninstall gita
test:
	uv run pytest tests --cov=./gita $(TEST_ARGS) -n=auto -vv
dist:
	uv run setup.py sdist
twine:
	twine upload dist/*
clean:
	git clean -fdx
auto-completion:
	@ mkdir -p auto-completion/bash
	@ mkdir -p auto-completion/zsh
	@ mkdir -p auto-completion/fish
	register-python-argcomplete gita -s bash > auto-completion/bash/.gita-completion.bash
	register-python-argcomplete gita -s zsh > auto-completion/zsh/_gita
	register-python-argcomplete gita -s fish > auto-completion/fish/gita.fish
