package main

import (
	"net"
	"os"
	"path/filepath"
)

func main() {
	clientPath := filepath.Join(os.TempDir(), "unixdomainsocket-client")
	os.Remove(clientPath)

	conn, err := net.ListenPacket("unixgram", clientPath)
	if err != nil {
		panic(err)
	}

	unixServerAddr, err := net.ResolveUnixAddr(
		"unixgram", filepath.Join(os.T)
	)
}
