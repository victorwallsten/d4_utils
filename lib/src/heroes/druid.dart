import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/druid_cluster.dart';
import 'package:d4_utils/src/enums/druid_skill.dart';
import 'package:d4_utils/src/enums/hero.dart';
import 'package:d4_utils/src/enums/skill_type.dart';

abstract class Druid {
  static Tree<Enum> _skillTree(Enum e, List<Tree<Enum>> children) =>
      Tree(element: e, children: children);

  static List<Tree<Enum>> get _childless => const [];

  static List<String> descriptionOf(DruidSkill druidSkill, int level) {
    int perLevel = level > 0 ? level - 1 : level;
    String s;
    switch (druidSkill) {
      case DruidSkill.Maul:
        return [
          'Generate Spirit: 14',
          'Lucky Hit Chance: 30%',
          'Shapeshift into a Werebear and maul enemies in front of you, dealing ${20 + 2 * perLevel}% damage.',
        ];
      case DruidSkill.EnhancedMaul:
        return [
          'If an enemy is hit by Maul, then Fortify for 2% of your Base Life.',
        ];
      case DruidSkill.FierceMaul:
        return [
          'Increases the range and radius of Maul by 25%.',
        ];
      case DruidSkill.WildMaul:
        return [
          'Maul has a 20% chance to Knock Down enemies for 1.5 seconds.',
        ];
      case DruidSkill.Claw:
        return [
          'Generate Spirit: 10',
          'Lucky Hit Chance: 50%',
          'Shapeshift into a Werewolf and claw at an enemy for ${20 + 2 * perLevel}% damage.',
        ];
      case DruidSkill.EnhancedClaw:
        return [
          'Claw\'s Attack Speed is increased by 10%.',
        ];
      case DruidSkill.FierceClaw:
        return [
          'Claw applies 10% Poisoning damage over 6 seconds.',
        ];
      case DruidSkill.WildClaw:
        return [
          'Claw has a 10% chance to attack twice.',
        ];
      case DruidSkill.StormStrike:
        return [
          'Generate Spirit: 14',
          'Lucky Hit Chance: 25%',
          'Electricity gathers around your weapon, dealing ${20 + 2 * perLevel}% damage to your target and chaining to up to 3 surrounding enemies, dealing 20% less damage each time it chains.',
          '',
          'You gain 25% Damage Reduction for 3 seconds after dealing damage with Storm Strike.',
        ];
      case DruidSkill.EnhancedStormStrike:
        return [
          'Storm Strike has a 15% chance to Immobilize all enemies hit for 2.5 seconds.',
        ];
      case DruidSkill.FierceStormStrike:
        return [
          'Storm Strike has a 50% chance to make enemies Vulnerable for 3 seconds.',
        ];
      case DruidSkill.WildStormStrike:
        return [
          'Storm Strike chains to 2 additional targets.',
        ];
      case DruidSkill.WindShear:
        return [
          'Generate Spirit: 12',
          'Lucky Hit Chance: 20%',
          'Conjure a piercing blade of wind, dealing ${17 + 2 * perLevel}% damage.',
        ];
      case DruidSkill.EnhancedWindShear:
        return [
          'Wind Shear has a 20% chance to make enemies Vulnerable for 4 seconds.',
        ];
      case DruidSkill.FierceWindShear:
        return [
          'Each enemy hit by Wind Shear increases your Movement Speed by 5% for 5 seconds, up to 20%.',
        ];
      case DruidSkill.WildWindShear:
        return [
          'Wind Shear grants 3 additional Spirit for each enemy hit beyond the first.',
        ];
      case DruidSkill.EarthSpike:
        return [
          'Generate Spirit: 10',
          'Lucky Hit Chance: 35%',
          'Sunder the earth, impaling the first enemy hit for ${16 + 1.5 * perLevel}% damage.',
        ];
      case DruidSkill.EnhancedEarthSpike:
        return [
          'Earth Spike has a 10% chance to Stun for 2.5 seconds.',
        ];
      case DruidSkill.FierceEarthSpike:
        return [
          'Fortify for 4% of your Base Life whenever Earth Spike damages enemies who are Stunned, Immobilized, or Knocked Back.',
        ];
      case DruidSkill.WildEarthSpike:
        return [
          'Summon a second Earth Spike when hitting an Immobilized or Stunned enemy.',
        ];
      case DruidSkill.LightningStorm:
        return [
          'Spirit Cost: 15 per strike',
          'Lucky Hit Chance: 15%',
          'Conjure a growing lightning storm that deals ${32 + 3 * perLevel}% damage per strike. The number of strikes increase the longer the storm is channeled up to a maximum of 5 at once.',
        ];
      case DruidSkill.EnhancedLightningStorm:
        return [
          'The size of your Lightning Storm is preserved for 4 seconds after channeling.',
        ];
      case DruidSkill.PrimalLightningStorm:
        return [
          'Lightning Storm has an 8% chance to Immobilize enemies hit for 3 seconds.',
        ];
      case DruidSkill.RagingLightningStorm:
        return [
          'Lightning Storm gains 1 additional lightning strike.',
        ];
      case DruidSkill.Tornado:
        return [
          'Spirit Cost: 40',
          'Lucky Hit Chance: 8%',
          'Conjure a swirling tornado that deals ${35.5 + 3.5 * perLevel}% damage.',
        ];
      case DruidSkill.EnhancedTornado:
        return [
          'Each time you cast Tornado, you have a 20% chance to spawn an additional Tornado.',
        ];
      case DruidSkill.PrimalTornado:
        return [
          'Enemies damaged by Tornado are Slowed by 8% for 3 seconds, stacking up to 40%.',
        ];
      case DruidSkill.RagingTornado:
        return [
          'Enemies hit with Tornado have a 10% chance to become Vulnerable for 3 seconds.',
        ];
      case DruidSkill.Pulverize:
        return [
          'Spirit Cost: 35',
          'Lucky Hit Chance: 33%',
          'Shapeshift into a Werebear and slam the ground, dealing ${50 + 5 * perLevel}% damage to surrounding enemies.',
        ];
      case DruidSkill.EnhancedPulverize:
        return [
          'Your next Pulverize will Overpower every 12 seconds while you remain Healthy.',
        ];
      case DruidSkill.PrimalPulverize:
        return [
          'Enemies hit with Pulverize deal 20% reduced damage for 4 seconds.',
        ];
      case DruidSkill.RagingPulverize:
        return [
          'Enemies Overpowered by Pulverize are Stunned for 2 seconds.',
        ];
      case DruidSkill.Shred:
        return [
          'Spirit Cost: 35',
          'Lucky Hit Chance: 20%',
          'Shapeshift into a Werewolf and perform a trio of combo attacks:',
          '* 1st Attack: Dash towards the target and deal ${25 + 3 * perLevel}% damage.',
          '* 2nd Attack: Deal ${35.5 + 3.5 * perLevel}% damage.',
          '* 3rd Attack: Perform a larger finishing move dealing ${60 + 6 * perLevel}% damage.',
        ];
      case DruidSkill.EnhancedShred:
        return [
          'Shred gains 30% Attack Speed and Heals for 1% of your Maximum Life if an enemy is struck.',
        ];
      case DruidSkill.PrimalShred:
        return [
          'Shred\'s second and third attacks also perform a dash. In addition, Shred\'s Critical Strike Damage is increased by 20%.',
        ];
      case DruidSkill.RagingShred:
        return [
          'Shred\'s third combo attack is larger and applies an additional 51% Poisoning damage over 5 seconds.',
        ];
      case DruidSkill.LandSlide:
        return [
          'Spirit Cost: 30',
          'Lucky Hit Chance: 20%',
          'Crush enemies between 2 pillars of earth, dealing up to ${75 + 8 * perLevel}% damage.',
        ];
      case DruidSkill.EnhancedLandSlide:
        return [
          'After Landslide damages enemies 4 times, the next hit will Immobilize enemies for 3 seconds.',
        ];
      case DruidSkill.PrimalLandSlide:
        return [
          'When you Immobilize or Stun an enemy, you gain a Terramote. Each enemy hit by Landslide consumes a Terramote causing a guaranteed Critical Strike with 40% Critical Strike Damage. Bosses always have up to a 10% chance to grant a Terramote when hit.',
        ];
      case DruidSkill.RagingLandSlide:
        return [
          'When you strike an Immobilized or Stunned enemy with Landslide, an additional pillar of earth is formed.',
        ];
      case DruidSkill.HeartOfTheWild:
        return [
          'Maximum Spirit is increased by ${3 + 3 * perLevel}.',
        ];
      case DruidSkill.WildImpulses:
        return [
          'Your Core Skills cost ${3 + 3 * perLevel}% more Spirit but deal ${5 + 5 * perLevel}% increased damage.',
        ];
      case DruidSkill.Abundance:
        return [
          'Basic Skills generate ${6 + 6 * perLevel}% more Spirit.',
        ];
      case DruidSkill.PredatoryInstinct:
        return [
          'Critical Strike Chance against Close enemies is increased by ${2 + 2 * perLevel}%.',
        ];
      case DruidSkill.DigitigradeGait:
        return [
          'You gain ${3 + 3 * perLevel}% Movement Speed while in Werewolf form.',
          '',
          'This bonus persists for 3 seconds after leaving Werewolf form.',
        ];
      case DruidSkill.IronFur:
        return [
          'You gain ${3 + 3 * perLevel}% Damage Reduction while in Werebear form.',
          '',
          'This bonus persists for 3 seconds after leaving Werebear form.',
        ];
      case DruidSkill.EarthenBulwark:
        return [
          'Cooldown: 16 seconds',
          'Lucky Hit Chance: 30%',
          'Rocks surround you for 3 seconds, granting a Barrier that absorbs ${45 + 5 * perLevel}% of your Base Life in damage.',
        ];
      case DruidSkill.EnhancedEarthenBulwark:
        return [
          'Earthen Bulwark makes you Unstoppable while active.',
        ];
      case DruidSkill.InnateEarthenBulwark:
        return [
          'Rock shrapnel flies outward when Earthen Bulwark is destroyed or expires, dealing 30% damage to surrounding enemies. This damage is increased by Barrier bonuses.',
        ];
      case DruidSkill.PreservingEarthenBulwark:
        return [
          'Casting Earthen Bulwark grants 18% Base Life as Fortify.',
        ];
      case DruidSkill.CycloneArmor:
        return [
          'Cooldown: 18 seconds',
          'Lucky Hit Chance: 25%',
          'Passive: Powerful winds surround you, granting ${10 + 0.9 * perLevel}% Non-Physical Damage Reduction.',
          '',
          'Active: The winds rapidly expand, Knocking Back enemies and dealing ${30 + 3 * perLevel}% damage.',
        ];
      case DruidSkill.EnhancedCycloneArmor:
        return [
          'Enemies who are Knocked Back by Cyclone Armor are also Slowed by 70% for 2 seconds.',
        ];
      case DruidSkill.InnateCycloneArmor:
        return [
          'Enemies Knocked Back by Cyclone Armor become Vulnerable for 3 seconds.',
        ];
      case DruidSkill.PreservingCycloneArmor:
        return [
          'Every 10 seconds, Cyclone Armor intensifies, causing incoming damage to grant you 30% Damage Reduction for 2 seconds.',
        ];
      case DruidSkill.BloodHowl:
        return [
          'Cooldown: 15 seconds',
          'Shapeshift into a Werewolf and howl furiously, Healing you for ${20 + 1.8}% of your Maximum Life.',
        ];
      case DruidSkill.EnhancedBloodHowl:
        return [
          'Kills reduce the Cooldown of Blood Howl by 1 second.',
        ];
      case DruidSkill.InnateBloodHowl:
        return [
          'Blood Howl also generates 20 Spirit.',
        ];
      case DruidSkill.PreservingBloodHowl:
        return [
          'Blood Howl also increases yuor Attack Speed by 15% for 4 seconds.',
        ];
      case DruidSkill.DebilitatingRoar:
        return [
          'Cooldown: ${22 - 1.1 * perLevel} seconds',
          'Shapeshift into a Werebear and bellow a mighty roar, reducing Nearby enemies\' damage dealt by 70% for 4 seconds.',
        ];
      case DruidSkill.EnhancedDebilitatingRoar:
        return [
          'Debilitating Roar also Fortifies you for 22% Base Life.',
        ];
      case DruidSkill.InnateDebilitatingRoar:
        return [
          'Debilitating Roar also Slows enemies by 65% for its duration.',
        ];
      case DruidSkill.PreservingDebilitatingRoar:
        return [
          'Debilitating Roar also Heals you for 4% of your Maximum Life each second for its duration.',
        ];
      case DruidSkill.AncestralFortitude:
        return [
          'Increase your Non-Physical Resistances by ${5 + 5 * perLevel}%.',
        ];
      case DruidSkill.Vigilance:
        return [
          'You gain ${5 + 5 * perLevel}% Damage Reduction for 6 seconds after using a Defensive Skill.',
        ];
      case DruidSkill.Wolves:
        return [
          'Cooldown: 14 seconds',
          'Lucky Hit Chance: 50%',
          'Passive: Summon 2 wolf companions that bite enemies for ${8 + 1 * perLevel}% damage.',
          '',
          'Active: Direct your wolves to focus an enemy, leaping to them and striking for ${110 + 11 * perLevel}% damage.',
        ];
      case DruidSkill.EnhancedWolves:
        return [
          'Wolves deal 20% increased damage to Immobilized, Stunned, Slowed, or Poisoned enemies.',
        ];
      case DruidSkill.BrutalWolves:
        return [
          'When you Critically Strike, your Wolves gain 20% Attack Speed for 3 seconds.',
        ];
      case DruidSkill.FerociousWolves:
        return [
          'Lucky Hit: Your Wolves\' attacks have up to a 10% chance to Fortify you for 5% Base Life.',
        ];
      case DruidSkill.Ravens:
        return [
          'Cooldown: 15 seconds',
          'Lucky Hit Chance: 45%',
          'Passive: 1 Raven flies above you and periodically attacks your enemies for 13% damage every 5 seconds.',
          '',
          'Active: The target area is swarmed with ravens, dealing ${160 + 16 * perLevel}% damage over 6 seconds.',
        ];
      case DruidSkill.EnhancedRavens:
        return [
          'You have 5% increased Critical Strike Chance against enemies for 6 seconds after they are hit by Ravens.',
        ];
      case DruidSkill.BrutalRavens:
        return [
          '2 additional Ravens periodically attack enemies.',
        ];
      case DruidSkill.FerociousRavens:
        return [
          'Enemies inside the swarm of Ravens when it is activated become Vulnerable for 3 seconds.',
        ];
      case DruidSkill.PoisonCreeper:
        return [
          'Cooldown: 20 seconds',
          'Lucky Hit Chance: 28%',
          'Passive: A poison creeper periodically emerges from the ground every 7 seconds and applies ${36.5 + 3.5 * perLevel}% Poisoning damage over 6 seconds to an enemy in the area.',
          '',
          'Active: Vines strangle all surrounding enemies, Immobilizing them for 2 seconds and Poisoning them for ${90 + 9 * perLevel}% damage over 2 seconds.',
        ];
      case DruidSkill.EnhancedPoisonCreeper:
        return [
          'Poison Creeper\'s Immobilize duration is increased by 1 second.',
        ];
      case DruidSkill.BrutalPoisonCreeper:
        return [
          'Your Critical Strike Chance is increased by 20% against enemies strangled by Poison Creeper.',
        ];
      case DruidSkill.FerociousPoisonCreeper:
        return [
          'Poison Creeper\'s active Poisoning duration is increased by 3 seconds.',
        ];
      case DruidSkill.NaturesReach:
        return [
          'Deal ${3 + 3 * perLevel}% increased damage to Distant enemies. Double this bonus if they are also Slowed, Stunned, Immobilized, or Knocked Back.',
        ];
      case DruidSkill.CallOfTheWild:
        return [
          'Your Companion Skills deal ${10 + 10 * perLevel}% bonus damage.',
        ];
      case DruidSkill.Clarity:
        return [
          'Gain ${2 + 2 * perLevel} Spirit when transforming into Human form.',
        ];
      case DruidSkill.Boulder:
        return [
          'Cooldown: 10 seconds',
          'Lucky Hit Chance: 4%',
          'Unearth a large rolling boulder that repeatedly Knocks Back enemies, dealing ${33 + 3.5 * perLevel}% damage with each hit.',
        ];
      case DruidSkill.EnhancedBoulder:
        return [
          'When Boulder reaches the end of its path, enemies hit are Slowed by 30% for 3 seconds. If Boulder Overpowered, enemies are Stunned for 4 seconds instead.',
        ];
      case DruidSkill.NaturalBoulder:
        return [
          'While you have any Fortify, Boulder has 20% increased Critical Strike Chance.',
        ];
      case DruidSkill.SavageBoulder:
        return [
          'Boulder\'s Critical Strike Chance is increased by 3% each time it deals damage.',
        ];
      case DruidSkill.Trample:
        return [
          'Cooldown: 14 seconds',
          'Lucky Hit Chance: 20%',
          'Shapeshift into a Werebear, become Unstoppable, and charge forward, dealing ${75 + 8 * perLevel}% damage and Knocking Back enemies.',
          '',
          'Enemies who are Knocked Back into terrain take an additional ${45 + 5 * perLevel}% damage and are Stunned for 3 seconds.',
        ];
      case DruidSkill.EnhancedTrample:
        return [
          'Trample deals 150% bonus damage. This bonus is reduced by 50% for each enemy hit after the first.',
        ];
      case DruidSkill.NaturalTrample:
        return [
          'Casting Trample grants 20% Base Life as Fortify.',
        ];
      case DruidSkill.SavageTrample:
        return [
          'Casting Trample grants 20 Spirit.',
        ];
      case DruidSkill.Hurricane:
        return [
          'Cooldown: 20 seconds',
          'Lucky Hit Chance: 21%',
          'Form a hurricane around you that deals ${97 + 10 * perLevel}% damage to surrounding enemies over 8 seconds.',
        ];
      case DruidSkill.EnhancedHurricane:
        return [
          'Enemies who are damaged by Hurricane are Slowed by 25% for 2 seconds.',
        ];
      case DruidSkill.NaturalHurricane:
        return [
          'Hurricane has a 15% chance to make enemies Vulnerable for 3 seconds.',
        ];
      case DruidSkill.SavageHurricane:
        return [
          'Enemies affected by Hurricane deal 20% less damage.',
        ];
      case DruidSkill.Rabies:
        return [
          'Cooldown: 12 seconds',
          'Lucky Hit Chance: 50%',
          'Shapeshift into a Werewolf and perform an infectious bite on the target dealing ${28 + 3 * perLevel}% damage, and applying an additional ${53 + 5.5 * perLevel}% Poisoning damage over 6 seconds.',
          '',
          'Infected enemies spread Rabies to other surrounding targets.',
        ];
      case DruidSkill.EnhancedRabies:
        return [
          'Rabies\' Poisoning damage also increases over the lifetime of the disease, dealing 30% bonus damage at max duration.',
        ];
      case DruidSkill.NaturalRabies:
        return [
          'Rabies spreads 100% faster.',
        ];
      case DruidSkill.SavageRabies:
        return [
          'Rabies deals its total Poisoning damage in 4 seconds instead of 6.',
        ];
      case DruidSkill.CrushingEarth:
        return [
          'Earth Skills deal ${5 + 5 * perLevel}% increased damage to Slowed, Stunned, Immobilized or Knocked Back enemies.',
        ];
      case DruidSkill.Safeguard:
        return [
          'Critical Strikes with Earth Skills Fortify you for ${2 + 2.5 * perLevel}% Base Life.',
        ];
      case DruidSkill.StoneGuard:
        return [
          'While you have Fortify for over 50% of your Maximum Life, your Earth Skills deal ${4 + 4 * perLevel}% increased damage.',
        ];
      case DruidSkill.Neurotoxin:
        return [
          'Poisoned enemies are slowed by ${8 + 8 * perLevel}%.',
        ];
      case DruidSkill.ToxicClaws:
        return [
          'Critical Strikes with Werewolf Skills deal ${8 + 7.5 * perLevel}% of their Base damage as Poisoning damage over 4 seconds.',
        ];
      case DruidSkill.Envenom:
        return [
          'Poisoned enemies take ${10 + 10 * perLevel}% additional Critical Strike Damage.',
        ];
      case DruidSkill.Mending:
        return [
          'While in Werebear form, you receive ${5 + 5 * perLevel}% additional Healing from all sources.',
        ];
      case DruidSkill.Provocation:
        return [
          'When you remain in Werebear form for at least ${30 - 5 * perLevel} seconds, your next Skill will Overpower.',
        ];
      case DruidSkill.ElementalExposure:
        s = perLevel > 0 ? 'seconds' : 'second';
        return [
          'Lucky Hit: Your Storm Skills have up to a 10% chance to make enemies Vulnerable for ${1 + 1 * perLevel} $s',
        ];
      case DruidSkill.ChargedAtmosphere:
        return [
          'Every ${18 - 3 * perLevel} seconds, a Lightning Bolt hits a Nearby enemy dealing 45% damage.',
        ];
      case DruidSkill.EndlessTempest:
        return [
          'Increase the duration of Hurricane and Cataclysm by ${5 + 5 * perLevel}%.',
        ];
      case DruidSkill.BadOmen:
        return [
          'Lucky Hit: Up to a ${10 + 10 * perLevel}% chance when dealing damage to a Vulnerable, Immobilized or Stunned enemy that a Lightning Bolt also hits dealing 55% damage.',
        ];
      case DruidSkill.ElectricShock:
        return [
          'Lucky Hit: Dealing Lightning damage to enemies has up to a ${5 + 5 * perLevel}% chance to Immobilize them for 3 seconds.',
          '',
          'If the target is already Immobilized, the Lightning damage dealt to them is increased by ${5 + 5 * perLevel}% instead.',
        ];
      case DruidSkill.GrizzlyRage:
        return [
          'Cooldown: 50 seconds',
          'Shapeshift into a Dire Werebear for 10 seconds gaining 20% bonus damage and 20% Damage Reduction. Damage bonus is increased by 3% each second while in this form.',
          '',
          'Kills extend the duration by 1 second up to 10 additional seconds.',
        ];
      case DruidSkill.PrimeGrizzlyRage:
        return [
          'You are Unstoppable while Grizzly Rage is active.',
        ];
      case DruidSkill.SupremeGrizzlyRage:
        return [
          'Gain 8% Base Life as Fortify per second while Grizzly Rage is active.',
        ];
      case DruidSkill.Petrify:
        return [
          'Cooldown: 50 seconds',
          'Encase all Nearby enemies in stone, Stunning them for 3 seconds. You deal 25% increased Critical Strike Damage to enemies affected by Petrify.',
          '',
          'Against Bosses, the Critical Strike Damage bonus is increased to 50% and its duration is increased to 6 seconds.',
        ];
      case DruidSkill.PrimePetrify:
        return [
          'Petrify\'s effect durations are increased by 1 second.',
        ];
      case DruidSkill.SupremePetrify:
        return [
          'Killing an enemy affected by Petrify grants 25 Spirit.',
        ];
      case DruidSkill.Lacerate:
        return [
          'Cooldown: 45 seconds',
          'Lucky Hit Chance: 7%',
          'Shapeshift into a Werewolf, become Immune and quickly dash 10 times between enemies in the area dealing up to 400% damage.',
        ];
      case DruidSkill.PrimeLacerate:
        return [
          'Each time Lacerate deals a Critical Strike, Heal for 3% Maximum Life.',
        ];
      case DruidSkill.SupremeLacerate:
        return [
          'Lacerate\'s initial strike is guaranteed to Critically Strike and deals 150% increased damage.',
        ];
      case DruidSkill.Cataclysm:
        return [
          'Cooldown: 60 seconds',
          'Lucky Hit Chance: 62%',
          'A massive storm follows you for 8 seconds. Twisters Knock Back enemies, and lightning strikes wildly dealing 52% damage.',
        ];
      case DruidSkill.PrimeCataclysm:
        return [
          'Cataclysm\'s duration is increased by 2 seconds.',
        ];
      case DruidSkill.SupremeCataclysm:
        return [
          'Lightning strikes from Cataclysm make enemies Vulnerable for 2 seconds.',
        ];
      case DruidSkill.QuickShift:
        return [
          'When a Shapeshifting Skill transforms you into a different form, it deals ${5 + 5 * perLevel}% increased damage.',
        ];
      case DruidSkill.NaturalFortitude:
        return [
          'Shapeshifting Fortifies you for ${1 + 1 * perLevel}% Base Life.',
        ];
      case DruidSkill.HeightenedSenses:
        return [
          'Upon Shapeshifting into a Werewolf or Werebear, gain ${4 + 4 * perLevel}% Damage Reduction against Elites for 5 seconds.',
        ];
      case DruidSkill.DefensivePosture:
        return [
          'Increases the amount of Fortify you gain from all sources by ${5 + 5 * perLevel}%.',
        ];
      case DruidSkill.ThickHide:
        return [
          'Whenever you are Stunned, Immobilized, or Knocked Down, Fortify for ${6 + 6 * perLevel}% Base Life.',
        ];
      case DruidSkill.NaturesResolve:
        return [
          '${5 + 5 * perLevel}% chance when struck to Fortify you for 4% Base Life.',
        ];
      case DruidSkill.Unrestrained:
        return [
          'Reduce the duration of Control Impairing Effects by ${3 + 3 * perLevel}%. Triple this effect while you have Fortify for over 50% of your Maximum Life.',
        ];
      case DruidSkill.Defiance:
        return [
          'Nature Magic Skills deal ${4 + 4 * perLevel}% increased damage to Elites.',
        ];
      case DruidSkill.NaturalDisaster:
        return [
          'Your Earth Skills deal ${4 + 4 * perLevel}% increased damage to Vulnerable enemies.',
          '',
          'Your Storm Skills deal ${4 + 4 * perLevel}% increased damage to enemies that are Stunned, Immobilized, or Knocked Back.',
        ];
      case DruidSkill.CircleOfLife:
        return [
          'Nature Magic Skills that consume Spirit Heal you for ${1 + 1 * perLevel}% of your Maximum Life.',
        ];
      case DruidSkill.Resonance:
        return [
          'Nature Magic Skills deal ${2 + 2 * perLevel}% increased damage. Triple this bonus if an Earth Skill is the next Skill cast after a Storm Skill, or a Storm Skill is the next Skill cast after an Earth Skill.',
        ];
      case DruidSkill.NaturesFury:
        return [
          'Casting an Earth Skill has a 20% chance to trigger a free Storm Skill of the same category.',
          '',
          'In addition, casting a Storm Skill has a 20% chance to trigger a free Earth Skill of the same category.',
        ];
      case DruidSkill.EarthenMight:
        return [
          'Lucky Hit: Damaging enemies with Earth Skills has up to a 5% chance to:',
          '* Restore all of your Spirit',
          '* Cause your attacks to be guaranteed Critical Strikes for 5 seconds',
          '',
          'This chance is increased by:',
          '* 10% for Critical Strikes',
          '* 10% if the target is Stunned, Immobilized, or Knocked Back',
        ];
      case DruidSkill.LupineFerocity:
        return [
          'Every 6th Werewolf Skill hit Critically Strikes and deals 60% increased damage.',
        ];
      case DruidSkill.BestialRampage:
        return [
          'After being a Werewolf for 2.5 seconds, gain 20% Attack Speed for 15 seconds.',
          '',
          'After being a Werebear for 2.5 seconds, deal 20% increased damage for 15 seconds.',
        ];
      case DruidSkill.PerfectStorm:
        return [
          'Storm Skills that you cast grant 1 Spirit and deal 15% increased damage when damaging a Vulnerable, Immobilized or Slowed enemy.',
        ];
      case DruidSkill.UrsineStrength:
        return [
          'Gain 20% additional Maximum Life while in Werebear form and for 3 seconds after leaving Werebear form.',
          '',
          'While Healthy, deal 30% increased damage.',
        ];
    }
  }

