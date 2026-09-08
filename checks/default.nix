{
  neovim,
  pkgs,
}:
pkgs.runCommand "neovim-smoke-test" {
  nativeBuildInputs = [neovim];
} ''
  # Neovim needs a writable HOME; the sandbox's default does not exist.
  export HOME="$TMPDIR/home"
  export XDG_CACHE_HOME="$HOME/.cache"
  export XDG_CONFIG_HOME="$HOME/.config"
  export XDG_DATA_HOME="$HOME/.local/share"
  export XDG_STATE_HOME="$HOME/.local/state"
  mkdir -p "$XDG_CACHE_HOME" "$XDG_CONFIG_HOME" "$XDG_DATA_HOME" "$XDG_STATE_HOME"

  status=0
  nvim --headless -c 'luafile ${./smoke.lua}' >stdout.log 2>stderr.log || status=$?

  cat stdout.log

  # Startup errors are reported on stderr, and Neovim still exits 0 for some of
  # them -- so an empty stderr is part of the contract.
  if [ -s stderr.log ]; then
    echo
    echo "nvim wrote to stderr:"
    cat stderr.log >&2
    status=1
  fi

  if [ "$status" -ne 0 ]; then
    echo "smoke test failed" >&2
    exit 1
  fi

  touch "$out"
''
