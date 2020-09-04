# spksrc-macos-build

One-shot solution to build packages for Synology on macOS

## How?

Simply run:

```bash
sh build.sh <PACKAGE> <ARCHITECTURE>
```

Please check available [packages](https://github.com/SynoCommunity/spksrc/tree/master/spk). As well as [architecture](https://github.com/SynoCommunity/spksrc/wiki/Architecture-per-Synology-model).

For example to build [transmission](https://transmissionbt.com) for [Synology DS218j](https://www.synology.com/en-us/support/download/DS218j), run:

```bash
sh build.sh transmission armada38x
```