  static DruidCluster clusterOf(DruidSkill druidSkill) {
    switch (druidSkill) {
      case DruidSkill.Maul:
      case DruidSkill.EnhancedMaul:
      case DruidSkill.FierceMaul:
      case DruidSkill.WildMaul:
      case DruidSkill.Claw:
      case DruidSkill.EnhancedClaw:
      case DruidSkill.FierceClaw:
      case DruidSkill.WildClaw:
      case DruidSkill.StormStrike:
      case DruidSkill.EnhancedStormStrike:
      case DruidSkill.FierceStormStrike:
      case DruidSkill.WildStormStrike:
      case DruidSkill.WindShear:
      case DruidSkill.EnhancedWindShear:
      case DruidSkill.FierceWindShear:
      case DruidSkill.WildWindShear:
      case DruidSkill.EarthSpike:
      case DruidSkill.EnhancedEarthSpike:
      case DruidSkill.FierceEarthSpike:
      case DruidSkill.WildEarthSpike:
        return DruidCluster.Basic;
      case DruidSkill.LightningStorm:
      case DruidSkill.EnhancedLightningStorm:
      case DruidSkill.PrimalLightningStorm:
      case DruidSkill.RagingLightningStorm:
      case DruidSkill.Tornado:
      case DruidSkill.EnhancedTornado:
      case DruidSkill.PrimalTornado:
      case DruidSkill.RagingTornado:
      case DruidSkill.Pulverize:
      case DruidSkill.EnhancedPulverize:
      case DruidSkill.PrimalPulverize:
      case DruidSkill.RagingPulverize:
      case DruidSkill.Shred:
      case DruidSkill.EnhancedShred:
      case DruidSkill.PrimalShred:
      case DruidSkill.RagingShred:
      case DruidSkill.LandSlide:
      case DruidSkill.EnhancedLandSlide:
      case DruidSkill.PrimalLandSlide:
      case DruidSkill.RagingLandSlide:
      case DruidSkill.HeartOfTheWild:
      case DruidSkill.WildImpulses:
      case DruidSkill.Abundance:
      case DruidSkill.PredatoryInstinct:
      case DruidSkill.DigitigradeGait:
      case DruidSkill.IronFur:
        return DruidCluster.Core;
      case DruidSkill.EarthenBulwark:
      case DruidSkill.EnhancedEarthenBulwark:
      case DruidSkill.InnateEarthenBulwark:
      case DruidSkill.PreservingEarthenBulwark:
      case DruidSkill.CycloneArmor:
      case DruidSkill.EnhancedCycloneArmor:
      case DruidSkill.InnateCycloneArmor:
      case DruidSkill.PreservingCycloneArmor:
      case DruidSkill.BloodHowl:
      case DruidSkill.EnhancedBloodHowl:
      case DruidSkill.InnateBloodHowl:
      case DruidSkill.PreservingBloodHowl:
      case DruidSkill.DebilitatingRoar:
      case DruidSkill.EnhancedDebilitatingRoar:
      case DruidSkill.InnateDebilitatingRoar:
      case DruidSkill.PreservingDebilitatingRoar:
      case DruidSkill.AncestralFortitude:
      case DruidSkill.Vigilance:
        return DruidCluster.Defensive;
      case DruidSkill.Wolves:
      case DruidSkill.EnhancedWolves:
      case DruidSkill.BrutalWolves:
      case DruidSkill.FerociousWolves:
      case DruidSkill.Ravens:
      case DruidSkill.EnhancedRavens:
      case DruidSkill.BrutalRavens:
      case DruidSkill.FerociousRavens:
      case DruidSkill.PoisonCreeper:
      case DruidSkill.EnhancedPoisonCreeper:
      case DruidSkill.BrutalPoisonCreeper:
      case DruidSkill.FerociousPoisonCreeper:
      case DruidSkill.NaturesReach:
      case DruidSkill.CallOfTheWild:
      case DruidSkill.Clarity:
        return DruidCluster.Companion;
      case DruidSkill.Boulder:
      case DruidSkill.EnhancedBoulder:
      case DruidSkill.NaturalBoulder:
      case DruidSkill.SavageBoulder:
      case DruidSkill.Trample:
      case DruidSkill.EnhancedTrample:
      case DruidSkill.NaturalTrample:
      case DruidSkill.SavageTrample:
      case DruidSkill.Hurricane:
      case DruidSkill.EnhancedHurricane:
      case DruidSkill.NaturalHurricane:
      case DruidSkill.SavageHurricane:
      case DruidSkill.Rabies:
      case DruidSkill.EnhancedRabies:
      case DruidSkill.NaturalRabies:
      case DruidSkill.SavageRabies:
      case DruidSkill.CrushingEarth:
      case DruidSkill.Safeguard:
      case DruidSkill.StoneGuard:
      case DruidSkill.Neurotoxin:
      case DruidSkill.ToxicClaws:
      case DruidSkill.Envenom:
      case DruidSkill.Mending:
      case DruidSkill.Provocation:
      case DruidSkill.ElementalExposure:
      case DruidSkill.ChargedAtmosphere:
      case DruidSkill.EndlessTempest:
      case DruidSkill.BadOmen:
      case DruidSkill.ElectricShock:
        return DruidCluster.Wrath;
      case DruidSkill.GrizzlyRage:
      case DruidSkill.PrimeGrizzlyRage:
      case DruidSkill.SupremeGrizzlyRage:
      case DruidSkill.Petrify:
      case DruidSkill.PrimePetrify:
      case DruidSkill.SupremePetrify:
      case DruidSkill.Lacerate:
      case DruidSkill.PrimeLacerate:
      case DruidSkill.SupremeLacerate:
      case DruidSkill.Cataclysm:
      case DruidSkill.PrimeCataclysm:
      case DruidSkill.SupremeCataclysm:
      case DruidSkill.QuickShift:
      case DruidSkill.NaturalFortitude:
      case DruidSkill.HeightenedSenses:
      case DruidSkill.DefensivePosture:
      case DruidSkill.ThickHide:
      case DruidSkill.NaturesResolve:
      case DruidSkill.Unrestrained:
      case DruidSkill.Defiance:
      case DruidSkill.NaturalDisaster:
      case DruidSkill.CircleOfLife:
      case DruidSkill.Resonance:
        return DruidCluster.Ultimate;
      case DruidSkill.NaturesFury:
      case DruidSkill.EarthenMight:
      case DruidSkill.LupineFerocity:
      case DruidSkill.BestialRampage:
      case DruidSkill.PerfectStorm:
      case DruidSkill.UrsineStrength:
        return DruidCluster.KeyPassive;
      default:
        assert(false, 'case $druidSkill missing');
        return DruidCluster.Basic;
    }
  }

