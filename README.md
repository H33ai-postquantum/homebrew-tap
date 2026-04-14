# H33 Homebrew Tap

Homebrew formulae for H33 tools.

## Install

```bash
brew tap h33ai-postquantum/tap
brew install cachee
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| `cachee` | Post-quantum caching service with nanosecond reads and PQ attestation |

## Usage

```bash
cachee init          # Generate config + keypair
cachee start         # Start daemon on port 6380
cachee set key val   # Store a value
cachee get key       # Retrieve a value
cachee bench         # Run throughput/latency benchmark
cachee attest --enable  # Enable PQ attestation
```

## Links

- [Cachee Documentation](https://cachee.ai/docs)
- [AWS Marketplace](https://aws.amazon.com/marketplace/pp/prodview-iutj4uiduz4di)
- [GitHub](https://github.com/H33ai-postquantum/cachee-cli)
