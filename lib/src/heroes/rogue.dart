import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/rogue_cluster.dart';
import 'package:d4_utils/src/enums/rogue_skill.dart';
import 'package:d4_utils/src/enums/hero.dart';
import 'package:d4_utils/src/enums/skill_type.dart';

abstract class Rogue {
  static Tree<Enum> _skillTree(Enum e, List<Tree<Enum>> children) =>
      Tree(element: e, children: children);

  static List<Tree<Enum>> get _childless => const [];

  static List<String> descriptionOf(RogueSkill rogueSkill, int level) {
    int perLevel = level > 0 ? level - 1 : level;
    switch (rogueSkill) {
      case RogueSkill.BladeShift:
        return [
          'Generate Combo Point: 1',
          'Lucky Hit Chance: 35%',
          'Quickly stab your victim for ${15.5 + 1.5 * perLevel}% damage and shift, allowing you to move freely through enemies for 3 seconds.',
        ];
      case RogueSkill.EnhancedBladeShift:
        return [
          'Damaging an enemy with Blade Shift grants 5% Movement Speed while Blade Shift is active, up to 20%.',
        ];
      case RogueSkill.FundamentalBladeShift:
        return [
          'Moving through enemies while Blade Shift is active refreshes its duration. After moving through enemies 5 times, your next Blade Shift will Daze enemies for 2 seconds.',
        ];
      case RogueSkill.PrimaryBladeShift:
        return [
          'While Blade Shift is active you gain 15% to all Non-Physical Resistances and reduce the duration of incoming Control Impairing Effects by 20%.',
        ];
      case RogueSkill.ForcefulArrow:
        return [
          'Generate Combo Point: 1',
          'Lucky Hit Chance: 40%',
          'Fire a powerful arrow at an enemy, dealing ${20 + 2 * perLevel}% damage. Every 3rd cast makes the enemy Vulnerable for 2 seconds.',
        ];
      case RogueSkill.EnhancedForcefulArrow:
        return [
          'Every 3rd cast of Forceful Arrow additionally has a 15% increased Critical Strike Chance.',
        ];
      case RogueSkill.FundamentalForcefulArrow:
        return [
          'Forceful Arrow Knocks Back Non-Elite enemies if they are Close. If they collide with another enemy, both are Knocked Down for 1.5 seconds.',
        ];
      case RogueSkill.PrimaryForcefulArrow:
        return [
          'Forceful Arrow pierces through Vulnerable enemies.',
        ];
      case RogueSkill.Heartseeker:
        return [
          'Generate Combo Point: 1',
          'Lucky Hit Chance: 50%',
          'Fire an arrow that seeks an enemy, dealing ${22 + 2 * perLevel}% damage and increasing your Critical Strike Chance against them by 3% for 4 seconds, up to 15%.',
        ];
      case RogueSkill.EnhancedHeartseeker:
        return [
          'When Heartseeker Critically Strikes, gain 8% Attack Speed for 4 seconds. Double this amount if the enemy is Vulnerable.',
        ];
      case RogueSkill.FundamentalHeartseeker:
        return [
          'Heartseeker also increases the Critical Strike Damage the enemy takes from you by 5% for 4 seconds, up to 25%.',
        ];
      case RogueSkill.PrimaryHeartseeker:
        return [
          'Heartseeker ricochets to an additional enemy, dealing 30% of the original damage.',
        ];
      case RogueSkill.InvigoratingStrike:
        return [
          'Generate Combo Point: 1',
          'Lucky Hit Chance: 50%',
          'Melee attack an enemy, dealing ${23 + 2.5 * perLevel}% damage and increasing Energy Regeneration by 20% for 3 seconds.',
        ];
      case RogueSkill.EnhancedInvigoratingStrike:
        return [
          'Damaging a Crowd Controlled or Injured enemy with Invigorating Strike increases its Energy Regeneration bonus to 30%.',
        ];
      case RogueSkill.FundamentalInvigoratingStrike:
        return [
          'Hitting an enemy with Invigorating Strike while you are below 50% Energy makes them Vulnerable for 3 seconds.',
        ];
      case RogueSkill.PrimaryInvigoratingStrike:
        return [
          'Invigorating Strike additionally grants 8% Lucky Hit Chance. Hitting a Crowd Controlled or Injured enemy increases this bonus to 16% Lucky Hit Chance.',
        ];
      case RogueSkill.Puncture:
        return [
          'Generate Combo Point: 1',
          'Lucky Hit Chance: 35%',
          'Throw blades a short distance, dealing ${21 + 2 * perLevel}% damage. Every 3rd cast Slows enemies by 20% for 2 seconds. Critical Strikes will always Slow.',
        ];
      case RogueSkill.EnhancedPuncture:
        return [
          'Gain 2 Energy when Puncture damages a Crowd Controlled enemy.',
        ];
      case RogueSkill.FundamentalPuncture:
        return [
          'Puncture now throws 3 blades in a spread, each dealing 35% of its Base damage. Hitting an enemy with at least 2 blades at once makes them Vulnerable for 2 seconds.',
        ];
      case RogueSkill.PrimaryPuncture:
        return [
          'Every 3rd cast of Puncture will also ricochet up to 2 times. Critical Strikes will always ricochet.',
        ];
      case RogueSkill.Barrage:
        return [
          'Energy Cost: 30',
          'Lucky Hit Chance: 16%',
          'Unleash a barrage of 5 arrows that expands outwards, each dealing ${21 + 2 * perLevel}% damage. Each arrow has a 20% chance to ricochet off an enemy up to 1 time. Ricochets deal 40% of the arrow\'s Base damage.',
          '',
          'Combo Points increase damage and arrows fired:',
          '* 1 Point: ${25 + 2.5 * perLevel}% damage, 6 arrows',
          '* 2 Points: ${29 + 3 * perLevel}% damage, 6 arrows',
          '* 3 Points: ${33.5 + 3.5 * perLevel}% damage, 6 arrows',
        ];
      case RogueSkill.EnhancedBarrage:
        return [
          'Barrage\'s ricochet chance is increased to 100% for arrows that damage a Vulnerable enemy or Critically Strike any enemy.',
        ];
      case RogueSkill.AdvancedBarrage:
        return [
          'Whenever a single cast of Barrage ricochets at least 4 times, your next cast gains 20% increased Critical Strike Chance.',
        ];
      case RogueSkill.ImprovedBarrage:
        return [
          'Every 3rd cast of Barrage makes enemies Vulnerable for 2 seconds.',
        ];
      case RogueSkill.Flurry:
        return [
          'Energy Cost: 25',
          'Lucky Hit Chance: 10%',
          'Unleash a flurry of stabs and slashes, striking enemies in front of you 4 times and dealing a total of ${60 + 6 * perLevel}% damage to each.',
          '',
          'Combo Points increase damage and grant an Attack Speed bonus:',
          '1 Point: ${75.5 + 7.5 * perLevel}% damage, 15% bonus',
          '2 Points: ${90 + 9 * perLevel}% damage, 30% bonus',
          '3 Points: ${105.5 + 10.5 * perLevel}% damage, 45% bonus',
        ];
      case RogueSkill.EnhancedFlurry:
        return [
          'Each time Flurry damages a Crowd Controlled or Vulnerable enemy, you are Healed for 1% of your Maximum Life, up to 12% Maximum Life per cast.',
        ];
      case RogueSkill.AdvancedFlurry:
        return [
          'Evading through an enemy will cause your next Flurry to Stun enemies for 2.5 seconds.',
        ];
      case RogueSkill.ImprovedFlurry:
        return [
          'If Flurry hits any Vulnerable enemy it will make all enemies hit by that cast Vulnerable for 3 seconds.',
        ];
      case RogueSkill.PenetratingShot:
        return [
          'Energy Cost: 35',
          'Lucky Hit Chance: 50%',
          'Fire an arrow that pierces through all enemies in a line, dealing ${70 + 7 * perLevel}% damage.',
          '',
          'Combo Points increase damage and improve Lucky Hit Chance:',
          '1 Point: ${91 + 9 * perLevel}% damage, 10% chance',
          '2 Points: ${112 + 11 * perLevel}% damage, 20% chance',
          '3 Points: ${133 + 13 * perLevel}% damage, 30% chance',
        ];
      case RogueSkill.EnhancedPenetratingShot:
        return [
          'Penetrating Shot deals 10% increased damage per enemy it pierces.',
        ];
      case RogueSkill.AdvancedPenetratingShot:
        return [
          'When cast with full Energy, Penetrating Shot will Slow all enemies it hits by 50% for 3 seconds. Elite enemies will also be Knocked Down for 1.5 seconds.',
        ];
      case RogueSkill.ImprovedPenetratingShot:
        return [
          'If Penetrating Shot damages at least 3 enemies, your next Penetrating Shot has a 20% increased Critical Strike Chance.',
        ];
      case RogueSkill.RapidFire:
        return [
          'Energy Cost: 25',
          'Lucky Hit Chance: 20%',
          'Rapidly fire 5 arrows, each dealing ${24 + 2.5 * perLevel}% damage.',
          '',
          'Combo Points increase damage and arrows fired:',
          '1 Point: ${26 + 3 * perLevel}% damage, 6 arrows',
          '2 Points: ${29 + 3 * perLevel}% damage, 7 arrows',
          '3 Points: ${34 + 3 * perLevel}% damage, 8 arrows',
        ];
      case RogueSkill.EnhancedRapidFire:
        return [
          'Each subsequent arrow from Rapid Fire has 5% increased Critical Strike Chance, up to 40% for the 8th arrow.',
        ];
      case RogueSkill.AdvancedRapidFire:
        return [
          'Rapid Fire deals 30% increased Critical Strike Damage for 3 seconds after you Evade.',
        ];
      case RogueSkill.ImprovedRapidFire:
        return [
          'Gain 15 Energy per cast of Rapid Fire when it damages a Vulnerable enemy.',
        ];
      case RogueSkill.TwistingBlades:
        return [
          'Energy Cost: 30',
          'Lucky Hit Chance: 33%',
          'Impale an enemy with your blades, dealing ${45.5 + 4.5 * perLevel}% damage and making them take 8% increased damage from you while impaled. After 1.5 seconds the blades return to you, piercing enemies for ${72 + 7 * perLevel}% damage.',
          '',
          'Combo Points incresase damage and grant a Movement Speed bonus:',
          '* 1 Point: ${58 + 6 * perLevel}% damage, 20% bonus',
          '* 2 Points: ${72 + 7 * perLevel}% damage, 40% bonus',
          '* 3 Points: ${86 + 8.5 * perLevel}% damage, 60% bonus',
        ];
      case RogueSkill.EnhancedTwistingBlades:
        return [
          'Twisting Blades deals 30% increased damage when returning.',
        ];
      case RogueSkill.AdvancedTwistingBlades:
        return [
          'When your Twisting Blades return, your active Cooldowns are reduced by 0.25 seconds per enemy they passed through, up to 3 seconds.',
        ];
      case RogueSkill.ImprovedTwistingBlades:
        return [
          'Enemies are Dazed while impaled with Twisting Blades.',
        ];
      case RogueSkill.Sturdy:
        return [
          'You gain ${4 + 4 * perLevel}% Close Damage Reduction.',
        ];
      case RogueSkill.SiphoningStrikes:
        return [
          'Heal for ${1 + 1 * perLevel}% of your Maximum Life when you Critically Strike Close enemies.',
        ];
      case RogueSkill.StutterStep:
        return [
          'Critically Striking an enemy grants ${5 + 5 * perLevel}% Movement Speed for 4 seconds.',
        ];
      case RogueSkill.Caltrops:
        return [
          'Charges: 2',
          'Charge Cooldown: 12 seconds',
          'Lucky Hit Chance: 25%',
          'Leap backwards and throw caltrops on the ground, dealing ${30 + 3 * perLevel}% damage and Slowing enemies by ${50 + 3 * perLevel}%. Lasts 6 seconds.',
        ];
      case RogueSkill.EnhancedCaltrops:
        return [
          'Enemies take 3% increased damage from you each second they are in Caltrops.',
        ];
      case RogueSkill.DisciplinedCaltrops:
        return [
          'You have 5% increased Critical Strike Chance against enemies inside your Caltrops. Double this amount against Vulnerable enemies.',
        ];
      case RogueSkill.MethodicalCaltrops:
        return [
          'Caltrops now deals Cold damage and Chills enemies for 20% per second.',
        ];
      case RogueSkill.Dash:
        return [
          'Charges: 2',
          'Charge Cooldown: ${12 - 0.6 * perLevel} seconds',
          'Lucky Hit Chance: 25%',
          'Dash forward and slash enemies for ${37 + 4 * perLevel}% damage.',
        ];
      case RogueSkill.EnhancedDash:
        return [
          'Enemies damaged by Dash take 20% increased Critical Strike Damage from you for 5 seconds.',
        ];
      case RogueSkill.DisciplinedDash:
        return [
          'Dash Slows enemies it hits by 30% for 3 seconds. Any enemy already Slowed will be Dazed for 2 seconds instead.',
        ];
      case RogueSkill.MethodicalDash:
        return [
          'Dealing damage to Crowd Controlled enemies with Dash reduces its Charge Cooldown by 0.5 seconds, up to 3 seconds per cast.',
        ];
      case RogueSkill.ShadowStep:
        return [
          'Cooldown: 9 seconds',
          'Lucky Hit Chance: 100%',
          'Become Unstoppable and quickly move through the shadows to stab your victim from behind for ${72 + 7 * perLevel}% damage. Gain 50% increased Movement Speed for 2 seconds afterwards.',
        ];
      case RogueSkill.EnhancedShadowStep:
        return [
          'Damaging an enemy with Shadow Step increases your Critical Strike Chance against them by 8% for 3 seconds.',
        ];
      case RogueSkill.DisciplinedShadowStep:
        return [
          'Shadow Step\'s Cooldown is reduced by 3 seconds when it damages an enemy you have not hit with Shadow Step in the last 4 seconds.',
        ];
      case RogueSkill.MethodicalShadowStep:
        return [
          'Enemies damaged by Shadow Step are Stunned for 2 seconds.',
        ];
      case RogueSkill.Concussive:
        return [
          'After Knocking Back or Knocking Down an enemy, you gain ${5 + 5 * perLevel}% increased Critical Strike Chance against them for 3 seconds.',
        ];
      case RogueSkill.RapidGambits:
        return [
          'Your Evade Cooldown is reduced by ${0.5 + 0.5 * perLevel} seconds when you Daze an enemy.',
        ];
      case RogueSkill.TrickAttacks:
        return [
          'When you Critically Strike a Dazed enemy they are Knocked Down for ${0.5 + 0.5 * perLevel} seconds.',
        ];
      case RogueSkill.Rugged:
        return [
          'Gain ${5 + 5 * perLevel}% Damage Reduction against Damage Over Time effects.',
        ];
      case RogueSkill.ReactiveDefense:
        return [
          'Gain ${6 + 6 * perLevel}% Damage Reduction while inflicted with Control Impairing Effects.',
        ];
      case RogueSkill.WeaponMastery:
        return [
          'Gain a bonus when attacking based on weapon type:',
          '* Daggers: ${5 + 5 * perLevel}% increased damage to Healthy enemies.',
          '* Swords: ${3 + 3 * perLevel}% increased damage.',
          '* Bows: ${4 + 4 * perLevel}% increased damage to Vulnerable enemies.',
          '* Crossbows: ${5 + 5 * perLevel}% increased Critical Strike Damage.',
        ];
      case RogueSkill.Concealment:
        return [
          'Cooldown: ${20 - 1 * perLevel} seconds',
          'Vanish from sight, gaining an advanced form of Stealth for 4 seconds that will not be removed by taking damage.',
          '',
          'Concealment also makes you Unstoppable, grants 30% Movement Speed, and allows you to move freely through enemies for its duration.',
          '',
          'Using an attack Skill during Concealment will break Concealment.',
        ];
      case RogueSkill.EnhancedConcealment:
        return [
          'You gain 40 Energy when you enter Concealment.',
        ];
      case RogueSkill.CounteringConcealment:
        return [
          'The Skill that breaks Concealment will always be a guaranteed Critical Strike.',
        ];
      case RogueSkill.SubvertingConcealment:
        return [
          'The Skill that breaks Concealment always makes enemies Vulnerable for 6 seconds.',
        ];
      case RogueSkill.DarkShroud:
        return [
          'Cooldown: 20 seconds',
          'Surround yourself with up to 5 protective shadows. Gain ${8 + 0.8 * perLevel}% Damage Reduction per active shadow. Each time you take direct damage, that damage is reduced and a shadow is consumed.',
        ];
      case RogueSkill.EnhancedDarkShroud:
        return [
          'Dark Shroud\'s shadows have a 10% chance to not be consumed.',
        ];
      case RogueSkill.CounteringDarkShroud:
        return [
          'While you have at least 4 active shadows from Dark Shroud, gain 8% Critical Strike Chance.',
        ];
      case RogueSkill.SubvertingDarkShroud:
        return [
          'Each active shadow from Dark Shroud grants you 4% increased Movement Speed.',
        ];
      case RogueSkill.PoisonTrap:
        return [
          'Cooldown: 10 seconds',
          'Lucky Hit Chance: 20%',
          'Place a trap that arms after 1.25 seconds. It activates when an enemy moves within range, applying ${344.5 + 34.5 * perLevel}% Poisoning damage over 9 seconds to enemies in the area.',
          '',
          'You can have 4 armed traps out at once.',
        ];
      case RogueSkill.EnhancedPoisonTrap:
        return [
          'Poison Trap Knocks Down enemies for 1.5 seconds when it activates.',
        ];
      case RogueSkill.CounteringPoisonTrap:
        return [
          'Poison Trap has a 30% chance to reset your Imbuement Skill Cooldowns when activated.',
        ];
      case RogueSkill.SubvertingPoisonTrap:
        return [
          'You deal 10% increased Poison damage to enemies standing inside your Poison Trap.',
        ];
      case RogueSkill.SmokeGrenade:
        return [
          'Cooldown: 15 seconds',
          'Throw a smoky concoction at enemies that Dazes them for ${4 + 0.4 * perLevel} seconds.',
        ];
      case RogueSkill.EnhancedSmokeGrenade:
        return [
          'Enemies affected by Smoke Grenade take 15% increased damage from you.',
        ];
      case RogueSkill.CounteringSmokeGrenade:
        return [
          'Lucky Hit: Dealing direct damage to enemies affected by Smoke Grenade has up to a 25% chance to reduce its Cooldown by 1 second, or by 3 seconds instead if the enemy is Vulnerable.',
        ];
      case RogueSkill.SubvertingSmokeGrenade:
        return [
          'If an enemy is Vulnerable, Slowed, or Chilled then Smoke Grenade will Daze them for 20% longer.',
        ];
      case RogueSkill.Exploit:
        return [
          'You deal ${6 + 6 * perLevel}% increased damage to Healthy and Injured enemies.',
        ];
      case RogueSkill.Malice:
        return [
          'You deal ${3 + 3 * perLevel}% increased damage to Vulnerable enemies.',
        ];
      case RogueSkill.Agile:
        return [
          'Using a Cooldown increases your Dodge Chance by ${4 + 4 * perLevel}% for 3 seconds.',
        ];
      case RogueSkill.MendingObscurity:
        return [
          'While Stealthed, you Heal for ${3 + 3 * perLevel}% Maximum Life per second.',
        ];
      case RogueSkill.ColdImbuement:
        return [
          'Cooldown: 13 seconds',
          'Imbue your weapons with frigid energies. Your next 2 Imbueable Skills deal Cold damage and Chill enemies for ${25.5 + 2.5 * perLevel}% per hit.',
        ];
      case RogueSkill.EnhancedColdImbuement:
        return [
          'Lucky Hit: Cold Imbued Skills have up to a 30% chance to make enemies Vulnerable for 3 seconds.',
        ];
      case RogueSkill.BlendedColdImbuement:
        return [
          'Lucky Hit: Critical Strikes with Cold Imbued Skills have up to a 20% chance to instantly Freeze enemies for 3 seconds.',
        ];
      case RogueSkill.MixedColdImbuement:
        return [
          'Cold Imbued Skills deal 20% increased damage to Crowd Controlled enemies. Double this bonus against Frozen enemies.',
        ];
      case RogueSkill.PoisonImbuement:
        return [
          'Cooldown: 13 seconds',
          'Lucky Hit Chance: 33%',
          'Imbue your weapons with lethal poison. Your next 2 Imbueable Skills deal Poison damage and apply ${100 + 10 * perLevel}% of their Base damage as additional Poisoning damage over 5 seconds.',
        ];
      case RogueSkill.EnhancedPoisonImbuement:
        return [
          'Poison Imbuement\'s Poisoning Duration is increased by 1 second.',
        ];
      case RogueSkill.BlendedPoisonImbuement:
        return [
          'Critical Strikes with Poison Imbued Skills deal 75% increased Poisoning damage.',
        ];
      case RogueSkill.MixedPoisonImbuement:
        return [
          'Lucky Hit: Poison Imbued Skills have up to a 30% chance to apply double the amount of Poisoning damage over time.',
        ];
      case RogueSkill.ShadowImbuement:
        return [
          'Cooldown: 13 seconds',
          'Lucky Hit Chance: 33%',
          'Imbue your weapons with festering shadows. Your next 2 Imbueable Skills deal Shadow damage and infect enemies for 6 seconds. Infected enemies explode on death, dealing ${40 + 4 * perLevel}% damage to all surrounding enemies.',
          '',
          'If the infection expires before the enemy dies, it will deal ${40 + 4 * perLevel}% damage to only that enemy.',
        ];
      case RogueSkill.EnhancedShadowImbuement:
        return [
          'You have 15% increased Critical Strike Chance against Injured enemies infected by Shadow Imbuement.',
        ];
      case RogueSkill.BlendedShadowImbuement:
        return [
          'Shadow Imbuement\'s primary explosion makes enemies Vulnerable for 2 seconds.',
        ];
      case RogueSkill.MixedShadowImbuement:
        return [
          'Enemies infected by Shadow Imbuement take 12% increased Non-Physical damage from you for 8 seconds.',
        ];
      case RogueSkill.DeadlyVenom:
        return [
          'You deal ${3 + 3 * perLevel}% increased Poisoning damage.',
        ];
      case RogueSkill.DebilitatingToxins:
        return [
          'Poisoned enemies deal ${5 + 5 * perLevel}% less damage.',
        ];
      case RogueSkill.AlchemicalAdvantage:
        return [
          'You gain ${1 + 1 * perLevel}% increased Attack Speed for each enemy you\'ve Poisoned, up to 15%.',
        ];
      case RogueSkill.ShadowCrash:
        return [
          'Lucky Hit: Shadow damage has up to a 10% chance to Stun for ${0.5 + 0.5 * perLevel} seconds.',
        ];
      case RogueSkill.ConsumingShadows:
        return [
          'Each time you kill an enemy with Shadow damage, you generate ${10 + 10 * perLevel} Energy.',
        ];
      case RogueSkill.FrigidFinesse:
        return [
          'You deal ${5 + 5 * perLevel}% increased damage to Chilled enemies. This bonus increases to ${10 + 10 * perLevel}% against Frozen enemies.',
        ];
      case RogueSkill.ChillingWeight:
        return [
          'Chilled enemies have their Movement Speed further reduced by up to ${10 + 10 * perLevel}%.',
        ];
      case RogueSkill.PrecisionImbuement:
        return [
          'Imbued Skills gain ${3 + 3 * perLevel}% increased Critical Strike Chance.',
        ];
      case RogueSkill.DeathTrap:
        return [
          'Cooldown: 50 seconds',
          'Lucky Hit Chance: 4%',
          'Place a trap that arms after 1.25 seconds. It activates when an enemy moves within range, dealing a total of 250% damage to each enemy in the area.',
        ];
      case RogueSkill.PrimeDeathTrap:
        return [
          'Enemies are Pulled into Death Trap when it activates.',
        ];
      case RogueSkill.SupremeDeathTrap:
        return [
          'If Death Trap kills an enemy, its Cooldown is reduced by 10 seconds.',
        ];
      case RogueSkill.RainOfArrows:
        return [
          'Cooldown: 60 seconds',
          'Lucky Hit Chance: 2%',
          'Arrows rain down over a large area 2 times, each wave dealing 100% damage.',
        ];
      case RogueSkill.PrimeRainOfArrows:
        return [
          'Imbuement Skill effects applied by Rain of Arrows have 20% increased potency.',
        ];
      case RogueSkill.SupremeRainOfArrows:
        return [
          'Rain of Arrows\' second wave Knocks Down enemies for 3 seconds.',
        ];
      case RogueSkill.ShadowClone:
        return [
          'Cooldown: 60 seconds',
          'Your shadow mimicks your actions for 15 seconds. This Shadow Clone deals 60% of your damage.',
        ];
      case RogueSkill.PrimeShadowClone:
        return [
          'You are Unstoppable for 5 seconds after casting Shadow Clone.',
        ];
      case RogueSkill.SupremeShadowClone:
        return [
          'Your Shadow Clone deals an additional 20% of your damage.',
        ];
      case RogueSkill.Innervation:
        return [
          'Lucky Hit: Up to a ${10 + 10 * perLevel}% chance to gain 8 Energy.',
        ];
      case RogueSkill.AlchemistsFortune:
        return [
          'Non-Physical damage you deal has a ${5 + 5 * perLevel}% increased Lucky Hit Chance.',
        ];
      case RogueSkill.SecondWind:
        return [
          'Every 100 Energy you spend grants you ${5 + 5 * perLevel}% increased Lucky Hit Chance for 5 seconds.',
        ];
      case RogueSkill.AdrenalineRush:
        return [
          'While moving, you gain ${5 + 5 * perLevel} increased Energy Regeneration.',
        ];
      case RogueSkill.Haste:
        return [
          'While at or above 50% maximum Energy, gain ${5 + 5 * perLevel}% increased Movement Speed. While below 50% maximum Energy, gain ${5 + 5 * perLevel}% increased Attack Speed.',
        ];
      case RogueSkill.Impetus:
        return [
          'After moving 15 meters, your next attack deals ${7 + 7 * perLevel}% increased damage.',
        ];
      case RogueSkill.TrapMastery:
        return [
          'When Poison Trap or Death Trap activates, you gain ${4 + 4 * perLevel}% increased Critical Strike Chance against Vulnerable and Crowd Controlled enemies for 4 seconds.',
        ];
      case RogueSkill.Aftermath:
        return [
          'After using an Ultimate Skill, restore ${25 + 25 * perLevel} Energy.',
        ];
      case RogueSkill.Momentum:
        return [
          'Cutthroat Skills grant a stack of Momentum for 8 seconds if they either:',
          '* Hit a Stunned, Dazed, or Frozen enemy',
          '* Hit any enemy from behind',
          '',
          'While at 3 stacks of Momentum you gain:',
          '* 20% increased Damage Reduction',
          '* 30% increased Energy Regeneration',
          '* 15% increased Movement Speed',
        ];
      case RogueSkill.CloseQuartersCombat:
        return [
          'Damaging a Close enemy with Marksman or Cutthroat Skills each grant a 10% Attack Speed bonus for 8 seconds.',
          '',
          'While both Attack Speed bonuses are active, you deal 20% increased damage against Crowd Controlled enemies.',
        ];
      case RogueSkill.Precision:
        return [
          'Critical Strikes with Marksman Skills grant you Precision. You gain 4% increased Critical Strike Damage per stack of Precision, up to a maximum of 20%.',
          '',
          'When you reach maximum Precision, your next Marksman Skill is a guaranteed Critical Strike that deals 40% increased Critical Strike Damage, then consumes all stacks of Precision.',
        ];
      case RogueSkill.Victimize:
        return [
          'Lucky Hit: Dealing direct damage to a Vulnerable enemy has up to a 30% chance to cause an explosion, dealing 23% of the original damage to them and surrounding enemies.',
        ];
      case RogueSkill.Exposure:
        return [
          'Lucky Hit: Dealing direct damage to an enemy affected by a Trap Skill has up to a 25% chance to:',
          '* Reduce the active Cooldowns of your Trap Skills by 20%',
          '* Drop a cluster of exploding Stun Grenades that deal 40% total Physical damage and Stun enemies for 0.5 seconds.',
        ];
    }
  }

