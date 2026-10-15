# computercraft

My collection of [ComputerCraft](https://www.curseforge.com/minecraft/mc-mods/computercraft) scripts for use in Tekkit, specifcally for [CC: Tweaked](https://tweaked.cc/) as found in the [Tekkit 2](https://www.technicpack.net/modpack/tekkit-2.1935271) modpack.

## introduction

I have been playing around with Tekkit 2 recently. Even though I ran [a Minecraft server](http://minecraft.eagleworld.net/) for quite a few years, a good percentage of it on [Tekkit Classic](https://www.technicpack.net/modpack/tekkit.552560), I never had time to play with ComputerCraft. When I learned that computers in the game world could talk to the Internet and use `wget` and `pastebin` commands to download files, I knew I needed to make a software repository that would allow me to share code across multiple systems.

After playing around with my first scripts in Lua, I knew this would be a great way to learn a new programming language and help maintain my programming prowess in the age of AI. While I am not against using AI in programming (I do so at work regularly), I prefer to [limit my AI usage](#ai-disclaimer) for my personal projects. This is a hobby project where the entire point is to enjoy programming, so letting an AI do the coding for me defeats the purpose. So, this repo is not just for fun inside of Tekkit, it is also a chance to program for fun and a learning experience for me.

## quickstart

For now, use the stable GitHub URL to wget the bootstrap file in your ComputerCraft PC:

```bash
wget https://raw.githubusercontent.com/eaglerock1337/computercraft/refs/heads/main/bootstrap.lua bootstrap.lua
```

After downloading the bootstrapper, running `bootstrap` will allow you to install the specified role:

```bash
bootstrap           // install base programs
bootstrap base      // install base programs
bootstrap factory   // install factory programs
bootstrap lib       // install libraries
```

## available scripts

What is available in the repo right now:

- `bootstrap` - Bootstrapper application for installing/updating scripts from this repo
- `info` - Display basic information about your computer
- `power` - Monitoring program for IndustrialCraft MSFU power storage
- `sr` - Report on the strategic reserves inside a LogisticsPipes network
- `testprint` - A command for testing a printer either connected locally or over Rednet

## upcoming work

The following are short-term goals of this repo and should be coming soon:

- a repository of ready-to-use (or configure) basic software inside of ComputerCraft
- a repository server to keep an in-game copy of all software to minimize GitHub usage
- a package management client to download software and apply roles
- a library of useful modules with useful functions
- adding configuration options to software for use outside of my server network
- a reworked bootstrapping tool (with short url)
- a tool for exporting scripts and data to pastebin or a similar site hosted on marks.dev

## ai disclaimer

The programs and code in this repo were made with the assistance of agentic AI in the following ways:

- assistance learning the ComputerCraft mod
- assistance learning the Lua programming language
- assistance learning and applying standard software design patterns (e.g. from the [Gang of Four](https://en.wikipedia.org/wiki/Design_Patterns))
- generating example and reference code for the above topics

Other than what is explicitly mentioned above, agentic AI or LLMs were not used in the making of this repository. No command-line coding harnesses (e.g. `claude` or `codex`) were used, and 100% of the code and text in this repo was written by me.
