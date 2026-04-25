class ZkVerify < Formula
  desc "Supply chain security for Claude Code — verifies every package install"
  homepage "https://h33.ai/zk-verify"
  url "https://github.com/H33ai-postquantum/zk-verify-claude/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ce6ea5fa74f03e5df6b3e6855859d4fc54cdca5fbaf7796f8c4317b08e52cf18"
  license "MIT"
  version "1.0.0"

  depends_on "jq"

  def install
    bin.install "zk-verify.sh" => "zk-verify-hook"

    # Install script that wires everything up
    (bin/"zk-verify").write <<~SH
      #!/bin/bash
      set -euo pipefail

      GOLD='\\033[0;33m'
      GREEN='\\033[0;32m'
      DIM='\\033[0;90m'
      BOLD='\\033[1m'
      NC='\\033[0m'

      case "${1:-help}" in
        install)
          mkdir -p "$HOME/.claude/hooks" "$HOME/.h33-zk-verify"

          cp "#{bin}/zk-verify-hook" "$HOME/.claude/hooks/zk-verify.sh"
          chmod +x "$HOME/.claude/hooks/zk-verify.sh"
          echo -e "${GREEN}  ✓ Hook installed${NC}"

          SETTINGS="$HOME/.claude/settings.json"
          if [ -f "$SETTINGS" ] && grep -q zk-verify "$SETTINGS" 2>/dev/null; then
            echo -e "${GREEN}  ✓ Already configured${NC}"
          elif [ -f "$SETTINGS" ]; then
            jq '. + {hooks:{PreToolUse:[{matcher:"Bash",hooks:[{type:"command",command:"$HOME/.claude/hooks/zk-verify.sh",timeout:10,statusMessage:"ZK-Verify: checking package integrity..."}]}]}}' "$SETTINGS" > "$SETTINGS.tmp" && mv "$SETTINGS.tmp" "$SETTINGS"
            echo -e "${GREEN}  ✓ Hook added to Claude Code${NC}"
          else
            mkdir -p "$HOME/.claude"
            echo '{"hooks":{"PreToolUse":[{"matcher":"Bash","hooks":[{"type":"command","command":"$HOME/.claude/hooks/zk-verify.sh","timeout":10,"statusMessage":"ZK-Verify: checking package integrity..."}]}]}}' > "$SETTINGS"
            echo -e "${GREEN}  ✓ Created Claude Code settings${NC}"
          fi

          if [ ! -f "$HOME/.h33-zk-verify/device_id" ]; then
            echo -n "$(hostname)$(whoami)$(date +%s)" | shasum -a 256 | cut -d' ' -f1 | head -c 32 > "$HOME/.h33-zk-verify/device_id"
          fi
          [ ! -f "$HOME/.h33-zk-verify/credits_used" ] && echo "0" > "$HOME/.h33-zk-verify/credits_used"

          echo ""
          echo -e "${GREEN}${BOLD}  ZK-Verify is active.${NC}"
          echo ""
          echo -e "  ${GREEN}✓${NC} npm/pip/cargo/brew installs — verified"
          echo -e "  ${GREEN}✓${NC} curl|sh — always blocked"
          echo -e "  ${GREEN}✓${NC} Typosquatting — caught automatically"
          echo ""
          echo -e "  Free: 1,000 verifications"
          echo -e "  Unlimited: \\$20/year at ${GOLD}h33.ai/zk-verify${NC}"
          ;;
        uninstall)
          rm -f "$HOME/.claude/hooks/zk-verify.sh"
          echo -e "${GREEN}  ✓ Hook removed${NC}"
          ;;
        status)
          CREDITS=$(cat "$HOME/.h33-zk-verify/credits_used" 2>/dev/null || echo "0")
          REMAINING=$((1000 - CREDITS))
          DEVICE=$(cat "$HOME/.h33-zk-verify/device_id" 2>/dev/null || echo "not set")
          INSTALLED="no"
          [ -f "$HOME/.claude/hooks/zk-verify.sh" ] && INSTALLED="yes"
          echo ""
          echo -e "${GOLD}${BOLD}  ZK-Verify Status${NC}"
          echo -e "  Hook:     $INSTALLED"
          echo -e "  Credits:  $CREDITS/1,000 ($REMAINING remaining)"
          echo -e "  Device:   ${DIM}$DEVICE${NC}"
          ;;
        *)
          echo ""
          echo -e "${GOLD}${BOLD}  H33 ZK-Verify for Claude Code${NC}"
          echo ""
          echo "  zk-verify install     Install the hook"
          echo "  zk-verify uninstall   Remove the hook"
          echo "  zk-verify status      Show stats"
          echo ""
          echo "  https://h33.ai/zk-verify"
          ;;
      esac
    SH
    chmod 0755, bin/"zk-verify"
  end

  def caveats
    <<~EOS
      To activate ZK-Verify for Claude Code:

        zk-verify install

      This installs a PreToolUse hook that verifies every
      npm install, pip install, cargo add, and brew install.

      Free: 1,000 verifications. Unlimited: $20/year.
      https://h33.ai/zk-verify
    EOS
  end

  test do
    assert_match "ZK-Verify", shell_output("#{bin}/zk-verify help")
  end
end