  static RogueCluster clusterOf(RogueSkill rogueSkill) {
    switch (rogueSkill) {
      case RogueSkill.BladeShift:
      case RogueSkill.EnhancedBladeShift:
      case RogueSkill.FundamentalBladeShift:
      case RogueSkill.PrimaryBladeShift:
      case RogueSkill.ForcefulArrow:
      case RogueSkill.EnhancedForcefulArrow:
      case RogueSkill.FundamentalForcefulArrow:
      case RogueSkill.PrimaryForcefulArrow:
      case RogueSkill.Heartseeker:
      case RogueSkill.EnhancedHeartseeker:
      case RogueSkill.FundamentalHeartseeker:
      case RogueSkill.PrimaryHeartseeker:
      case RogueSkill.InvigoratingStrike:
      case RogueSkill.EnhancedInvigoratingStrike:
      case RogueSkill.FundamentalInvigoratingStrike:
      case RogueSkill.PrimaryInvigoratingStrike:
      case RogueSkill.Puncture:
      case RogueSkill.EnhancedPuncture:
      case RogueSkill.FundamentalPuncture:
      case RogueSkill.PrimaryPuncture:
        return RogueCluster.Basic;
      case RogueSkill.Barrage:
      case RogueSkill.EnhancedBarrage:
      case RogueSkill.AdvancedBarrage:
      case RogueSkill.ImprovedBarrage:
      case RogueSkill.Flurry:
      case RogueSkill.EnhancedFlurry:
      case RogueSkill.AdvancedFlurry:
      case RogueSkill.ImprovedFlurry:
      case RogueSkill.PenetratingShot:
      case RogueSkill.EnhancedPenetratingShot:
      case RogueSkill.AdvancedPenetratingShot:
      case RogueSkill.ImprovedPenetratingShot:
      case RogueSkill.RapidFire:
      case RogueSkill.EnhancedRapidFire:
      case RogueSkill.AdvancedRapidFire:
      case RogueSkill.ImprovedRapidFire:
      case RogueSkill.TwistingBlades:
      case RogueSkill.EnhancedTwistingBlades:
      case RogueSkill.AdvancedTwistingBlades:
      case RogueSkill.ImprovedTwistingBlades:
      case RogueSkill.Sturdy:
      case RogueSkill.SiphoningStrikes:
      case RogueSkill.StutterStep:
        return RogueCluster.Core;
      case RogueSkill.Caltrops:
      case RogueSkill.EnhancedCaltrops:
      case RogueSkill.DisciplinedCaltrops:
      case RogueSkill.MethodicalCaltrops:
      case RogueSkill.Dash:
      case RogueSkill.EnhancedDash:
      case RogueSkill.DisciplinedDash:
      case RogueSkill.MethodicalDash:
      case RogueSkill.ShadowStep:
      case RogueSkill.EnhancedShadowStep:
      case RogueSkill.DisciplinedShadowStep:
      case RogueSkill.MethodicalShadowStep:
      case RogueSkill.Concussive:
      case RogueSkill.RapidGambits:
      case RogueSkill.TrickAttacks:
      case RogueSkill.Rugged:
      case RogueSkill.ReactiveDefense:
      case RogueSkill.WeaponMastery:
        return RogueCluster.Agility;
      case RogueSkill.Concealment:
      case RogueSkill.EnhancedConcealment:
      case RogueSkill.CounteringConcealment:
      case RogueSkill.SubvertingConcealment:
      case RogueSkill.DarkShroud:
      case RogueSkill.EnhancedDarkShroud:
      case RogueSkill.CounteringDarkShroud:
      case RogueSkill.SubvertingDarkShroud:
      case RogueSkill.PoisonTrap:
      case RogueSkill.EnhancedPoisonTrap:
      case RogueSkill.CounteringPoisonTrap:
      case RogueSkill.SubvertingPoisonTrap:
      case RogueSkill.SmokeGrenade:
      case RogueSkill.EnhancedSmokeGrenade:
      case RogueSkill.CounteringSmokeGrenade:
      case RogueSkill.SubvertingSmokeGrenade:
      case RogueSkill.Exploit:
      case RogueSkill.Malice:
      case RogueSkill.Agile:
      case RogueSkill.MendingObscurity:
        return RogueCluster.Subterfuge;
      case RogueSkill.ColdImbuement:
      case RogueSkill.EnhancedColdImbuement:
      case RogueSkill.BlendedColdImbuement:
      case RogueSkill.MixedColdImbuement:
      case RogueSkill.PoisonImbuement:
      case RogueSkill.EnhancedPoisonImbuement:
      case RogueSkill.BlendedPoisonImbuement:
      case RogueSkill.MixedPoisonImbuement:
      case RogueSkill.ShadowImbuement:
      case RogueSkill.EnhancedShadowImbuement:
      case RogueSkill.BlendedShadowImbuement:
      case RogueSkill.MixedShadowImbuement:
      case RogueSkill.DeadlyVenom:
      case RogueSkill.DebilitatingToxins:
      case RogueSkill.AlchemicalAdvantage:
      case RogueSkill.ShadowCrash:
      case RogueSkill.ConsumingShadows:
      case RogueSkill.FrigidFinesse:
      case RogueSkill.ChillingWeight:
      case RogueSkill.PrecisionImbuement:
        return RogueCluster.Imbuement;
      case RogueSkill.DeathTrap:
      case RogueSkill.PrimeDeathTrap:
      case RogueSkill.SupremeDeathTrap:
      case RogueSkill.RainOfArrows:
      case RogueSkill.PrimeRainOfArrows:
      case RogueSkill.SupremeRainOfArrows:
      case RogueSkill.ShadowClone:
      case RogueSkill.PrimeShadowClone:
      case RogueSkill.SupremeShadowClone:
      case RogueSkill.Innervation:
      case RogueSkill.AlchemistsFortune:
      case RogueSkill.SecondWind:
      case RogueSkill.AdrenalineRush:
      case RogueSkill.Haste:
      case RogueSkill.Impetus:
      case RogueSkill.TrapMastery:
      case RogueSkill.Aftermath:
        return RogueCluster.Ultimate;
      case RogueSkill.Momentum:
      case RogueSkill.CloseQuartersCombat:
      case RogueSkill.Precision:
      case RogueSkill.Victimize:
      case RogueSkill.Exposure:
        return RogueCluster.KeyPassive;
      default:
        assert(false, 'case $rogueSkill missing');
        return RogueCluster.Basic;
    }
  }

