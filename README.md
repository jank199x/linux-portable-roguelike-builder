
# JankPRLB4L

## Portable Rogue-Like Builder for Linux

Uses Docker & GNU Make to compile portable versions of roguelike games for Linux (I use Fedora 35 at the moment).

Compiled versions are put in `build/` directory, in subdirs named after game versions, e.g. `build/crawl-0.28.0`.

If no specific version requested, latest git build is used, and subdir is named after current date, e.g. `build/crawl-220608`.

## But why?

Because I like having my games stored in a single directory, so that they're easy to backup.

Also because it's easier to have multiple versions of the same game this way.

## Supported roguelikes

- Dungeon Crawl Stone Soup (w/ bcrawl fork)
  - `make crawl`
  - `make bcrawl`
- Infra Arcana
  - `make infra-arcana`
- Brogue
  - `make brogue`

IA and Brogue are built using Ubuntu 20.04 LTS.

DCSS is built using Fedora 35.

Because reasons.

## Building specific version

```shell
make crawl VERSION=0.28.0
```

`VERSION` is optional.

If no `VERSION` is provided, `VERSION=master` is used.
