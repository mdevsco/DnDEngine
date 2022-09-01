# ``DnDEngine``

A powerful engine for DnD games and applications

## Overview

The ``DnDEngine`` is broken down generally into two categories of API, **Content** and **Core**.  

### Content
The content structs are object instances of general shared data about things like Monsters, Classes, Races, Spells, Equipment, Lanaguages, Traits, etc.  Content may be referenced by the Core, but they are intented as static and non-mutable.

> Each type of content has a `loadXXX()` static method that can be used to load data from a local database or a remote webservice.

Content is generally intended as instructional for the user and otherwise have no facility to perform any kind of "in-game" action nor are they able to provide any kind of real-time player or monster state.  For this you need to use the Core portion of this API (See next)

### Core
The core classes and utilities are designed to provide an app with all of the necessary logic to store and alter state of players as they adventure and to also manage state during combat.  Much of the Core is designed around assisting with the caluations required when performing various "ability/skill checks" as well as other actions like attack rolls.

In addition to managing player state, the Core also provides a DM with the ability to create and manage the state of their NPCs.  NPCs may also manifest during combat sessions (see ``DnDCombatSession``).

### Networking
The Networking aspect of the API is all about managing collaborative play between Player devices and the Dungeon Master.  **NOTE:** The engine can work in without use of any of these features.



## Topics

### Character Creation
Nullam at diam lacinia, porta felis eget, auctor magna. In sed porta metus, ut mollis dui. Morbi ut eros libero. Etiam eget eros purus.

- ``DnDAbilityType``
- ``DnDSkillType``

### Managing Adventure

### Managing Combat