  static SkillType skillTypeOf(RogueSkill rogueSkill) {
    switch (rogueSkill) {
      case RogueSkill.BladeShift:
      case RogueSkill.ForcefulArrow:
      case RogueSkill.Heartseeker:
      case RogueSkill.InvigoratingStrike:
      case RogueSkill.Puncture:
      case RogueSkill.Barrage:
      case RogueSkill.Flurry:
      case RogueSkill.PenetratingShot:
      case RogueSkill.RapidFire:
      case RogueSkill.TwistingBlades:
      case RogueSkill.Caltrops:
      case RogueSkill.Dash:
      case RogueSkill.ShadowStep:
        return SkillType.Active;
      case RogueSkill.EnhancedBladeShift:
      case RogueSkill.EnhancedForcefulArrow:
      case RogueSkill.EnhancedHeartseeker:
      case RogueSkill.EnhancedInvigoratingStrike:
      case RogueSkill.EnhancedPuncture:
      case RogueSkill.EnhancedBarrage:
      case RogueSkill.EnhancedFlurry:
      case RogueSkill.EnhancedPenetratingShot:
      case RogueSkill.EnhancedRapidFire:
      case RogueSkill.EnhancedTwistingBlades:
      case RogueSkill.EnhancedCaltrops:
      case RogueSkill.EnhancedDash:
      case RogueSkill.EnhancedShadowStep:
      case RogueSkill.EnhancedConcealment:
      case RogueSkill.EnhancedDarkShroud:
      case RogueSkill.EnhancedPoisonTrap:
      case RogueSkill.EnhancedSmokeGrenade:
      case RogueSkill.EnhancedColdImbuement:
      case RogueSkill.EnhancedPoisonImbuement:
      case RogueSkill.EnhancedShadowImbuement:
      case RogueSkill.PrimeDeathTrap:
      case RogueSkill.PrimeRainOfArrows:
      case RogueSkill.PrimeShadowClone:
        return SkillType.Enhancement;
      case RogueSkill.FundamentalBladeShift:
      case RogueSkill.PrimaryBladeShift:
      case RogueSkill.FundamentalForcefulArrow:
      case RogueSkill.PrimaryForcefulArrow:
      case RogueSkill.FundamentalHeartseeker:
      case RogueSkill.PrimaryHeartseeker:
      case RogueSkill.FundamentalInvigoratingStrike:
      case RogueSkill.PrimaryInvigoratingStrike:
      case RogueSkill.FundamentalPuncture:
      case RogueSkill.PrimaryPuncture:
      case RogueSkill.AdvancedBarrage:
      case RogueSkill.ImprovedBarrage:
      case RogueSkill.AdvancedFlurry:
      case RogueSkill.ImprovedFlurry:
      case RogueSkill.AdvancedPenetratingShot:
      case RogueSkill.ImprovedPenetratingShot:
      case RogueSkill.AdvancedRapidFire:
      case RogueSkill.ImprovedRapidFire:
      case RogueSkill.AdvancedTwistingBlades:
      case RogueSkill.ImprovedTwistingBlades:
      case RogueSkill.DisciplinedCaltrops:
      case RogueSkill.MethodicalCaltrops:
      case RogueSkill.DisciplinedDash:
      case RogueSkill.MethodicalDash:
      case RogueSkill.DisciplinedShadowStep:
      case RogueSkill.MethodicalShadowStep:
      case RogueSkill.CounteringConcealment:
      case RogueSkill.SubvertingConcealment:
      case RogueSkill.CounteringDarkShroud:
      case RogueSkill.SubvertingDarkShroud:
      case RogueSkill.CounteringPoisonTrap:
      case RogueSkill.SubvertingPoisonTrap:
      case RogueSkill.CounteringSmokeGrenade:
      case RogueSkill.SubvertingSmokeGrenade:
      case RogueSkill.BlendedColdImbuement:
      case RogueSkill.MixedColdImbuement:
      case RogueSkill.BlendedPoisonImbuement:
      case RogueSkill.MixedPoisonImbuement:
      case RogueSkill.BlendedShadowImbuement:
      case RogueSkill.MixedShadowImbuement:
      case RogueSkill.SupremeDeathTrap:
      case RogueSkill.SupremeRainOfArrows:
      case RogueSkill.SupremeShadowClone:
        return SkillType.Upgrade;
      case RogueSkill.Sturdy:
      case RogueSkill.SiphoningStrikes:
      case RogueSkill.StutterStep:
      case RogueSkill.Concussive:
      case RogueSkill.RapidGambits:
      case RogueSkill.TrickAttacks:
      case RogueSkill.Rugged:
      case RogueSkill.Concealment:
      case RogueSkill.DarkShroud:
      case RogueSkill.PoisonTrap:
      case RogueSkill.SmokeGrenade:
      case RogueSkill.ColdImbuement:
      case RogueSkill.PoisonImbuement:
      case RogueSkill.ShadowImbuement:
      case RogueSkill.DeathTrap:
      case RogueSkill.RainOfArrows:
      case RogueSkill.ShadowClone:
      case RogueSkill.ReactiveDefense:
      case RogueSkill.WeaponMastery:
      case RogueSkill.Exploit:
      case RogueSkill.Malice:
      case RogueSkill.Agile:
      case RogueSkill.MendingObscurity:
      case RogueSkill.DeadlyVenom:
      case RogueSkill.DebilitatingToxins:
      case RogueSkill.AlchemicalAdvantage:
      case RogueSkill.ShadowCrash:
      case RogueSkill.ConsumingShadows:
      case RogueSkill.FrigidFinesse:
      case RogueSkill.ChillingWeight:
      case RogueSkill.PrecisionImbuement:
      case RogueSkill.Innervation:
      case RogueSkill.AlchemistsFortune:
      case RogueSkill.SecondWind:
      case RogueSkill.AdrenalineRush:
      case RogueSkill.Haste:
      case RogueSkill.Impetus:
      case RogueSkill.TrapMastery:
      case RogueSkill.Aftermath:
      case RogueSkill.Momentum:
      case RogueSkill.CloseQuartersCombat:
      case RogueSkill.Precision:
      case RogueSkill.Victimize:
      case RogueSkill.Exposure:
        return SkillType.Passive;
    }
  }

