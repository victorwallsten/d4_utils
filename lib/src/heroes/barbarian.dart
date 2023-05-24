import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/barbarian_cluster.dart';
import 'package:d4_utils/src/enums/barbarian_skill.dart';
import 'package:d4_utils/src/enums/hero.dart';
import 'package:d4_utils/src/enums/skill_type.dart';

abstract class Barbarian {
  static Tree<Enum> _skillTree(Enum e, List<Tree<Enum>> children) =>
      Tree(element: e, children: children);

  static List<Tree<Enum>> get _childless => const [];

  static List<String> descriptionOf(BarbarianSkill barbarianSkill, int level) {
    int perLevel = level > 0 ? level - 1 : level;
    String s;
    switch (barbarianSkill) {
      case BarbarianSkill.Bash:
        return [
          'Generate Fury: 10',
          'Lucky Hit Chance: 50%',
          'Bash the enemy with your weapon, dealing ${30 + 3 * perLevel}% damage. After bashing enemies 4 times, your next Bash will Stun for 1.25 seconds, this increases to 2 seconds if using a Two-Handed weapon.',
        ];
      case BarbarianSkill.EnhancedBash:
        return [
          'Damaging a Stunned enemy with Bash grants you 10% Base Life as Fortify. Double this amount when using a Two-Handed weapon.',
        ];
      case BarbarianSkill.BattleBash:
        return [
          'Damaging a Stunned enemy with Bash generates an additional 3 Fury, or 4 Fury if using a Two-Handed weapon.',
        ];
      case BarbarianSkill.CombatBash:
        return [
          'After Critically Striking 4 times with Bash using a Two-Handed weapon, your next Core or Weapon Mastery Skill will Overpower.',
        ];
      case BarbarianSkill.Flay:
        return [
          'Generate Fury: 9',
          'Lucky Hit Chance: 50%',
          'Flay the enemy, dealing ${5 + 0.5 * perLevel}% damage and inflicting ${36 + 3.5 * perLevel}% Bleeding damage over 5 seconds.',
        ];
      case BarbarianSkill.EnhancedFlay:
        return [
          'Flay has a 10% chance to make the enemy Vulnerable for 2 seconds. Double this chance when using a Two-Handed weapon.',
        ];
      case BarbarianSkill.BattleFlay:
        return [
          'When Flay deals direct damage to an enemy, they take 10% increased Bleeding damage from you for the next 3 seconds.',
        ];
      case BarbarianSkill.CombatFlay:
        return [
          'When Flay deals direct damage to an enemy, you gain 3% Damage Reduction and 32 Thorns for 3 seconds. This stacks up to 4 times.',
        ];
      case BarbarianSkill.Frenzy:
        return [
          'Generate Fury: 4',
          'Lucky Hit Chance: 30%',
          'Unleash a rapid flurry of blows, dealing ${20 + 2 * perLevel}% damage with each pair of hits. If Frenzy hits an enemy, its Attack Speed is increased by 20% for 3 seconds, up to 60%.',
        ];
      case BarbarianSkill.EnhancedFrenzy:
        return [
          'While Frenzy is granting 60% bonus Attack Speed, it also generates 2 additional Fury.',
        ];
      case BarbarianSkill.BattleFrenzy:
        return [
          'While Berserking, your other skills gain 5% Attack Speed for each stack of Frenzy you have.',
        ];
      case BarbarianSkill.CombatFrenzy:
        return [
          'You gain 8% Damage Reduction for each stack of Frenzy you currently have.',
        ];
      case BarbarianSkill.LungingStrike:
        return [
          'Generate Fury: 9',
          'Lucky Hit Chance: 50%',
          'Lunge forward and strike an enemy for ${30 + 3 * perLevel}% damage.',
        ];
      case BarbarianSkill.EnhancedLungingStrike:
        return [
          'Lunging Strike deals 30% increased damage and Heals you for 2% Maximum Life when it damages a Healthy enemy.',
        ];
      case BarbarianSkill.BattleLungingStrike:
        return [
          'Lunging Strike also inflicts 20% Bleeding damage over 5 seconds.'
        ];
      case BarbarianSkill.CombatLungingStrike:
        return [
          'Critical Strikes with Lunging Strike grant you Berserking for 1.5 seconds.'
        ];
      case BarbarianSkill.DoubleSwing:
        return [
          'Fury Cost: 25',
          'Lucky Hit Chance: 30%',
          'Sweep your weapons from opposite directions, dealing ${36 + 3.5 * perLevel}% damage with each weapon. Enemies caught in the center are damaged by both.',
        ];
      case BarbarianSkill.EnhancedDoubleSwing:
        return [
          'If Double Swing damages a Stunned or Knocked Down enemy, gain 25 Fury.',
        ];
      case BarbarianSkill.FuriousDoubleSwing:
        return [
          'Casting Double Swing while Berserking grants 2 additional seconds of Berserking.',
        ];
      case BarbarianSkill.ViolentDoubleSwing:
        return [
          'Hitting an enemy with both hits of Double Swing makes them Vulnerable for 1 second.',
        ];
      case BarbarianSkill.HammerOfTheAncients:
        return [
          'Fury Cost: 35',
          'Lucky Hit Chance: 50%',
          'Slam your hammer down with the fury of the Ancients, dealing ${50 + 5 * perLevel}% damage to a concentrated area.',
        ];
      case BarbarianSkill.EnhancedHammerOfTheAncients:
        return [
          'Gain 3% more Fury for 5 seconds for each enemy damaged by Hammer of the Ancients, stacking up to 10 times.',
        ];
      case BarbarianSkill.FuriousHammerOfTheAncients:
        return [
          'Hammer of the Ancients deals 1% additional damage for each point of Fury you had when using it.',
        ];
      case BarbarianSkill.ViolentHammerOfTheAncients:
        return [
          'After Overpowering with Hammer of the Ancients, you deal 30% more damage for 5 seconds.',
        ];
      case BarbarianSkill.Rend:
        return [
          'Fury Cost: 35',
          'Lucky Hit Chance: 33%',
          'Cleave enemies in front of you, dealing ${12 + 1.33 * perLevel}% damage and inflicting ${96 + 9.5 * perLevel}% Bleeding damage over 5 seconds.',
        ];
      case BarbarianSkill.EnhancedRend:
        return [
          'Dealing direct damage with Rend extends the duration of Vulnerable on enemies by 2 seconds.',
        ];
      case BarbarianSkill.FuriousRend:
        return [
          'Direct damage with Rend grants 4 Fury per enemy hit, up to a maximum of 20 Fury.',
        ];
      case BarbarianSkill.ViolentRend:
        return [
          'Rend deals 12% increased damage to Vulnerable enemies.',
        ];
      case BarbarianSkill.Upheaval:
        return [
          'Fury Cost: 40',
          'Lucky Hit Chance: 25%',
          'Tear into the ground with your weapon and fling debris forward, dealing ${70 + 7 * perLevel}% damage.',
        ];
      case BarbarianSkill.EnhancedUpheaval:
        return [
          'Upheaval has a 20% chance to Stun all enemies it damages for 2.5 seconds.',
        ];
      case BarbarianSkill.FuriousUpheaval:
        return [
          'Dealing direct damage to an enemy with a Skill that is not Upheaval causes your next cast of Upheaval to deal 3% increased damage, stacking up to 10 times.',
        ];
      case BarbarianSkill.ViolentUpheaval:
        return [
          'If Upheaval damages at least 2 enemies, you gain Berserking for 2 seconds, increased to 3 seconds if it damages at least 4 enemies.',
        ];
      case BarbarianSkill.Whirlwind:
        return [
          'Fury Cost: 25 per second',
          'Lucky Hit Chance: 20%',
          'Rapidly attack surrounding enemies for ${17 + 2 * perLevel}% damage.',
        ];
      case BarbarianSkill.EnhancedWhirlwind:
        return [
          'Gain 1 Fury each time Whirlwind deals direct damage to an enemy, or 4 Fury against Elite enemies.',
        ];
      case BarbarianSkill.FuriousWhirlwind:
        return [
          'While using a Slashing weapon, Whirlwind also inflicts 40% of its Base damage as Bleeding damage over 5 seconds.',
        ];
      case BarbarianSkill.ViolentWhirlwind:
        return [
          'After using Whirlwind for 2 seconds, Whirlwind deals 30% increased damage until it is cancelled.',
        ];
      case BarbarianSkill.PressurePoint:
        return [
          'Lucky Hit: Your Core skills have up to a ${10 + 10 * perLevel}% chance to make enemies Vulnerable for 2 seconds.',
        ];
      case BarbarianSkill.EndlessFury:
        return [
          'Basic Skills generate ${5 + 5 * perLevel}% more Fury when using Two-Handed weapons.',
        ];
      case BarbarianSkill.ChallengingShout:
        return [
          'Cooldown: 25 seconds',
          'Taunt Nearby enemies and gain ${40 + 4 * perLevel}% Damage Reduction for 6 seconds.',
        ];
      case BarbarianSkill.EnhancedChallengingShout:
        return [
          'While Challenging Shout is active, gain 20% bonus Maximum Life.',
        ];
      case BarbarianSkill.StrategicChallengingShout:
        return [
          'While Challenging Shout is active, gain Thorns equal to 30% of your Maximum Life.',
        ];
      case BarbarianSkill.TacticalChallengingShout:
        return [
          'While Challenging Shout is active, you gain 3 Fury each time you take damage.',
        ];
      case BarbarianSkill.GroundStomp:
        return [
          'Cooldown: ${16 - 0.8 * perLevel} seconds',
          'Lucky Hit Chance: 33%',
          'Smash the ground, dealing ${10 + 0.8 * perLevel}% damage and Stunning surrounding enemies for 3 seconds.',
        ];
      case BarbarianSkill.EnhancedGroundStomp:
        return [
          'Increase Ground Stomp\'s duration by 1 second.',
        ];
      case BarbarianSkill.StrategicGroundStomp:
        return [
          'Reduce the Cooldown of your Ultimate Skill by 1 second for each enemy damaged by Ground Stomp.',
        ];
      case BarbarianSkill.TacticalGroundStomp:
        return [
          'Ground Stomp generates 25 Fury.',
        ];
      case BarbarianSkill.IronSkin:
        return [
          'Cooldown: 14 seconds',
          'Steel yourself, gaining a Barrier that absorbs ${50 + 5 * perLevel}% of your missing Life for 5 seconds.',
        ];
      case BarbarianSkill.EnhancedIronSkin:
        return [
          'Iron Skin\'s Barrier absorbs 10% more of your Maximum Life.',
        ];
      case BarbarianSkill.StrategicIronSkin:
        return [
          'Iron Skin also grants 15% Base Life as Fortify. Double this amount if cast while below 50% Life.',
        ];
      case BarbarianSkill.TacticalIronSkin:
        return [
          'While Iron Skin is active, Heal for 10% of the Barrier\'s original amount as Life per second.',
        ];
      case BarbarianSkill.RallyingCry:
        return [
          'Cooldown: 25 seconds',
          'Bellow a rallying cry, increasing your Movement Speed by 30% ang Resource Generation by ${40 + 4 * perLevel}% for 6 seconds, and Nearby allies for 3 seconds.',
        ];
      case BarbarianSkill.EnhancedRallyingCry:
        return [
          'Rallying Cry grants you Unstoppable while active.',
        ];
      case BarbarianSkill.StrategicRallyingCry:
        return [
          'Rallying Cry grants you 10% Base Life as Fortify. While Rallying Cry is active, you gain an additional 2% Base Life as Fortify each time you take or deal direct damage.',
        ];
      case BarbarianSkill.TacticalRallyingCry:
        return [
          'Rallying Cry generates 20 Fury and grants you an additional 20% Resource Generation.',
        ];
      case BarbarianSkill.ImposingPresence:
        return [
          'Gain ${5 + 5 * perLevel}% additional Maximum Life.',
        ];
      case BarbarianSkill.MartialVigor:
        return [
          'Damage Reduction against Elites is increased by ${3 + 3 * perLevel}%.',
        ];
      case BarbarianSkill.Outburst:
        return [
          'Gain ${13 + 13 * perLevel} Thorns. Also gain 6 Thorns for each 32 bonus Maximum Life you have.',
        ];
      case BarbarianSkill.ToughAsNails:
        return [
          'Increase your Thorns by ${3 + 3 * perLevel}%. When enemies hit you, they take an additional 10% of your Thorns as Bleeding damage over 5 seconds.',
        ];
      case BarbarianSkill.Charge:
        return [
          'Cooldown: ${17 - 0.85 * perLevel} seconds',
          'Lucky Hit Chance: 33%',
          'Become Unstoppable and rush forward, pushing enemies with you then swinging through them for ${25 + 3 * perLevel}% damage and Kocking them Back.',
        ];
      case BarbarianSkill.EnhancedCharge:
        return [
          'Enemies who are Knocked Back into terrain by Charge take 15% damage and are Stunned for 3 seconds.',
        ];
      case BarbarianSkill.MightyCharge:
        return [
          'Damaging enemies with Charge makes them Vulnerable for 2 seconds.',
        ];
      case BarbarianSkill.PowerCharge:
        return [
          'Reduce Charge\'s Cooldown by 3 seconds if it Knocks Back an enemy into terrain.',
        ];
      case BarbarianSkill.Kick:
        return [
          'Charges: 2',
          'Charge Cooldown: ${17 - 0.85 * perLevel} seconds',
          'Lucky Hit Chance: 40%',
          'Throw a powerful kick that deals 18% damage and Knocks Back enemies in front of you. Enemies who are Knocked Back into terrain take an additional 54% damage and are Stunned for 3 seconds.',
        ];
      case BarbarianSkill.EnhancedKick:
        return [
          'Damaging enemies with Kick makes them Vulnerable for 4 seconds.',
        ];
      case BarbarianSkill.MightyKick:
        return [
          'Kicked enemies deal 54% damage to enemies they collide with while being Knocked Back. Enemies damaged this way are Knocked Down for 2 seconds.',
        ];
      case BarbarianSkill.PowerKick:
        return [
          'If Kick damages an enemy, it consumes all of your Fury and deals an additional 20% damage per 10 Fury spent. Kick no longer Knocks Back enemies.',
        ];
      case BarbarianSkill.Leap:
        return [
          'Cooldown: ${17 - 0.85 * perLevel} seconds',
          'Lucky Hit Chance: 66%',
          'Leap forward and then slam down, dealing ${33 + 3 * perLevel}% damage and Knocking Back surrounding enemies on impact.',
        ];
      case BarbarianSkill.EnhancedLeap:
        return [
          'If Leap doesn\'t damage any enemies, its Cooldown is reduced by 4 seconds.',
        ];
      case BarbarianSkill.MightyLeap:
        return [
          'Enemies damaged by Leap are Slowed by 50% for 5 seconds.',
        ];
      case BarbarianSkill.PowerLeap:
        return [
          'If Leap damages at least one enemy, gain 40 Fury.',
        ];
      case BarbarianSkill.WarCry:
        return [
          'Cooldown: 25 seconds',
          'Bellow a mighty war cry, increasing your damage dealt by ${15 + 1.5 * perLevel}% for 6 seconds, and Nearby allies for 3 seconds.',
        ];
      case BarbarianSkill.EnhancedWarCry:
        return [
          'War Cry grants you Berserking for 4 seconds.',
        ];
      case BarbarianSkill.MightyWarCry:
        return [
          'War Cry grants you 15% Base Life as Fortify.',
        ];
      case BarbarianSkill.PowerWarCry:
        return [
          'If at least 6 enemies are Nearby when you cast War Cry, your damage bonus is increased by an additional 10%.',
        ];
      case BarbarianSkill.BoomingVoice:
        return [
          'Your Shout Skill effect durations are increased by ${8 + 8 * perLevel}%.',
        ];
      case BarbarianSkill.RaidLeader:
        return [
          'Your Shouts also Heal allies for ${1 + 1 * perLevel}% of their Maximum Life per second.',
        ];
      case BarbarianSkill.GutturalYell:
        return [
          'Your Shout Skills cause enemies to deal ${4 + 4 * perLevel}% less damage for 5 seconds.',
        ];
      case BarbarianSkill.AggressiveResistance:
        return [
          'Gain ${3 + 3 * perLevel}% Damage Reduction while Berserking.',
        ];
      case BarbarianSkill.BattleFervor:
        s = perLevel > 0 ? 'seconds' : 'second';
        return [
          'When a Brawling Skill damages at least one enemy, gain Berserking for ${1 + 1 * perLevel} $s',
        ];
      case BarbarianSkill.ProlificFury:
        return [
          'While Berserking, Fury Generation is increased by ${6 + 6 * perLevel}%.',
        ];
      case BarbarianSkill.Swiftness:
        return [
          'Movement Speed is increased by ${4 + 4 * perLevel}%.',
        ];
      case BarbarianSkill.QuickImpulses:
        return [
          'Reduce the duration of Control Impairing Effects by ${6 + 6 * perLevel}%.',
        ];
      case BarbarianSkill.DeathBlow:
        return [
          '',
        ];
      case BarbarianSkill.EnhancedDeathBlow:
        return [
          '',
        ];
      case BarbarianSkill.FightersDeathBlow:
        return [
          '',
        ];
      case BarbarianSkill.WarriorsDeathBlow:
        return [
          '',
        ];
      case BarbarianSkill.Rupture:
        return [
          'Cooldown: ${10 - 0.5 * perLevel} seconds',
          'Lucky Hit Chance: 50%',
          'Skewer enemies in front of you, dealing 13% damage, then rip your weapon out, damaging enemies for their total Bleeding amount and removing all Bleeding damage from them.',
        ];
      case BarbarianSkill.EnhancedRupture:
        return [
          'Ripping your weapon out of enemies during Rupture causes an explosion that deals 30% Bleeding damage over 5 seconds.',
        ];
      case BarbarianSkill.FightersRupture:
        return [
          'Hitting at least 1 enemy with Rupture Heals your for 15% of your Maximum Life.',
        ];
      case BarbarianSkill.WarriorsRupture:
        return [
          'Hitting enemies with Rupture increases your Attack Speed by 20% for 4 seconds.',
        ];
      case BarbarianSkill.SteelGrasp:
        return [
          'Charges: 2',
          'Charge Cooldown: ${11 - 0.55 * perLevel} seconds',
          'Lucky Hit Chance: 25%',
          'Throw out a trio of chains that deal ${23 + 2 * perLevel}% damage and Pull In enemies.',
        ];
      case BarbarianSkill.EnhancedSteelGrasp:
        return [
          'Steel Grasp also makes enemies Vulnerable for 2.5 seconds.',
        ];
      case BarbarianSkill.FightersSteelGrasp:
        return [
          'If Steel Grasp damages an enemy, gain Berserking for 2 seconds.',
        ];
      case BarbarianSkill.WarriorsSteelGrasp:
        return [
          'Steel Grasp gains 1 additional Charge.',
        ];
      case BarbarianSkill.PitFighter:
        return [
          'You deal ${3 + 3 * perLevel}% increased damage to Close enemies and gain ${2 + 2 * perLevel}% Distant Damage Reduction.',
        ];
      case BarbarianSkill.NoMercy:
        return [
          'You have ${3 + 3 * perLevel}% increased Critical Strike chance against Immobilized, Stunned, or Slowed enemies.',
        ];
      case BarbarianSkill.SlayingStrike:
        return [
          'You deal ${8 + 7.5 * perLevel}% increased damage against Injured enemies.',
        ];
      case BarbarianSkill.ExposeVulnerability:
        s = perLevel > 0 ? 'seconds' : 'second';
        return [
          'Dealing direct damage with a Weapon Mastery skill causes your next Core Skill to make enemies Vulnerable for ${1 + 1 * perLevel} $s',
        ];
      case BarbarianSkill.ThickSkin:
        return [
          'Each time you take direct damage gain ${0.4 + 0.35 * perLevel}% Base Life as Fortify.',
        ];
      case BarbarianSkill.DefensiveStance:
        return [
          'Increase the Damage Reduction gained while you are Fortified by an additional ${2 + 2 * perLevel}%.',
        ];
      case BarbarianSkill.Counteroffensive:
        return [
          'While you have Fortify for over 50% of your Maximum Life, you deal ${4 + 4 * perLevel}% increased damage.',
        ];
      case BarbarianSkill.Hamstring:
        return [
          'Your Bleeding effects Slow enemies by ${10 + 10 * perLevel}%.',
        ];
      case BarbarianSkill.CutToTheBone:
        return [
          'Your Bleeding effects deal ${6 + 6 * perLevel}% increased damage to Vulnerable enemies.',
        ];
      case BarbarianSkill.CallOfTheAncients:
        return [
          'Cooldown: 50 seconds',
          'Lucky Hit Chance: 30%',
          'Call upon 3 Ancients to aid you in battle for 6 seconds.',
          '* Korlic leaps at enemies, dealing 104% damage and swings his weapons in a frenzy, dealing 39% damage per hit.',
          '* Talic spins in a whirlwind rapidly attacking enemies for 65% damage.',
          '* Madawc upheaves the ground, dealing 195% damage.',
        ];
      case BarbarianSkill.PrimeCallOfTheAncients:
        return [
          'While Call of the Ancients is active, gain 10% bonus Attack Speed and 10% increased damage.',
        ];
      case BarbarianSkill.SupremeCallOfTheAncients:
        return [
          'Each of the Ancients gains additional power:',
          '* Korlic: You gain 10 Fury each time Korlic damages an enemy with his Frenzy.',
          '* Talic: Enemies are Slowed by 50% for 1 second when damaged by his Whirlwind.',
          '* Madawc: 30% chance to Stun enemies for 3 seconds when using his Upheaval.',
        ];
      case BarbarianSkill.IronMaelstrom:
        return [
          'Cooldown: 60 seconds',
          'Lucky Hit Chance: 24%',
          'Activate three times to attach chains to each of your weapons and perform an attack:',
          '* First, your Two-Handed Bludgeoning weapon slams into the ground, dealing 60% damage and Stunning enemies for 2 seconds.',
          '* Next, your Two-Handed Slashing weapon swipes in front of you, dealing 20% damage and inflicting 120% Bleeding damage over 5 seconds.',
          '* Finally, your Dual Wield weapons swing around you, dealing 33% damage per hit.',
        ];
      case BarbarianSkill.PrimeIronMaelstrom:
        return [
          'Iron Maelstrom gains 10% increased Critical Strike Chance and deals 20% increased Critical Strike Damage.',
        ];
      case BarbarianSkill.SupremeIronMaelstrom:
        return [
          'Dealing direct damage to an enemy after swapping weapons reduces Iron Maelstrom\'s Cooldown by 1 second.',
        ];
      case BarbarianSkill.WrathOfTheBerserker:
        return [
          'Cooldown: 60 seconds',
          'Explode into rage, Knocking Back surrounding enemies and gaining Berserking and Unstoppable for 5 seconds. For the next 10 seconds, dealing direct damage with Basic Skills grants Berserking for 5 seconds.',
        ];
      case BarbarianSkill.PrimeWrathOfTheBerserker:
        return [
          'While Wrath of tme Berserker is active, gain 20% increased Movement Speed and increase Fury Generation by 30%.',
        ];
      case BarbarianSkill.SupremeWrathOfTheBerserker:
        return [
          'While Wrath of the Berserker is active, every 50 Fury you spend increases Berserk\'s damage bonus by 25%.',
        ];
      case BarbarianSkill.HeavyHanded:
        return [
          'While using Two-Handed weapons you deal ${5 + 5 * perLevel}% increased Critical Strike Damage.',
        ];
      case BarbarianSkill.Wallop:
        return [
          'Your Skills using Bludgeoning weapons deal ${5 + 5 * perLevel}% increased damage if the enemy is Stunned or Vulnerable.',
        ];
      case BarbarianSkill.BruteForce:
        return [
          'Your Overpowers deal ${15 + 15 * perLevel}% increased damage when using a Two-Handed weapon.',
        ];
      case BarbarianSkill.Concussion:
        return [
          'Lucky Hit: Skills using Bludgeoning weapons have up to a ${10 + 10 * perLevel}% chance to Stun enemies for 3 seconds, or up to a ${15 + 15 * perLevel}% chance when using a Two-Handed Bludgeoning weapon.',
        ];
      case BarbarianSkill.TemperedFury:
        return [
          'Increase your Maximum Fury by ${3 + 3 * perLevel}.',
        ];
      case BarbarianSkill.FuriousImpulse:
        return [
          'Each time you swap weapons, gain ${2 + 2 * perLevel} Fury.',
        ];
      case BarbarianSkill.InvigoratingFury:
        return [
          'Heal for ${3 + 3 * perLevel}% of your Maximum Life for each 100 Fury spent.',
        ];
      case BarbarianSkill.Duelist:
        return [
          'Attack Speed is increased by ${3 + 3 * perLevel}% while using One-Handed weapons.',
        ];
      case BarbarianSkill.Unconstrained:
        return [
          'Increase Berserk\'s maximum duration by 5 seconds and increase its damage bonus by 25%.',
        ];
      case BarbarianSkill.WalkingArsenal:
        return [
          'Dealing direct damage with a Two-Handed Bludgeoning, Two-Handed Slashing, or Dual Wielded weapons grants 10% increased damage for 6 seconds.',
          '',
          'While all three damage bonuses are active, you gain an additional 15% increased damage.',
        ];
      case BarbarianSkill.UnbridledRage:
        return [
          'Core Skills deal 135% increased damage, but cost 100% more Fury.',
        ];
      case BarbarianSkill.GushingWounds:
        return [
          'When causing an enemy to Bleed, you have a chance equal to your Critical Strike Chance to increase the Bleed amount by 100% of your Critical Strike Damage bonus.',
          '',
          'Overpowering a Bleeding enemy creates an explosion that inflicts 11% Bleeding damage over 5 seconds.',
        ];
    }
  }