  static SkillType skillTypeOf(DruidSkill druidSkill) {
    switch (druidSkill) {
      case DruidSkill.Maul:
      case DruidSkill.Claw:
      case DruidSkill.StormStrike:
      case DruidSkill.WindShear:
      case DruidSkill.EarthSpike:
      case DruidSkill.LightningStorm:
      case DruidSkill.Tornado:
      case DruidSkill.Pulverize:
      case DruidSkill.Shred:
      case DruidSkill.LandSlide:
      case DruidSkill.EarthenBulwark:
      case DruidSkill.CycloneArmor:
      case DruidSkill.BloodHowl:
      case DruidSkill.DebilitatingRoar:
      case DruidSkill.Wolves:
      case DruidSkill.Ravens:
      case DruidSkill.PoisonCreeper:
      case DruidSkill.Boulder:
      case DruidSkill.Trample:
      case DruidSkill.Hurricane:
      case DruidSkill.Rabies:
      case DruidSkill.GrizzlyRage:
      case DruidSkill.Petrify:
      case DruidSkill.Lacerate:
      case DruidSkill.Cataclysm:
        return SkillType.Active;
      case DruidSkill.EnhancedMaul:
      case DruidSkill.EnhancedClaw:
      case DruidSkill.EnhancedStormStrike:
      case DruidSkill.EnhancedWindShear:
      case DruidSkill.EnhancedEarthSpike:
      case DruidSkill.EnhancedLightningStorm:
      case DruidSkill.EnhancedTornado:
      case DruidSkill.EnhancedPulverize:
      case DruidSkill.EnhancedShred:
      case DruidSkill.EnhancedLandSlide:
      case DruidSkill.EnhancedEarthenBulwark:
      case DruidSkill.EnhancedCycloneArmor:
      case DruidSkill.EnhancedBloodHowl:
      case DruidSkill.EnhancedDebilitatingRoar:
      case DruidSkill.EnhancedWolves:
      case DruidSkill.EnhancedRavens:
      case DruidSkill.EnhancedPoisonCreeper:
      case DruidSkill.EnhancedBoulder:
      case DruidSkill.EnhancedTrample:
      case DruidSkill.EnhancedHurricane:
      case DruidSkill.EnhancedRabies:
      case DruidSkill.PrimeGrizzlyRage:
      case DruidSkill.PrimePetrify:
      case DruidSkill.PrimeLacerate:
      case DruidSkill.PrimeCataclysm:
        return SkillType.Enhancement;
      case DruidSkill.FierceMaul:
      case DruidSkill.WildMaul:
      case DruidSkill.FierceClaw:
      case DruidSkill.WildClaw:
      case DruidSkill.FierceStormStrike:
      case DruidSkill.WildStormStrike:
      case DruidSkill.FierceWindShear:
      case DruidSkill.WildWindShear:
      case DruidSkill.FierceEarthSpike:
      case DruidSkill.WildEarthSpike:
      case DruidSkill.PrimalLightningStorm:
      case DruidSkill.RagingLightningStorm:
      case DruidSkill.PrimalTornado:
      case DruidSkill.RagingTornado:
      case DruidSkill.PrimalPulverize:
      case DruidSkill.RagingPulverize:
      case DruidSkill.PrimalShred:
      case DruidSkill.RagingShred:
      case DruidSkill.PrimalLandSlide:
      case DruidSkill.RagingLandSlide:
      case DruidSkill.InnateEarthenBulwark:
      case DruidSkill.PreservingEarthenBulwark:
      case DruidSkill.InnateCycloneArmor:
      case DruidSkill.PreservingCycloneArmor:
      case DruidSkill.InnateBloodHowl:
      case DruidSkill.PreservingBloodHowl:
      case DruidSkill.InnateDebilitatingRoar:
      case DruidSkill.PreservingDebilitatingRoar:
      case DruidSkill.BrutalWolves:
      case DruidSkill.FerociousWolves:
      case DruidSkill.BrutalRavens:
      case DruidSkill.FerociousRavens:
      case DruidSkill.BrutalPoisonCreeper:
      case DruidSkill.FerociousPoisonCreeper:
      case DruidSkill.NaturalBoulder:
      case DruidSkill.SavageBoulder:
      case DruidSkill.NaturalTrample:
      case DruidSkill.SavageTrample:
      case DruidSkill.NaturalHurricane:
      case DruidSkill.SavageHurricane:
      case DruidSkill.NaturalRabies:
      case DruidSkill.SavageRabies:
      case DruidSkill.SupremeGrizzlyRage:
      case DruidSkill.SupremePetrify:
      case DruidSkill.SupremeLacerate:
      case DruidSkill.SupremeCataclysm:
        return SkillType.Upgrade;
      case DruidSkill.HeartOfTheWild:
      case DruidSkill.WildImpulses:
      case DruidSkill.Abundance:
      case DruidSkill.PredatoryInstinct:
      case DruidSkill.DigitigradeGait:
      case DruidSkill.IronFur:
      case DruidSkill.AncestralFortitude:
      case DruidSkill.Vigilance:
      case DruidSkill.NaturesReach:
      case DruidSkill.CallOfTheWild:
      case DruidSkill.Clarity:
      case DruidSkill.CrushingEarth:
      case DruidSkill.Safeguard:
      case DruidSkill.StoneGuard:
      case DruidSkill.Neurotoxin:
      case DruidSkill.ToxicClaws:
      case DruidSkill.Envenom:
      case DruidSkill.Mending:
      case DruidSkill.Provocation:
      case DruidSkill.ElementalExposure:
      case DruidSkill.ChargedAtmosphere:
      case DruidSkill.EndlessTempest:
      case DruidSkill.BadOmen:
      case DruidSkill.ElectricShock:
      case DruidSkill.QuickShift:
      case DruidSkill.NaturalFortitude:
      case DruidSkill.HeightenedSenses:
      case DruidSkill.DefensivePosture:
      case DruidSkill.ThickHide:
      case DruidSkill.NaturesResolve:
      case DruidSkill.Unrestrained:
      case DruidSkill.Defiance:
      case DruidSkill.NaturalDisaster:
      case DruidSkill.CircleOfLife:
      case DruidSkill.Resonance:
      case DruidSkill.NaturesFury:
      case DruidSkill.EarthenMight:
      case DruidSkill.LupineFerocity:
      case DruidSkill.BestialRampage:
      case DruidSkill.PerfectStorm:
      case DruidSkill.UrsineStrength:
        return SkillType.Passive;
    }
  }