  static Tree<Enum> get bladeShift => _skillTree(
        RogueSkill.BladeShift,
        [
          _skillTree(
            RogueSkill.EnhancedBladeShift,
            [
              _skillTree(RogueSkill.FundamentalBladeShift, _childless),
              _skillTree(RogueSkill.PrimaryBladeShift, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get forcefulArrow => _skillTree(
        RogueSkill.ForcefulArrow,
        [
          _skillTree(
            RogueSkill.EnhancedForcefulArrow,
            [
              _skillTree(RogueSkill.FundamentalForcefulArrow, _childless),
              _skillTree(RogueSkill.PrimaryForcefulArrow, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get heartseeker => _skillTree(
        RogueSkill.Heartseeker,
        [
          _skillTree(
            RogueSkill.EnhancedHeartseeker,
            [
              _skillTree(RogueSkill.FundamentalHeartseeker, _childless),
              _skillTree(RogueSkill.PrimaryHeartseeker, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get invigoratingStrike => _skillTree(
        RogueSkill.InvigoratingStrike,
        [
          _skillTree(
            RogueSkill.EnhancedInvigoratingStrike,
            [
              _skillTree(RogueSkill.FundamentalInvigoratingStrike, _childless),
              _skillTree(RogueSkill.PrimaryInvigoratingStrike, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get puncture => _skillTree(
        RogueSkill.Puncture,
        [
          _skillTree(
            RogueSkill.EnhancedPuncture,
            [
              _skillTree(RogueSkill.FundamentalPuncture, _childless),
              _skillTree(RogueSkill.PrimaryPuncture, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get barrage => _skillTree(
        RogueSkill.Barrage,
        [
          _skillTree(
            RogueSkill.EnhancedBarrage,
            [
              _skillTree(RogueSkill.AdvancedBarrage, _childless),
              _skillTree(RogueSkill.ImprovedBarrage, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get flurry => _skillTree(
        RogueSkill.Flurry,
        [
          _skillTree(
            RogueSkill.EnhancedFlurry,
            [
              _skillTree(RogueSkill.AdvancedFlurry, _childless),
              _skillTree(RogueSkill.ImprovedFlurry, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get penetratingShot => _skillTree(
        RogueSkill.PenetratingShot,
        [
          _skillTree(
            RogueSkill.EnhancedPenetratingShot,
            [
              _skillTree(RogueSkill.AdvancedPenetratingShot, _childless),
              _skillTree(RogueSkill.ImprovedPenetratingShot, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get rapidFire => _skillTree(
        RogueSkill.RapidFire,
        [
          _skillTree(
            RogueSkill.EnhancedRapidFire,
            [
              _skillTree(RogueSkill.AdvancedRapidFire, _childless),
              _skillTree(RogueSkill.ImprovedRapidFire, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get twistingBlades => _skillTree(
        RogueSkill.TwistingBlades,
        [
          _skillTree(
            RogueSkill.EnhancedTwistingBlades,
            [
              _skillTree(RogueSkill.AdvancedTwistingBlades, _childless),
              _skillTree(RogueSkill.ImprovedTwistingBlades, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get sturdy => _skillTree(
        RogueSkill.Sturdy,
        [
          _skillTree(RogueSkill.SiphoningStrikes, _childless),
        ],
      );

  static Tree<Enum> get stutterStep =>
      _skillTree(RogueSkill.StutterStep, _childless);

  static Tree<Enum> get caltrops => _skillTree(
        RogueSkill.Caltrops,
        [
          _skillTree(
            RogueSkill.EnhancedCaltrops,
            [
              _skillTree(RogueSkill.DisciplinedCaltrops, _childless),
              _skillTree(RogueSkill.MethodicalCaltrops, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get dash => _skillTree(
        RogueSkill.Dash,
        [
          _skillTree(
            RogueSkill.EnhancedDash,
            [
              _skillTree(RogueSkill.DisciplinedDash, _childless),
              _skillTree(RogueSkill.MethodicalDash, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get shadowStep => _skillTree(
        RogueSkill.ShadowStep,
        [
          _skillTree(
            RogueSkill.EnhancedShadowStep,
            [
              _skillTree(RogueSkill.DisciplinedShadowStep, _childless),
              _skillTree(RogueSkill.MethodicalShadowStep, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get concussive => _skillTree(
        RogueSkill.Concussive,
        [
          _skillTree(RogueSkill.TrickAttacks, _childless),
        ],
      );

  static Tree<Enum> get rapidGambits => _skillTree(
        RogueSkill.RapidGambits,
        [
          _skillTree(RogueSkill.TrickAttacks, _childless),
        ],
      );

  static Tree<Enum> get rugged => _skillTree(
        RogueSkill.Rugged,
        [
          _skillTree(RogueSkill.ReactiveDefense, _childless),
        ],
      );

  static Tree<Enum> get weaponMastery =>
      _skillTree(RogueSkill.WeaponMastery, _childless);

  static Tree<Enum> get concealment => _skillTree(
        RogueSkill.Concealment,
        [
          _skillTree(
            RogueSkill.EnhancedConcealment,
            [
              _skillTree(RogueSkill.CounteringConcealment, _childless),
              _skillTree(RogueSkill.SubvertingConcealment, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get darkShroud => _skillTree(
        RogueSkill.DarkShroud,
        [
          _skillTree(
            RogueSkill.EnhancedDarkShroud,
            [
              _skillTree(RogueSkill.CounteringDarkShroud, _childless),
              _skillTree(RogueSkill.SubvertingDarkShroud, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get poisonTrap => _skillTree(
        RogueSkill.PoisonTrap,
        [
          _skillTree(
            RogueSkill.EnhancedPoisonTrap,
            [
              _skillTree(RogueSkill.CounteringPoisonTrap, _childless),
              _skillTree(RogueSkill.SubvertingPoisonTrap, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get smokeGrenade => _skillTree(
        RogueSkill.SmokeGrenade,
        [
          _skillTree(
            RogueSkill.EnhancedSmokeGrenade,
            [
              _skillTree(RogueSkill.CounteringSmokeGrenade, _childless),
              _skillTree(RogueSkill.SubvertingSmokeGrenade, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get exploit => _skillTree(
        RogueSkill.Exploit,
        [
          _skillTree(RogueSkill.Malice, _childless),
        ],
      );

  static Tree<Enum> get agile => _skillTree(
        RogueSkill.Agile,
        [
          _skillTree(RogueSkill.MendingObscurity, _childless),
        ],
      );

  static Tree<Enum> get coldImbuement => _skillTree(
        RogueSkill.ColdImbuement,
        [
          _skillTree(
            RogueSkill.EnhancedColdImbuement,
            [
              _skillTree(RogueSkill.BlendedColdImbuement, _childless),
              _skillTree(RogueSkill.MixedColdImbuement, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get poisonImbuement => _skillTree(
        RogueSkill.PoisonImbuement,
        [
          _skillTree(
            RogueSkill.EnhancedPoisonImbuement,
            [
              _skillTree(RogueSkill.BlendedPoisonImbuement, _childless),
              _skillTree(RogueSkill.MixedPoisonImbuement, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get shadowImbuement => _skillTree(
        RogueSkill.ShadowImbuement,
        [
          _skillTree(
            RogueSkill.EnhancedShadowImbuement,
            [
              _skillTree(RogueSkill.BlendedShadowImbuement, _childless),
              _skillTree(RogueSkill.MixedShadowImbuement, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get deadlyVenom => _skillTree(
        RogueSkill.DeadlyVenom,
        [
          _skillTree(RogueSkill.DebilitatingToxins, _childless),
          _skillTree(RogueSkill.AlchemicalAdvantage, _childless),
        ],
      );

  static Tree<Enum> get shadowCrash => _skillTree(
        RogueSkill.ShadowCrash,
        [
          _skillTree(RogueSkill.ConsumingShadows, _childless),
        ],
      );

  static Tree<Enum> get frigidFinesse => _skillTree(
        RogueSkill.FrigidFinesse,
        [
          _skillTree(RogueSkill.ChillingWeight, _childless),
        ],
      );

  static Tree<Enum> get precisionImbuement =>
      _skillTree(RogueSkill.PrecisionImbuement, _childless);

  static Tree<Enum> get deathTrap => _skillTree(
        RogueSkill.DeathTrap,
        [
          _skillTree(
            RogueSkill.PrimeDeathTrap,
            [
              _skillTree(RogueSkill.SupremeDeathTrap, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get rainOfArrows => _skillTree(
        RogueSkill.RainOfArrows,
        [
          _skillTree(
            RogueSkill.PrimeRainOfArrows,
            [
              _skillTree(RogueSkill.SupremeRainOfArrows, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get shadowClone => _skillTree(
        RogueSkill.ShadowClone,
        [
          _skillTree(
            RogueSkill.PrimeShadowClone,
            [
              _skillTree(RogueSkill.SupremeShadowClone, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get innervation => _skillTree(
        RogueSkill.Innervation,
        [
          _skillTree(RogueSkill.AlchemistsFortune, _childless),
          _skillTree(RogueSkill.SecondWind, _childless),
        ],
      );

  static Tree<Enum> get adrenalineRush => _skillTree(
        RogueSkill.AdrenalineRush,
        [
          _skillTree(RogueSkill.Haste, _childless),
          _skillTree(RogueSkill.Impetus, _childless),
        ],
      );

  static Tree<Enum> get trapMastery =>
      _skillTree(RogueSkill.TrapMastery, _childless);

  static Tree<Enum> get aftermath =>
      _skillTree(RogueSkill.Aftermath, _childless);

  static Tree<Enum> get momentum => _skillTree(RogueSkill.Momentum, _childless);

  static Tree<Enum> get closeQuartersCombat =>
      _skillTree(RogueSkill.CloseQuartersCombat, _childless);

  static Tree<Enum> get precision =>
      _skillTree(RogueSkill.Precision, _childless);

  static Tree<Enum> get victimize =>
      _skillTree(RogueSkill.Victimize, _childless);

  static Tree<Enum> get exposure => _skillTree(RogueSkill.Exposure, _childless);

  static Tree<Enum> get basic => _skillTree(
        RogueCluster.Basic,
        [
          bladeShift,
          forcefulArrow,
          heartseeker,
          invigoratingStrike,
          puncture,
        ],
      );

  static Tree<Enum> get core => _skillTree(
        RogueCluster.Core,
        [
          barrage,
          flurry,
          penetratingShot,
          rapidFire,
          twistingBlades,
          sturdy,
          stutterStep,
        ],
      );

  static Tree<Enum> get agility => _skillTree(
        RogueCluster.Agility,
        [
          caltrops,
          dash,
          shadowStep,
          concussive,
          rugged,
          weaponMastery,
        ],
      );

  static Tree<Enum> get subterfuge => _skillTree(
        RogueCluster.Subterfuge,
        [
          concealment,
          darkShroud,
          poisonTrap,
          smokeGrenade,
          exploit,
          agile,
        ],
      );

  static Tree<Enum> get imbuement => _skillTree(
        RogueCluster.Imbuement,
        [
          coldImbuement,
          poisonImbuement,
          shadowImbuement,
          deadlyVenom,
          shadowCrash,
          frigidFinesse,
          precisionImbuement,
        ],
      );

  static Tree<Enum> get ultimate => _skillTree(
        RogueCluster.Ultimate,
        [
          deathTrap,
          rainOfArrows,
          shadowClone,
          innervation,
          adrenalineRush,
          trapMastery,
          aftermath,
        ],
      );

  static Tree<Enum> get keyPassive => _skillTree(
        RogueCluster.KeyPassive,
        [
          momentum,
          closeQuartersCombat,
          precision,
          victimize,
          exposure,
        ],
      );

  static Tree<Enum> get rogue => _skillTree(
        Hero.Rogue,
        [
          basic,
          core,
          agility,
          subterfuge,
          imbuement,
          ultimate,
          keyPassive,
        ],
      );
}