  static BarbarianCluster clusterOf(BarbarianSkill barbarianSkill) {
    switch (barbarianSkill) {
      case BarbarianSkill.Bash:
      case BarbarianSkill.EnhancedBash:
      case BarbarianSkill.BattleBash:
      case BarbarianSkill.CombatBash:
      case BarbarianSkill.Flay:
      case BarbarianSkill.EnhancedFlay:
      case BarbarianSkill.BattleFlay:
      case BarbarianSkill.CombatFlay:
      case BarbarianSkill.Frenzy:
      case BarbarianSkill.EnhancedFrenzy:
      case BarbarianSkill.BattleFrenzy:
      case BarbarianSkill.CombatFrenzy:
      case BarbarianSkill.LungingStrike:
      case BarbarianSkill.EnhancedLungingStrike:
      case BarbarianSkill.BattleLungingStrike:
      case BarbarianSkill.CombatLungingStrike:
        return BarbarianCluster.Basic;
      case BarbarianSkill.DoubleSwing:
      case BarbarianSkill.EnhancedDoubleSwing:
      case BarbarianSkill.FuriousDoubleSwing:
      case BarbarianSkill.ViolentDoubleSwing:
      case BarbarianSkill.HammerOfTheAncients:
      case BarbarianSkill.EnhancedHammerOfTheAncients:
      case BarbarianSkill.FuriousHammerOfTheAncients:
      case BarbarianSkill.ViolentHammerOfTheAncients:
      case BarbarianSkill.Rend:
      case BarbarianSkill.EnhancedRend:
      case BarbarianSkill.FuriousRend:
      case BarbarianSkill.ViolentRend:
      case BarbarianSkill.Upheaval:
      case BarbarianSkill.EnhancedUpheaval:
      case BarbarianSkill.FuriousUpheaval:
      case BarbarianSkill.ViolentUpheaval:
      case BarbarianSkill.Whirlwind:
      case BarbarianSkill.EnhancedWhirlwind:
      case BarbarianSkill.FuriousWhirlwind:
      case BarbarianSkill.ViolentWhirlwind:
      case BarbarianSkill.PressurePoint:
      case BarbarianSkill.EndlessFury:
        return BarbarianCluster.Core;
      case BarbarianSkill.ChallengingShout:
      case BarbarianSkill.EnhancedChallengingShout:
      case BarbarianSkill.StrategicChallengingShout:
      case BarbarianSkill.TacticalChallengingShout:
      case BarbarianSkill.GroundStomp:
      case BarbarianSkill.EnhancedGroundStomp:
      case BarbarianSkill.StrategicGroundStomp:
      case BarbarianSkill.TacticalGroundStomp:
      case BarbarianSkill.IronSkin:
      case BarbarianSkill.EnhancedIronSkin:
      case BarbarianSkill.StrategicIronSkin:
      case BarbarianSkill.TacticalIronSkin:
      case BarbarianSkill.RallyingCry:
      case BarbarianSkill.EnhancedRallyingCry:
      case BarbarianSkill.StrategicRallyingCry:
      case BarbarianSkill.TacticalRallyingCry:
      case BarbarianSkill.ImposingPresence:
      case BarbarianSkill.MartialVigor:
      case BarbarianSkill.Outburst:
      case BarbarianSkill.ToughAsNails:
        return BarbarianCluster.Defensive;
      case BarbarianSkill.Charge:
      case BarbarianSkill.EnhancedCharge:
      case BarbarianSkill.MightyCharge:
      case BarbarianSkill.PowerCharge:
      case BarbarianSkill.Kick:
      case BarbarianSkill.EnhancedKick:
      case BarbarianSkill.MightyKick:
      case BarbarianSkill.PowerKick:
      case BarbarianSkill.Leap:
      case BarbarianSkill.EnhancedLeap:
      case BarbarianSkill.MightyLeap:
      case BarbarianSkill.PowerLeap:
      case BarbarianSkill.WarCry:
      case BarbarianSkill.EnhancedWarCry:
      case BarbarianSkill.MightyWarCry:
      case BarbarianSkill.PowerWarCry:
      case BarbarianSkill.BoomingVoice:
      case BarbarianSkill.RaidLeader:
      case BarbarianSkill.GutturalYell:
      case BarbarianSkill.AggressiveResistance:
      case BarbarianSkill.BattleFervor:
      case BarbarianSkill.ProlificFury:
      case BarbarianSkill.Swiftness:
      case BarbarianSkill.QuickImpulses:
        return BarbarianCluster.Brawling;
      case BarbarianSkill.DeathBlow:
      case BarbarianSkill.EnhancedDeathBlow:
      case BarbarianSkill.FightersDeathBlow:
      case BarbarianSkill.WarriorsDeathBlow:
      case BarbarianSkill.Rupture:
      case BarbarianSkill.EnhancedRupture:
      case BarbarianSkill.FightersRupture:
      case BarbarianSkill.WarriorsRupture:
      case BarbarianSkill.SteelGrasp:
      case BarbarianSkill.EnhancedSteelGrasp:
      case BarbarianSkill.FightersSteelGrasp:
      case BarbarianSkill.WarriorsSteelGrasp:
      case BarbarianSkill.PitFighter:
      case BarbarianSkill.NoMercy:
      case BarbarianSkill.SlayingStrike:
      case BarbarianSkill.ExposeVulnerability:
      case BarbarianSkill.ThickSkin:
      case BarbarianSkill.DefensiveStance:
      case BarbarianSkill.Counteroffensive:
      case BarbarianSkill.Hamstring:
      case BarbarianSkill.CutToTheBone:
        return BarbarianCluster.WeaponMastery;
      case BarbarianSkill.CallOfTheAncients:
      case BarbarianSkill.PrimeCallOfTheAncients:
      case BarbarianSkill.SupremeCallOfTheAncients:
      case BarbarianSkill.IronMaelstrom:
      case BarbarianSkill.PrimeIronMaelstrom:
      case BarbarianSkill.SupremeIronMaelstrom:
      case BarbarianSkill.WrathOfTheBerserker:
      case BarbarianSkill.PrimeWrathOfTheBerserker:
      case BarbarianSkill.SupremeWrathOfTheBerserker:
      case BarbarianSkill.HeavyHanded:
      case BarbarianSkill.Wallop:
      case BarbarianSkill.BruteForce:
      case BarbarianSkill.Concussion:
      case BarbarianSkill.TemperedFury:
      case BarbarianSkill.FuriousImpulse:
      case BarbarianSkill.InvigoratingFury:
      case BarbarianSkill.Duelist:
        return BarbarianCluster.Ultimate;
      case BarbarianSkill.Unconstrained:
      case BarbarianSkill.WalkingArsenal:
      case BarbarianSkill.UnbridledRage:
      case BarbarianSkill.GushingWounds:
        return BarbarianCluster.KeyPassive;
      default:
        assert(false, 'case $barbarianSkill missing');
        return BarbarianCluster.Basic;
    }
  }

