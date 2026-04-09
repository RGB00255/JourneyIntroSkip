# JourneyIntroSkip

**Disclaimer**: I did not build this myself. This project was built using generative AI (Grok) based off a Hex edit listed here: https://www.pcgamingwiki.com/wiki/Journey#Essential_improvements. 

### How to install:

1. Download the [latest release](https://github.com/RGB00255/JourneyIntroSkip/releases/latest).
2. Extract files to Journey game folder.<sup><small>1</small></sup>
3. Play the game. (Now you get to it faster!)

<sup><small>1</small></sup>: If using Steam: right click the game -> Manage -> Browse Local Files.

The idea of this project is simple: skip the introductory video of Journey without modifying any existing files. This is a DLL meant file to be loaded asap, so this project takes advantage of [Ultimate ASI Loader](https://github.com/ThirteenAG/Ultimate-ASI-Loader) which allows that. This project will automatically download the latest x64 version of dinput8.dll from that repo, build the plugin, and put both dinput8.dll and JourneyIntroSkip.dll (renamed to JourneyIntroSkip.asi) in the build output folder for easy managing; just copy and paste from build folder (pdb not required) into your game and it works!

### Building requirements:

* Visual Studio 2022 or 2026 Community (v143 toolset from VS2022) w/ Desktop development with C++ workload.
* Git (for cloning Ultimate ASI Loader).
* Windows 10 or 11 (64-bit).