class Clanker < Formula
  desc "A paired local inbox for agents, exposed through MCP"
  homepage "https://github.com/imprintsystems/clanker-chat"
  url "https://github.com/imprintsystems/clanker-chat/releases/download/v0.5.2/clanker-chat-0.5.2.tar.gz"
  version "0.5.2"
  sha256 "783ed91258ceb2e1f136b383e7b4945c6e9470a95f7191d0a4a60ed445ec4cdb"

  depends_on "node@24"
  depends_on "cloudflared"

  def install
    libexec.install Dir["*"]
    (bin/"clanker").write <<~SH
      #!/bin/sh
      export CLANKER_EXECUTABLE="#{opt_bin}/clanker"
      export CLANKER_BREW_FORMULA="#{full_name}"
      export CLOUDFLARED_BIN="#{Formula["cloudflared"].opt_bin}/cloudflared"
      exec "#{Formula["node@24"].opt_bin}/node" "#{opt_libexec}/src/cli.js" "$@"
    SH
    chmod 0755, bin/"clanker"
  end

  service do
    run [opt_bin/"clanker", "start"]
    keep_alive true
    environment_variables PATH: std_service_path_env
    log_path var/"log/clanker.log"
    error_log_path var/"log/clanker-error.log"
    restart_delay 5
    throttle_interval 5
  end

  def caveats
    <<~EOS
      Finish setup with:
        clanker setup
      Choose which agent apps can access your inbox.
      Setup starts the background service and saves their MCP connections.
      To stop it:
        brew services stop #{full_name}
    EOS
  end

  test do
    assert_match "clanker #{version}", shell_output("#{bin}/clanker --help")
  end
end