  static SkillType skillTypeOf(BarbarianSkill barbarianSkill) {
    switch (barbarianSkill) {
      case BarbarianSkill.Bash:
      case BarbarianSkill.Flay:
      case BarbarianSkill.Frenzy:
      case BarbarianSkill.LungingStrike:
      case BarbarianSkill.DoubleSwing:
      case BarbarianSkill.HammerOfTheAncients:
      case BarbarianSkill.Rend:
      case BarbarianSkill.Upheaval:
      case BarbarianSkill.Whirlwind:
      case BarbarianSkill.ChallengingShout:
      case BarbarianSkill.GroundStomp:
      case BarbarianSkill.IronSkin:
      case BarbarianSkill.RallyingCry:
      case BarbarianSkill.Charge:
      case BarbarianSkill.Kick:
      case BarbarianSkill.Leap:
      case BarbarianSkill.WarCry:
      case BarbarianSkill.DeathBlow:
      case BarbarianSkill.Rupture:
      case BarbarianSkill.SteelGrasp:
      case BarbarianSkill.CallOfTheAncients:
      case BarbarianSkill.IronMaelstrom:
      case BarbarianSkill.WrathOfTheBerserker:
        return SkillType.Active;
      case BarbarianSkill.EnhancedBash:
      case BarbarianSkill.EnhancedFlay:
      case BarbarianSkill.EnhancedFrenzy:
      case BarbarianSkill.EnhancedLungingStrike:
      case BarbarianSkill.EnhancedDoubleSwing:
      case BarbarianSkill.EnhancedHammerOfTheAncients:
      case BarbarianSkill.EnhancedRend:
      case BarbarianSkill.EnhancedUpheaval:
      case BarbarianSkill.EnhancedWhirlwind:
      case BarbarianSkill.EnhancedChallengingShout:
      case BarbarianSkill.EnhancedGroundStomp:
      case BarbarianSkill.EnhancedIronSkin:
      case BarbarianSkill.EnhancedRallyingCry:
      case BarbarianSkill.EnhancedCharge:
      case BarbarianSkill.EnhancedKick:
      case BarbarianSkill.EnhancedLeap:
      case BarbarianSkill.EnhancedWarCry:
      case BarbarianSkill.EnhancedDeathBlow:
      case BarbarianSkill.EnhancedRupture:
      case BarbarianSkill.EnhancedSteelGrasp:
      case BarbarianSkill.PrimeCallOfTheAncients:
      case BarbarianSkill.PrimeIronMaelstrom:
      case BarbarianSkill.PrimeWrathOfTheBerserker:
        return SkillType.Enhancement;
      case BarbarianSkill.BattleBash:
      case BarbarianSkill.CombatBash:
      case BarbarianSkill.BattleFlay:
      case BarbarianSkill.CombatFlay:
      case BarbarianSkill.BattleFrenzy:
      case BarbarianSkill.CombatFrenzy:
      case BarbarianSkill.BattleLungingStrike:
      case BarbarianSkill.CombatLungingStrike:
      case BarbarianSkill.FuriousDoubleSwing:
      case BarbarianSkill.ViolentDoubleSwing:
      case BarbarianSkill.FuriousHammerOfTheAncients:
      case BarbarianSkill.ViolentHammerOfTheAncients:
      case BarbarianSkill.FuriousRend:
      case BarbarianSkill.ViolentRend:
      case BarbarianSkill.FuriousUpheaval:
      case BarbarianSkill.ViolentUpheaval:
      case BarbarianSkill.FuriousWhirlwind:
      case BarbarianSkill.ViolentWhirlwind:
      case BarbarianSkill.StrategicChallengingShout:
      case BarbarianSkill.TacticalChallengingShout:
      case BarbarianSkill.StrategicGroundStomp:
      case BarbarianSkill.TacticalGroundStomp:
      case BarbarianSkill.StrategicIronSkin:
      case BarbarianSkill.TacticalIronSkin:
      case BarbarianSkill.StrategicRallyingCry:
      case BarbarianSkill.TacticalRallyingCry:
      case BarbarianSkill.MightyCharge:
      case BarbarianSkill.PowerCharge:
      case BarbarianSkill.MightyKick:
      case BarbarianSkill.PowerKick:
      case BarbarianSkill.MightyLeap:
      case BarbarianSkill.PowerLeap:
      case BarbarianSkill.MightyWarCry:
      case BarbarianSkill.PowerWarCry:
      case BarbarianSkill.FightersDeathBlow:
      case BarbarianSkill.WarriorsDeathBlow:
      case BarbarianSkill.FightersRupture:
      case BarbarianSkill.WarriorsRupture:
      case BarbarianSkill.FightersSteelGrasp:
      case BarbarianSkill.WarriorsSteelGrasp:
      case BarbarianSkill.SupremeCallOfTheAncients:
      case BarbarianSkill.SupremeIronMaelstrom:
      case BarbarianSkill.SupremeWrathOfTheBerserker:
        return SkillType.Upgrade;
      case BarbarianSkill.PressurePoint:
      case BarbarianSkill.EndlessFury:
      case BarbarianSkill.ImposingPresence:
      case BarbarianSkill.MartialVigor:
      case BarbarianSkill.Outburst:
      case BarbarianSkill.ToughAsNails:
      case BarbarianSkill.BoomingVoice:
      case BarbarianSkill.RaidLeader:
      case BarbarianSkill.GutturalYell:
      case BarbarianSkill.AggressiveResistance:
      case BarbarianSkill.BattleFervor:
      case BarbarianSkill.ProlificFury:
      case BarbarianSkill.Swiftness:
      case BarbarianSkill.QuickImpulses:
      case BarbarianSkill.PitFighter:
      case BarbarianSkill.NoMercy:
      case BarbarianSkill.SlayingStrike:
      case BarbarianSkill.ExposeVulnerability:
      case BarbarianSkill.ThickSkin:
      case BarbarianSkill.DefensiveStance:
      case BarbarianSkill.Counteroffensive:
      case BarbarianSkill.Hamstring:
      case BarbarianSkill.CutToTheBone:
      case BarbarianSkill.HeavyHanded:
      case BarbarianSkill.Wallop:
      case BarbarianSkill.BruteForce:
      case BarbarianSkill.Concussion:
      case BarbarianSkill.TemperedFury:
      case BarbarianSkill.FuriousImpulse:
      case BarbarianSkill.InvigoratingFury:
      case BarbarianSkill.Duelist:
      case BarbarianSkill.Unconstrained:
      case BarbarianSkill.WalkingArsenal:
      case BarbarianSkill.UnbridledRage:
      case BarbarianSkill.GushingWounds:
        return SkillType.Passive;
    }
  }

