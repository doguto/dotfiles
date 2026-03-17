#!/bin/bash
# git/setup.sh
#
# ~/.gitconfig に gitconfig.base の include を追加する
# すでに設定済みの場合はスキップする（冪等） 使い方: ~/dotfiles/git/setup.sh

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
BASE_FILE="$DOTFILES_DIR/git/gitconfig.base"
GITCONFIG="$HOME/.gitconfig"
INCLUDE_PATH="~/dotfiles/git/gitconfig.base.conf"

echo "Setting up Git..."

# すでに include が設定済みか確認
if [ -f "$GITCONFIG" ] && grep -qF "$INCLUDE_PATH" "$GITCONFIG"; then
  echo "  Already set up. Skipping."
  echo "...Done setting up Git!"
  exit 0
fi

# ~/.gitconfig に [include] を追記
cat >> "$GITCONFIG" <<EOF

[include]
	path = $INCLUDE_PATH
EOF

echo "  Added include to $GITCONFIG"
echo "...Done setting up Git!"
echo ""
echo "Note: Set your name and email in ~/.gitconfig:"
echo "  [user]"
echo "      name = Your Name"
echo "      email = your@email.com"
echo ""
echo "  See also: ~/dotfiles/git/gitconfig.local.example"