  static Tree<Enum> get maul => _skillTree(
        DruidSkill.Maul,
        [
          _skillTree(
            DruidSkill.EnhancedMaul,
            [
              _skillTree(DruidSkill.FierceMaul, _childless),
              _skillTree(DruidSkill.WildMaul, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get claw => _skillTree(
        DruidSkill.Claw,
        [
          _skillTree(
            DruidSkill.EnhancedClaw,
            [
              _skillTree(DruidSkill.FierceClaw, _childless),
              _skillTree(DruidSkill.WildClaw, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get stormStrike => _skillTree(
        DruidSkill.StormStrike,
        [
          _skillTree(
            DruidSkill.EnhancedStormStrike,
            [
              _skillTree(DruidSkill.FierceStormStrike, _childless),
              _skillTree(DruidSkill.WildStormStrike, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get windShear => _skillTree(
        DruidSkill.WindShear,
        [
          _skillTree(
            DruidSkill.EnhancedWindShear,
            [
              _skillTree(DruidSkill.FierceWindShear, _childless),
              _skillTree(DruidSkill.WildWindShear, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get earthSpike => _skillTree(
        DruidSkill.EarthSpike,
        [
          _skillTree(
            DruidSkill.EnhancedEarthSpike,
            [
              _skillTree(DruidSkill.FierceEarthSpike, _childless),
              _skillTree(DruidSkill.WildEarthSpike, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get lightningStorm => _skillTree(
        DruidSkill.LightningStorm,
        [
          _skillTree(
            DruidSkill.EnhancedLightningStorm,
            [
              _skillTree(DruidSkill.PrimalLightningStorm, _childless),
              _skillTree(DruidSkill.RagingLightningStorm, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get tornado => _skillTree(
        DruidSkill.Tornado,
        [
          _skillTree(
            DruidSkill.EnhancedTornado,
            [
              _skillTree(DruidSkill.PrimalTornado, _childless),
              _skillTree(DruidSkill.RagingTornado, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get pulverize => _skillTree(
        DruidSkill.Pulverize,
        [
          _skillTree(
            DruidSkill.EnhancedPulverize,
            [
              _skillTree(DruidSkill.PrimalPulverize, _childless),
              _skillTree(DruidSkill.RagingPulverize, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get shred => _skillTree(
        DruidSkill.Shred,
        [
          _skillTree(
            DruidSkill.EnhancedShred,
            [
              _skillTree(DruidSkill.PrimalShred, _childless),
              _skillTree(DruidSkill.RagingShred, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get landSlide => _skillTree(
        DruidSkill.LandSlide,
        [
          _skillTree(
            DruidSkill.EnhancedLandSlide,
            [
              _skillTree(DruidSkill.PrimalLandSlide, _childless),
              _skillTree(DruidSkill.RagingLandSlide, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get heartOfTheWild => _skillTree(
        DruidSkill.HeartOfTheWild,
        [
          _skillTree(DruidSkill.WildImpulses, _childless),
          _skillTree(DruidSkill.Abundance, _childless),
        ],
      );

  static Tree<Enum> get predatoryInstinct => _skillTree(
        DruidSkill.PredatoryInstinct,
        [
          _skillTree(DruidSkill.DigitigradeGait, _childless),
          _skillTree(DruidSkill.IronFur, _childless),
        ],
      );

  static Tree<Enum> get earthenBulwark => _skillTree(
        DruidSkill.EarthenBulwark,
        [
          _skillTree(
            DruidSkill.EnhancedEarthenBulwark,
            [
              _skillTree(DruidSkill.InnateEarthenBulwark, _childless),
              _skillTree(DruidSkill.PreservingEarthenBulwark, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get cycloneArmor => _skillTree(
        DruidSkill.CycloneArmor,
        [
          _skillTree(
            DruidSkill.EnhancedCycloneArmor,
            [
              _skillTree(DruidSkill.InnateCycloneArmor, _childless),
              _skillTree(DruidSkill.PreservingCycloneArmor, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get bloodHowl => _skillTree(
        DruidSkill.BloodHowl,
        [
          _skillTree(
            DruidSkill.EnhancedBloodHowl,
            [
              _skillTree(DruidSkill.InnateBloodHowl, _childless),
              _skillTree(DruidSkill.PreservingBloodHowl, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get debilitatingRoar => _skillTree(
        DruidSkill.DebilitatingRoar,
        [
          _skillTree(
            DruidSkill.EnhancedDebilitatingRoar,
            [
              _skillTree(DruidSkill.InnateDebilitatingRoar, _childless),
              _skillTree(DruidSkill.PreservingDebilitatingRoar, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get ancestralFortitude => _skillTree(
        DruidSkill.AncestralFortitude,
        [
          _skillTree(DruidSkill.Vigilance, _childless),
        ],
      );

  static Tree<Enum> get wolves => _skillTree(
        DruidSkill.Wolves,
        [
          _skillTree(
            DruidSkill.EnhancedWolves,
            [
              _skillTree(DruidSkill.BrutalWolves, _childless),
              _skillTree(DruidSkill.FerociousWolves, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get ravens => _skillTree(
        DruidSkill.Ravens,
        [
          _skillTree(
            DruidSkill.EnhancedRavens,
            [
              _skillTree(DruidSkill.BrutalRavens, _childless),
              _skillTree(DruidSkill.FerociousRavens, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get vineCreeper => _skillTree(
        DruidSkill.PoisonCreeper,
        [
          _skillTree(
            DruidSkill.EnhancedPoisonCreeper,
            [
              _skillTree(DruidSkill.BrutalPoisonCreeper, _childless),
              _skillTree(DruidSkill.FerociousPoisonCreeper, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get naturesReach =>
      _skillTree(DruidSkill.NaturesReach, _childless);

  static Tree<Enum> get callOfTheWild =>
      _skillTree(DruidSkill.CallOfTheWild, _childless);

  static Tree<Enum> get clarity => _skillTree(DruidSkill.Clarity, _childless);

  static Tree<Enum> get boulder => _skillTree(
        DruidSkill.Boulder,
        [
          _skillTree(
            DruidSkill.EnhancedBoulder,
            [
              _skillTree(DruidSkill.NaturalBoulder, _childless),
              _skillTree(DruidSkill.SavageBoulder, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get trample => _skillTree(
        DruidSkill.Trample,
        [
          _skillTree(
            DruidSkill.EnhancedTrample,
            [
              _skillTree(DruidSkill.NaturalTrample, _childless),
              _skillTree(DruidSkill.SavageTrample, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get hurricane => _skillTree(
        DruidSkill.Hurricane,
        [
          _skillTree(
            DruidSkill.EnhancedHurricane,
            [
              _skillTree(DruidSkill.NaturalHurricane, _childless),
              _skillTree(DruidSkill.SavageHurricane, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get rabies => _skillTree(
        DruidSkill.Rabies,
        [
          _skillTree(
            DruidSkill.EnhancedRabies,
            [
              _skillTree(DruidSkill.NaturalRabies, _childless),
              _skillTree(DruidSkill.SavageRabies, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get crushingEarth => _skillTree(
        DruidSkill.CrushingEarth,
        [
          _skillTree(DruidSkill.Safeguard, _childless),
          _skillTree(DruidSkill.StoneGuard, _childless),
        ],
      );

  static Tree<Enum> get neurotoxin => _skillTree(
        DruidSkill.Neurotoxin,
        [
          _skillTree(DruidSkill.ToxicClaws, _childless),
          _skillTree(DruidSkill.Envenom, _childless),
        ],
      );

  static Tree<Enum> get mending => _skillTree(
        DruidSkill.Mending,
        [
          _skillTree(DruidSkill.Provocation, _childless),
        ],
      );

  static Tree<Enum> get elementalExposure => _skillTree(
        DruidSkill.ElementalExposure,
        [
          _skillTree(
            DruidSkill.ChargedAtmosphere,
            [
              _skillTree(DruidSkill.BadOmen, _childless),
              _skillTree(DruidSkill.ElectricShock, _childless),
            ],
          ),
          _skillTree(
            DruidSkill.EndlessTempest,
            [
              _skillTree(DruidSkill.BadOmen, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get grizzlyRage => _skillTree(
        DruidSkill.GrizzlyRage,
        [
          _skillTree(
            DruidSkill.PrimeGrizzlyRage,
            [
              _skillTree(DruidSkill.SupremeGrizzlyRage, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get petrify => _skillTree(
        DruidSkill.Petrify,
        [
          _skillTree(
            DruidSkill.PrimePetrify,
            [
              _skillTree(DruidSkill.SupremePetrify, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get lacerate => _skillTree(
        DruidSkill.Lacerate,
        [
          _skillTree(
            DruidSkill.PrimeLacerate,
            [
              _skillTree(DruidSkill.SupremeLacerate, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get cataclysm => _skillTree(
        DruidSkill.Cataclysm,
        [
          _skillTree(
            DruidSkill.PrimeCataclysm,
            [
              _skillTree(DruidSkill.SupremeCataclysm, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get quickShift => _skillTree(
        DruidSkill.QuickShift,
        [
          _skillTree(DruidSkill.NaturalFortitude, _childless),
          _skillTree(DruidSkill.HeightenedSenses, _childless),
        ],
      );

  static Tree<Enum> get defensivePosture => _skillTree(
        DruidSkill.DefensivePosture,
        [
          _skillTree(
            DruidSkill.ThickHide,
            [
              _skillTree(DruidSkill.Unrestrained, _childless),
            ],
          ),
          _skillTree(
            DruidSkill.NaturesResolve,
            [
              _skillTree(DruidSkill.Unrestrained, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get defiance => _skillTree(
        DruidSkill.Defiance,
        [
          _skillTree(
            DruidSkill.NaturalDisaster,
            [
              _skillTree(DruidSkill.Resonance, _childless),
            ],
          ),
          _skillTree(
            DruidSkill.CircleOfLife,
            [
              _skillTree(DruidSkill.Resonance, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get naturesFury =>
      _skillTree(DruidSkill.NaturesFury, _childless);

  static Tree<Enum> get earthenMight =>
      _skillTree(DruidSkill.EarthenMight, _childless);

  static Tree<Enum> get lupineFerocity =>
      _skillTree(DruidSkill.LupineFerocity, _childless);

  static Tree<Enum> get bestialRampage =>
      _skillTree(DruidSkill.BestialRampage, _childless);

  static Tree<Enum> get perfectStorm =>
      _skillTree(DruidSkill.PerfectStorm, _childless);

  static Tree<Enum> get ursineStrength =>
      _skillTree(DruidSkill.UrsineStrength, _childless);

  static Tree<Enum> get basic => _skillTree(
        DruidCluster.Basic,
        [
          maul,
          claw,
          stormStrike,
          windShear,
          earthSpike,
        ],
      );

  static Tree<Enum> get core => _skillTree(
        DruidCluster.Core,
        [
          lightningStorm,
          tornado,
          pulverize,
          shred,
          landSlide,
          heartOfTheWild,
          predatoryInstinct,
        ],
      );

  static Tree<Enum> get defensive => _skillTree(
        DruidCluster.Defensive,
        [
          earthenBulwark,
          cycloneArmor,
          bloodHowl,
          debilitatingRoar,
          ancestralFortitude,
        ],
      );

  static Tree<Enum> get companion => _skillTree(
        DruidCluster.Companion,
        [
          wolves,
          ravens,
          vineCreeper,
          naturesReach,
          callOfTheWild,
          clarity,
        ],
      );

  static Tree<Enum> get wrath => _skillTree(
        DruidCluster.Wrath,
        [
          boulder,
          trample,
          hurricane,
          rabies,
          crushingEarth,
          neurotoxin,
          mending,
          elementalExposure,
        ],
      );

  static Tree<Enum> get ultimate => _skillTree(
        DruidCluster.Ultimate,
        [
          grizzlyRage,
          petrify,
          lacerate,
          cataclysm,
          quickShift,
          defensivePosture,
          defiance,
        ],
      );

  static Tree<Enum> get keyPassive => _skillTree(
        DruidCluster.KeyPassive,
        [
          naturesFury,
          earthenMight,
          lupineFerocity,
          bestialRampage,
          perfectStorm,
          ursineStrength,
        ],
      );

  static Tree<Enum> get druid => _skillTree(
        Hero.Druid,
        [
          basic,
          core,
          defensive,
          companion,
          wrath,
          ultimate,
          keyPassive,
        ],
      );
}
