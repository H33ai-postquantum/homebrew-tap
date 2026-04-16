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

---

**H33 Products:** [H33-74](https://h33.ai) · [Auth1](https://auth1.ai) · [Chat101](https://chat101.ai) · [Cachee](https://cachee.ai) · [Z101](https://z101.ai) · [RevMine](https://revmine.ai) · [BotShield](https://h33.ai/botshield)

*Introducing H33-74. 74 bytes. Any computation. Post-quantum attested. Forever.*


---

## H33 Product Suite

| Product | Description |
|---------|-------------|
| [H33.ai](https://h33.ai) | Post-quantum security infrastructure |
| [V100.ai](https://v100.ai) | AI Video API — 20 Rust microservices, post-quantum encrypted |
| [Auth1.ai](https://auth1.ai) | Multi-tenant auth without Auth0 |
| [Chat101.ai](https://chat101.ai) | AI chat widget with Rust gateway sidecar |
| [Cachee.ai](https://cachee.ai) | Sub-microsecond PQ-attested cache |
| [Z101.ai](https://z101.ai) | 20+ SaaS products on one backend |
| [RevMine.ai](https://revmine.ai) | Revenue intelligence platform |
| [BotShield](https://h33.ai/botshield) | Free CAPTCHA replacement |

*Introducing H33-74. 74 bytes. Any computation. Post-quantum attested. Forever.*