  static Tree<Enum> get bash => _skillTree(
        BarbarianSkill.Bash,
        [
          _skillTree(
            BarbarianSkill.EnhancedBash,
            [
              _skillTree(BarbarianSkill.BattleBash, _childless),
              _skillTree(BarbarianSkill.CombatBash, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get flay => _skillTree(
        BarbarianSkill.Flay,
        [
          _skillTree(
            BarbarianSkill.EnhancedFlay,
            [
              _skillTree(BarbarianSkill.BattleFlay, _childless),
              _skillTree(BarbarianSkill.CombatFlay, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get frenzy => _skillTree(
        BarbarianSkill.Frenzy,
        [
          _skillTree(
            BarbarianSkill.EnhancedFrenzy,
            [
              _skillTree(BarbarianSkill.BattleFrenzy, _childless),
              _skillTree(BarbarianSkill.CombatFrenzy, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get lungingStrike => _skillTree(
        BarbarianSkill.LungingStrike,
        [
          _skillTree(
            BarbarianSkill.EnhancedLungingStrike,
            [
              _skillTree(BarbarianSkill.BattleLungingStrike, _childless),
              _skillTree(BarbarianSkill.CombatLungingStrike, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get doubleSwing => _skillTree(
        BarbarianSkill.DoubleSwing,
        [
          _skillTree(
            BarbarianSkill.EnhancedDoubleSwing,
            [
              _skillTree(BarbarianSkill.FuriousDoubleSwing, _childless),
              _skillTree(BarbarianSkill.ViolentDoubleSwing, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get hammerOfTheAncients => _skillTree(
        BarbarianSkill.HammerOfTheAncients,
        [
          _skillTree(
            BarbarianSkill.EnhancedHammerOfTheAncients,
            [
              _skillTree(BarbarianSkill.FuriousHammerOfTheAncients, _childless),
              _skillTree(BarbarianSkill.ViolentHammerOfTheAncients, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get rend => _skillTree(
        BarbarianSkill.Rend,
        [
          _skillTree(
            BarbarianSkill.EnhancedRend,
            [
              _skillTree(BarbarianSkill.FuriousRend, _childless),
              _skillTree(BarbarianSkill.ViolentRend, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get upheaval => _skillTree(
        BarbarianSkill.Upheaval,
        [
          _skillTree(
            BarbarianSkill.EnhancedUpheaval,
            [
              _skillTree(BarbarianSkill.FuriousUpheaval, _childless),
              _skillTree(BarbarianSkill.ViolentUpheaval, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get whirlwind => _skillTree(
        BarbarianSkill.Whirlwind,
        [
          _skillTree(
            BarbarianSkill.EnhancedWhirlwind,
            [
              _skillTree(BarbarianSkill.FuriousWhirlwind, _childless),
              _skillTree(BarbarianSkill.ViolentWhirlwind, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get pressurePoint =>
      _skillTree(BarbarianSkill.PressurePoint, _childless);

  static Tree<Enum> get endlessFury =>
      _skillTree(BarbarianSkill.EndlessFury, _childless);

  static Tree<Enum> get challengingShout => _skillTree(
        BarbarianSkill.ChallengingShout,
        [
          _skillTree(
            BarbarianSkill.EnhancedChallengingShout,
            [
              _skillTree(BarbarianSkill.StrategicChallengingShout, _childless),
              _skillTree(BarbarianSkill.TacticalChallengingShout, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get groundStomp => _skillTree(
        BarbarianSkill.GroundStomp,
        [
          _skillTree(
            BarbarianSkill.EnhancedGroundStomp,
            [
              _skillTree(BarbarianSkill.StrategicGroundStomp, _childless),
              _skillTree(BarbarianSkill.TacticalGroundStomp, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get ironSkin => _skillTree(
        BarbarianSkill.IronSkin,
        [
          _skillTree(
            BarbarianSkill.EnhancedIronSkin,
            [
              _skillTree(BarbarianSkill.StrategicIronSkin, _childless),
              _skillTree(BarbarianSkill.TacticalIronSkin, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get rallyingCry => _skillTree(
        BarbarianSkill.RallyingCry,
        [
          _skillTree(
            BarbarianSkill.EnhancedRallyingCry,
            [
              _skillTree(BarbarianSkill.StrategicRallyingCry, _childless),
              _skillTree(BarbarianSkill.TacticalRallyingCry, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get imposingPresence => _skillTree(
        BarbarianSkill.ImposingPresence,
        [
          _skillTree(BarbarianSkill.MartialVigor, _childless),
        ],
      );

  static Tree<Enum> get outburst => _skillTree(
        BarbarianSkill.Outburst,
        [
          _skillTree(BarbarianSkill.ToughAsNails, _childless),
        ],
      );

  static Tree<Enum> get charge => _skillTree(
        BarbarianSkill.Charge,
        [
          _skillTree(
            BarbarianSkill.EnhancedCharge,
            [
              _skillTree(BarbarianSkill.MightyCharge, _childless),
              _skillTree(BarbarianSkill.PowerCharge, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get kick => _skillTree(
        BarbarianSkill.Kick,
        [
          _skillTree(
            BarbarianSkill.EnhancedKick,
            [
              _skillTree(BarbarianSkill.MightyKick, _childless),
              _skillTree(BarbarianSkill.PowerKick, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get leap => _skillTree(
        BarbarianSkill.Leap,
        [
          _skillTree(
            BarbarianSkill.EnhancedLeap,
            [
              _skillTree(BarbarianSkill.MightyLeap, _childless),
              _skillTree(BarbarianSkill.PowerLeap, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get warCry => _skillTree(
        BarbarianSkill.WarCry,
        [
          _skillTree(
            BarbarianSkill.EnhancedWarCry,
            [
              _skillTree(BarbarianSkill.MightyWarCry, _childless),
              _skillTree(BarbarianSkill.PowerWarCry, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get boomingVoice => _skillTree(
        BarbarianSkill.BoomingVoice,
        [
          _skillTree(BarbarianSkill.RaidLeader, _childless),
          _skillTree(BarbarianSkill.GutturalYell, _childless),
        ],
      );

  static Tree<Enum> get aggressiveResistance => _skillTree(
        BarbarianSkill.AggressiveResistance,
        [
          _skillTree(BarbarianSkill.BattleFervor, _childless),
          _skillTree(BarbarianSkill.ProlificFury, _childless),
        ],
      );

  static Tree<Enum> get swiftness => _skillTree(
        BarbarianSkill.Swiftness,
        [
          _skillTree(BarbarianSkill.QuickImpulses, _childless),
        ],
      );

  static Tree<Enum> get deathBlow => _skillTree(
        BarbarianSkill.DeathBlow,
        [
          _skillTree(
            BarbarianSkill.EnhancedDeathBlow,
            [
              _skillTree(BarbarianSkill.FightersDeathBlow, _childless),
              _skillTree(BarbarianSkill.WarriorsDeathBlow, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get rupture => _skillTree(
        BarbarianSkill.Rupture,
        [
          _skillTree(
            BarbarianSkill.EnhancedRupture,
            [
              _skillTree(BarbarianSkill.FightersRupture, _childless),
              _skillTree(BarbarianSkill.WarriorsRupture, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get steelGrasp => _skillTree(
        BarbarianSkill.SteelGrasp,
        [
          _skillTree(
            BarbarianSkill.EnhancedSteelGrasp,
            [
              _skillTree(BarbarianSkill.FightersSteelGrasp, _childless),
              _skillTree(BarbarianSkill.WarriorsSteelGrasp, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get pitFighter => _skillTree(
        BarbarianSkill.PitFighter,
        [
          _skillTree(
            BarbarianSkill.NoMercy,
            [
              _skillTree(BarbarianSkill.ExposeVulnerability, _childless),
            ],
          ),
          _skillTree(
            BarbarianSkill.SlayingStrike,
            [
              _skillTree(BarbarianSkill.ExposeVulnerability, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get thickSkin => _skillTree(
        BarbarianSkill.ThickSkin,
        [
          _skillTree(BarbarianSkill.DefensiveStance, _childless),
          _skillTree(BarbarianSkill.Counteroffensive, _childless),
        ],
      );

  static Tree<Enum> get hamstring => _skillTree(
        BarbarianSkill.Hamstring,
        [
          _skillTree(BarbarianSkill.CutToTheBone, _childless),
        ],
      );

  static Tree<Enum> get callOfTheAncients => _skillTree(
        BarbarianSkill.CallOfTheAncients,
        [
          _skillTree(
            BarbarianSkill.PrimeCallOfTheAncients,
            [
              _skillTree(BarbarianSkill.SupremeCallOfTheAncients, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get ironMaelstrom => _skillTree(
        BarbarianSkill.IronMaelstrom,
        [
          _skillTree(
            BarbarianSkill.PrimeIronMaelstrom,
            [
              _skillTree(BarbarianSkill.SupremeIronMaelstrom, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get wrathOfTheBerserker => _skillTree(
        BarbarianSkill.WrathOfTheBerserker,
        [
          _skillTree(
            BarbarianSkill.PrimeWrathOfTheBerserker,
            [
              _skillTree(BarbarianSkill.SupremeWrathOfTheBerserker, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get heavyHanded => _skillTree(
        BarbarianSkill.HeavyHanded,
        [
          _skillTree(BarbarianSkill.BruteForce, _childless),
        ],
      );

  static Tree<Enum> get wallop => _skillTree(
        BarbarianSkill.Wallop,
        [
          _skillTree(BarbarianSkill.BruteForce, _childless),
          _skillTree(BarbarianSkill.Concussion, _childless),
        ],
      );

  static Tree<Enum> get temperedFury => _skillTree(
        BarbarianSkill.TemperedFury,
        [
          _skillTree(BarbarianSkill.FuriousImpulse, _childless),
          _skillTree(BarbarianSkill.InvigoratingFury, _childless),
        ],
      );

  static Tree<Enum> get duelist =>
      _skillTree(BarbarianSkill.Duelist, _childless);

  static Tree<Enum> get unconstrained =>
      _skillTree(BarbarianSkill.Unconstrained, _childless);

  static Tree<Enum> get walkingArsenal =>
      _skillTree(BarbarianSkill.WalkingArsenal, _childless);

  static Tree<Enum> get unbridledRage =>
      _skillTree(BarbarianSkill.UnbridledRage, _childless);

  static Tree<Enum> get gushingWounds =>
      _skillTree(BarbarianSkill.GushingWounds, _childless);

  static Tree<Enum> get basic => _skillTree(
        BarbarianCluster.Basic,
        [
          bash,
          flay,
          frenzy,
          lungingStrike,
        ],
      );

  static Tree<Enum> get core => _skillTree(
        BarbarianCluster.Core,
        [
          doubleSwing,
          hammerOfTheAncients,
          rend,
          upheaval,
          whirlwind,
        ],
      );

  static Tree<Enum> get defensive => _skillTree(
        BarbarianCluster.Defensive,
        [
          challengingShout,
          groundStomp,
          ironSkin,
          rallyingCry,
          imposingPresence,
          outburst,
        ],
      );

  static Tree<Enum> get brawling => _skillTree(
        BarbarianCluster.Brawling,
        [
          charge,
          kick,
          leap,
          warCry,
          boomingVoice,
          aggressiveResistance,
          swiftness,
        ],
      );

  static Tree<Enum> get weaponMastery => _skillTree(
        BarbarianCluster.WeaponMastery,
        [
          deathBlow,
          rupture,
          steelGrasp,
          pitFighter,
          thickSkin,
          hamstring,
        ],
      );

  static Tree<Enum> get ultimate => _skillTree(
        BarbarianCluster.Ultimate,
        [
          callOfTheAncients,
          ironMaelstrom,
          wrathOfTheBerserker,
          heavyHanded,
          wallop,
          temperedFury,
          duelist,
        ],
      );

  static Tree<Enum> get keyPassive => _skillTree(
        BarbarianCluster.KeyPassive,
        [
          unconstrained,
          walkingArsenal,
          unbridledRage,
          gushingWounds,
        ],
      );

  static Tree<Enum> get barbarian => _skillTree(
        Hero.Barbarian,
        [
          basic,
          core,
          defensive,
          brawling,
          weaponMastery,
          ultimate,
          keyPassive,
        ],
      );
}
