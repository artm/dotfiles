# inspiration:
# https://stuartleeks.com/posts/vscode-devcontainer-clipboard-forwarding/

if command -v socat > /dev/null ; then
  : ${clipboard_port:=8121}
  [[ -n $WSL_INTEROP ]] && (
    pgrep -f "tcp-listen:${clipboard_port}" ||
    setsid socat "tcp-listen:$clipboard_port,fork,bind=0.0.0.0" EXEC:clip.exe &
  ) > /dev/null 2>&1
fi
