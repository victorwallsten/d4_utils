import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/skill_type.dart';
import 'package:d4_utils/src/enums/sorcerer_cluster.dart';
import 'package:d4_utils/src/enums/sorcerer_skill.dart';
import 'package:d4_utils/src/enums/hero.dart';

abstract class Sorcerer {
  static Tree<Enum> _skillTree(Enum e, List<Tree<Enum>> children) =>
      Tree(element: e, children: children);

  static List<Tree<Enum>> get _childless => const [];

  static List<String> descriptionOf(SorcererSkill sorcererSkill, int level) {
    int perLevel = level > 0 ? level - 1 : level;
    num number;
    switch (sorcererSkill) {
      case SorcererSkill.Spark:
        return [
          'Lucky Hit Chance: 9%',
          'Launch a bolt of lightning that shocks an enemy 4 times, dealing ${8 + 1 * perLevel}% damage each hit.',
          '',
          'Enchantment effect:',
          'Killing an enemy has a ${10 + 1 * perLevel}% chance to form a Crackling Energy.',
        ];
      case SorcererSkill.EnhancedSpark:
        return [
          'Each time Spark hits its primary target, it has a 40% chance to hit up to 3 additional enemies, dealing 6% damage. If there are no other enemies to hit, Spark instead deals 20% increased damage to its primary target.',
        ];
      case SorcererSkill.FlickeringSpark:
        return [
          'Each time Spark hits an enemy it has a 3% chance to form a Crackling Energy.',
        ];
      case SorcererSkill.GlintingSpark:
        return [
          'Spark grants 2% increased Critical Strike Chance per cast for 5 seconds, up to 8%.',
        ];
      case SorcererSkill.FrostBolt:
        return [
          'Lucky Hit Chance: 40%',
          'Throw a bolt of frost at an enemy, dealing ${35 + 3 * perLevel}% damage and Chilling them for 15%.',
          '',
          'Enchantment effect:',
          'Direct damage from Skills applies up to ${15.5 + 1.5 * perLevel}% Chill.',
        ];
      case SorcererSkill.EnhancedFrostBolt:
        return [
          'Frost Bolt has a 15% chance to explode on Chilled enemies, hitting surrounding enemies. Chance increased to 100% against Frozen enemies.',
        ];
      case SorcererSkill.FlickeringFrostBolt:
        return [
          'Frost Bolt makes Frozen enemies Vulnerable for 3 seconds.',
        ];
      case SorcererSkill.GlintingFrostBolt:
        return [
          'Frost Bolt generates 4 Mana when hitting Chilled or Frozen enemies.',
        ];
      case SorcererSkill.FireBolt:
        return [
          'Lucky Hit Chance: 35%',
          'Hurl a flaming bolt, dealing ${10 + 1 * perLevel}% damage and Burning for ${40 + 4 * perLevel}% damage over 8 seconds.',
          '',
          'Enchantment effect:',
          'Direct damage from Skills applies up to an additional ${23.5 + 2.5 * perLevel}% Burning damage over 8 seconds.',
        ];
      case SorcererSkill.EnhancedFireBolt:
        return [
          'Fire Bolt pierces through Burning enemies.',
        ];
      case SorcererSkill.FlickeringFireBolt:
        return [
          'Fire Bolt generates 2 Mana when hitting a Burning enemy.',
        ];
      case SorcererSkill.GlintingFireBolt:
        return [
          'Critical Strikes with Fire Bolt increase the Burning damage you deal to the enemy by 20% for 4 seconds.',
        ];
      case SorcererSkill.ArcLash:
        return [
          'Lucky Hit Chance: 30%',
          'Unleash arcing lightning that deals ${42 + 4 * perLevel}% damage to enemies in front of you. Every 10 times Arc Lash swipes, it Stuns all enemies hit for 2 seconds.',
          '',
          'Enchantment effect:',
          'When you use a Cooldown, enemies around you are Stunned for ${0.55 + 0.05 * perLevel} seconds.',
        ];
      case SorcererSkill.EnhancedArcLash:
        return [
          'If Arc Lash\'s initial swipe Critically Strikes, it swipes an additional time.',
        ];
      case SorcererSkill.FlickeringArcLash:
        return [
          'Gain 6% Movement Speed for 5 seconds per enemy hit with Arc Lash, up to 18%.',
        ];
      case SorcererSkill.GlintingArcLash:
        return [
          'Hitting a Stunned enemy with Arc Lash reduces your Cooldowns by 0.25 seconds.',
        ];
      case SorcererSkill.ChainLightning:
        return [
          'Mana Cost: 35',
          'Lucky Hit Chance: 25%',
          'Unleash a stream of lightning that deals ${36.5 + 3.5 * perLevel}% damage and chains between Nearby enemies and you up to 5 times, prioritizing enemies.',
          '',
          'Enchantment effect:',
          'Chain Lightning forms automatically after spending 100 Mana.',
        ];
      case SorcererSkill.EnhancedChainLightning:
        return [
          'Chain Lightning gains a 3% increased Critical Strike Chance per bounce.',
        ];
      case SorcererSkill.DestructiveChainLightning:
        return [
          'When Chain Lightning Critically Strikes, it has a 25% chance to form a Crackling Energy.',
        ];
      case SorcererSkill.GreaterChainLightning:
        return [
          'If Chain Lightning bounces off of you, its next hit deals 10% increased damage.',
        ];
      case SorcererSkill.ChargedBolts:
        return [
          'Mana Cost: 30',
          'Lucky Hit Chance: 20%',
          'Release 5 bolts of lightning that course along the ground in an erratic pattern, dealing ${28 + 3 * perLevel}% damage each.',
          '',
          'Enchantment effect:',
          'When you Stun an enemy, there\'s a 40% chance to release 3 Charged Bolts from them.',
        ];
      case SorcererSkill.EnhancedChargedBolts:
        return [
          'Hitting an enemy at least 3 times with the same cast of Charged Bolts releases a lightning nova, dealing 24% damage to enemies around them.',
        ];
      case SorcererSkill.DestructiveChargedBolts:
        return [
          'Hitting an enemy with Charged Bolts reduces their damage dealt by 20% for 3 seconds.',
        ];
      case SorcererSkill.GreaterChargedBolts:
        return [
          'Charged Bolts deals 25% increased damage to Stunned enemies.',
        ];
      case SorcererSkill.Fireball:
        return [
          'Mana Cost: 40',
          'Lucky Hit Chance: 33%',
          'Hurl an exploding ball of fire, dealing ${60 + 6 * perLevel}% damage to surrounding enemies.',
          '',
          'Enchantment effect:',
          'When you kill an enemy, they explode in a Fireball for 50% of its damage.',
        ];
      case SorcererSkill.EnhancedFireball:
        return [
          'Fireball\'s radius is increased based on distance traveled, up to 50%.',
        ];
      case SorcererSkill.DestructiveFireball:
        return [
          'Fireball\'s explosion\'s Critical Strike Damage is increased by 10%. Each enemy it hits increases this bonus by 5%, up to 25% total.',
        ];
      case SorcererSkill.GreaterFireball:
        return [
          'Fireball deals 10% of the Burning damage you\'ve applied to enemies as additional direct damage.',
        ];
      case SorcererSkill.FrozenOrb:
        return [
          'Mana Cost: 40',
          'Lucky Hit Chance: 4%',
          'Unleash an orb that Chills for 34% and expels piercing shards, dealing a total of ${32 + 3 * perLevel}% damage. Upon expiration, Frozen Orb explodes, dealing ${29 + 3 * perLevel}% damage and Chilling enemies for 9%.',
          '',
          'Enchantment effect:',
          'Whenever you cast a Non-Basic Skill, you have a 20% chance to launch a Frozen Orb at a Nearby enemy.',
        ];
      case SorcererSkill.EnhancedFrozenOrb:
        return [
          'When cast above 50 Mana, Frozen Orb\'s explosion damage is increased by 30%.',
        ];
      case SorcererSkill.DestructiveFrozenOrb:
        return [
          'Frozen Orb\'s explosion restores 5 Mana when hitting a Frozen enemy.',
        ];
      case SorcererSkill.GreaterFrozenOrb:
        return [
          'Frozen Orb\'s explosion has a 25% chance to make all enemies hit Vulnerable for 2 seconds. Frozen Orb always makes Frozen enemies Vulnerable.',
        ];
      case SorcererSkill.Incinerate:
        return [
          'Mana Cost: 25 per second',
          'Lucky Hit Chance: 16%',
          'Channel a beam of fire, Burning enemies for ${49 + 5 * perLevel}% damage per second. Damage per second increases over 4 seconds, up to ${66 + 9 * perLevel}%.',
          '',
          'Enchantment effect:',
          'Every 18 seconds, a serpent spawns and Incinerates enemies for 8 seconds.',
        ];
      case SorcererSkill.EnhancedIncinerate:
        return [
          'While channeling Incinerate, you Burn enemies aroung you for 15% of the damage per second.',
        ];
      case SorcererSkill.DestructiveIncinerate:
        return [
          'Enemies deal 20% less damage while Burning from Incinerate.',
        ];
      case SorcererSkill.GreaterIncinerate:
        return [
          'Every 4 seconds an enemy has been hit by Incinerate, they are Immobilized for 1 second.',
        ];
      case SorcererSkill.IceShards:
        return [
          'Mana Cost: 30',
          'Lucky Hit Chance: 16%',
          'Launch 5 shards that deal ${25.5 + 2.5 * perLevel}% damage each. Deals 25% increased damage to Frozen enemies.',
          '',
          'Enchantment effect:',
          'Ice Shards automatically conjure and fly towards Frozen enemies.',
        ];
      case SorcererSkill.EnhancedIceShards:
        return [
          'Ice Shards have a 40% chance to ricochet to another enemy. Ice Shards always ricochet off of Frozen enemies.',
        ];
      case SorcererSkill.DestructiveIceShards:
        return [
          'Hitting an enemy with 5 Ice Shards in a single cast makes them Vulnerable for 2 seconds.',
        ];
      case SorcererSkill.GreaterIceShards:
        return [
          'While you have a Barrier active, casts of Ice Shards treat enemies as if they were Frozen.',
        ];
      case SorcererSkill.Devastation:
        return [
          'You Maximum Mana is increased by ${3 + 3 * perLevel}.',
        ];
      case SorcererSkill.ElementalDominance:
        return [
          'Your Core Skills deal ${3 + 3 * perLevel}% increased damage when cast above 50 Mana.',
        ];
      case SorcererSkill.PotentWarding:
        return [
          'After casting a Non-Basic Skill, you gain ${2 + 2 * perLevel}% Resistance to all elements and ${1 + 1 * perLevel}% additional Resistance to that skill\'s element for 3 seconds.',
        ];
      case SorcererSkill.FlameShield:
        return [
          'Cooldown: 20 seconds',
          'Lucky Hit Chance: 35%',
          'Engulf yourself in flames for ${2 + 0.1 * perLevel} seconds, Burning surrounding enemies for ${40 + 4 * perLevel}% damage per second.',
          '',
          'Enchantment effect:',
          'Flame Shield automatically activates when you take fatal damage. Can only happen once every 120 seconds.',
        ];
      case SorcererSkill.EnhancedFlameShield:
        return [
          'Flame Shield grants 25% Movement Speed while active.',
        ];
      case SorcererSkill.MysticalFlameShield:
        return [
          'You gain 25% Mana Cost Reduction while Flame Shield is active.',
        ];
      case SorcererSkill.ShimmeringFlameShield:
        return [
          'Flame Shield Heals you for 50% of your missing Life.',
        ];
      case SorcererSkill.IceArmor:
        return [
          'Cooldown: 20 seconds',
          'A Barrier of ice forms around you for 6 seconds, absorbing ${30 + 3 * perLevel}% of your Base Life in damage. While Ice Armor is active, 5% of your damage dealt is added to its Barrier.',
          '',
          'Enchantment effect:',
          'Upon getting hit, you have a 5% chance to apply Ice Armor.',
        ];
      case SorcererSkill.EnhancedIceArmor:
        return [
          'While Ice Armor is active, your Mana Regeneration is increased by 25%.',
        ];
      case SorcererSkill.MysticalIceArmor:
        return [
          'Damage against Vulnerable enemies contributes 50% more to Ice Armor\'s Barrier.',
        ];
      case SorcererSkill.ShimmeringIceArmor:
        return [
          'Enemies that hit you while Ice Armor is active have a 15% chance to become Frozen for 3 seconds.',
        ];
      case SorcererSkill.Teleport:
        number = perLevel > 0 ? 17 - (1 - 0.1 * perLevel) : 17;
        return [
          'Cooldown: ${11 - 0.55 * perLevel} seconds',
          'Lucky Hit Chance: 65%',
          'Transform into lightning, becoming Unstoppable and surging to the target location, dealing ${25.5 + 2.5 * perLevel}% damage around you upon arrival.',
          '',
          'Enchantment effect:',
          'Evade is replaced with a short range Teleport on a $number second Cooldown.',
        ];
      case SorcererSkill.EnhancedTeleport:
        return [
          'Teleport\'s Cooldown is decreased by 0.5 seconds per enemy hit, up to 3 seconds.',
        ];
      case SorcererSkill.MysticalTeleport:
        return [
          'For 4 seconds after Teleporting, Crackling Energy hits 2 additional enemies.',
        ];
      case SorcererSkill.ShimmeringTeleport:
        return [
          'After Teleporting, you gain 30% Damage Reduction for 5 seconds.',
        ];
      case SorcererSkill.FrostNova:
        return [
          'Cooldown: ${24 - 1.2 * perLevel} seconds',
          'Unleash a torrent of frost, Freezing enemies around you for 3 seconds.',
          '',
          'Enchantment effect:',
          'Lucky Hit: Your Conjuration Skills have up to a 30% chance to unleash a Frost Nova when hitting enemies.',
        ];
      case SorcererSkill.EnhancedFrostNova:
        return [
          'Killing enemies Frozen by Frost Nova reduces its Cooldown by 1 second, up to 4 seconds per cast.',
        ];
      case SorcererSkill.MysticalFrostNova:
        return [
          'Frost Nova makes enemies Vulnerable for 4 seconds, increased to 6 seconds against Bosses.',
        ];
      case SorcererSkill.ShimmeringFrostNova:
        return [
          'Frost Nova generates 4 Mana per enemy hit.',
        ];
      case SorcererSkill.ElementalAttunement:
        return [
          'Lucky Hit: Critical Strikes have up to a ${5 + 5 * perLevel}% chance to reset the Cooldown of one of your Defensive Skills. Can only happen once every 10 seconds.',
        ];
      case SorcererSkill.GlassCannon:
        return [
          'You deal ${6 + 6 * perLevel}% increased damage, but take ${3 + 3 * perLevel}% more damage.',
        ];
      case SorcererSkill.Hydra:
        return [
          'Mana Cost: 20',
          'Lucky Hit Chance: 53%',
          'Summon a 3-headed hydra for 10 seconds. Each head spits fire at enemies, dealing ${12 + 1 * perLevel}% damage.',
          '',
          'Maximum 1 active Hydra at a time.',
          '',
          'Enchantment effect:',
          'After spending 300 Mana, a 5-headed Hydra spawns for 5 seconds.',
        ];
      case SorcererSkill.EnhancedHydra:
        return [
          'While Healthy, your casts of Hydra gain 1 additional head.',
        ];
      case SorcererSkill.InvokedHydra:
        return [
          'After you Critically Strike, your Hydras gain 30% Critical Strike Chance for 3 seconds.',
        ];
      case SorcererSkill.SummonedHydra:
        return [
          'Hydra also Burns enemies for an additional 12% of its Base damage dealt over 6 seconds.',
        ];
      case SorcererSkill.IceBlades:
        return [
          'Cooldown: 16 seconds',
          'Lucky Hit Chance: 71%',
          'Conjure a pair of ice blades for 6 seconds that rapidly slash enemies for ${23 + 2 * perLevel}% damage and have a 30% chance to make them Vulnerable for 2 seconds.',
          '',
          'Enchantment effect:',
          'For every 40 seconds in Cooldowns you spend, you spawn Ice Blades on a random enemy.',
        ];
      case SorcererSkill.EnhancedIceBlades:
        return [
          'Ice Blades\' Cooldown is reduced by 0.5 seconds each time it hits a Vulnerable enemy.',
        ];
      case SorcererSkill.InvokedIceBlades:
        return [
          'Your Ice Blades gain 10% increased Attack Speed per active Ice Blades.',
        ];
      case SorcererSkill.SummonedIceBlades:
        return [
          '20% of Enhanced Ice Blades\' Cooldown reduction is applied to your other Skills.',
        ];
      case SorcererSkill.LightningSpear:
        return [
          'Cooldown: 20 seconds',
          'Lucky Hit Chance: 26%',
          'Conjure a spear of lightning that seeks out enemies for 6 seconds, dealing ${15.5 + 1.5 * perLevel}% damage per hit.',
          '',
          'Enchantment effect:',
          'Absorbing Crackling Energy has a 10% chance to conjure a Lightning Spear.',
        ];
      case SorcererSkill.EnhancedLightningSpear:
        return [
          'After Critically Striking, Lightning Spear gains a 5% increased stacking Critical Strike Chance for its duration.',
        ];
      case SorcererSkill.InvokedLightningSpear:
        return [
          'Lightning Spear Stuns enemies for 2 seconds when Critically Striking.',
        ];
      case SorcererSkill.SummonedLightningSpear:
        return [
          'Collecting Crackling Energy increases the damage of your next Lightning Spear cast by 20%, up to 100%.',
        ];
      case SorcererSkill.AlignTheElements:
        return [
          'You gain ${1 + 1 * perLevel}% Damage Reduction against Elites for each second you haven\'t taken damage from one, up to 40%.',
        ];
      case SorcererSkill.ManaShield:
        return [
          'Every time you spend 100 Mana, you gain ${5 + 5 * perLevel}% Damage Reduction for 5 seconds.',
        ];
      case SorcererSkill.Protection:
        return [
          'Using a Cooldown grants ${10 + 10 * perLevel}% of your Maximum Life as a Barrier for 2 seconds.',
        ];
      case SorcererSkill.PrecisionMagic:
        return [
          'Your Lucky Hit Chance is increased by ${5 + 5 * perLevel}%.',
        ];
      case SorcererSkill.ConjurationMastery:
        return [
          'You deal ${1 + 1 * perLevel}% increased damage for each active Conjuration.',
        ];
      case SorcererSkill.Blizzard:
        return [
          'Mana Cost: 40',
          'Lucky Hit Chance: 33%',
          'Summon a frigid blizzard that deals ${120 + 12 * perLevel}% damage and continually Chills enemies for 18% over 8 seconds.',
          '',
          'Enchantment effect:',
          'Every 15 seconds, a Blizzard forms over you and follows you for 6 seconds.',
        ];
      case SorcererSkill.EnhancedBlizzard:
        return [
          'Blizzard deals 25% increased damage to Frozen enemies.',
        ];
      case SorcererSkill.MagesBlizzard:
        return [
          'When cast above 50 Mana, Blizzard\'s duration is increased by 4 seconds.',
        ];
      case SorcererSkill.WizardsBlizzard:
        return [
          'While you have an active Blizzard, your Core Skills cost 10% less Mana.',
        ];
      case SorcererSkill.Firewall:
        return [
          'Mana Cost: 30',
          'Lucky Hit Chance: 30%',
          'Create a wall of flames that Burns enemies for ${160 + 16 * perLevel}% damage over 8 seconds.',
          '',
          'Enchantment effect:',
          'Each time an enemy takes Burning damage, there\'s a 5% chance to spawn 2 Firewalls underneath them for 3 seconds.',
        ];
      case SorcererSkill.EnhancedFirewall:
        return [
          'Enemies take 25% increased Burning damage from you while standing in Firewall.',
        ];
      case SorcererSkill.MagesFirewall:
        return [
          'Enemies continue Burning for 3 seconds after leaving Firewall.',
        ];
      case SorcererSkill.WizardsFirewall:
        return [
          'You gain 5% increased Mana Regeneration per active Firewall, up to 25%.',
        ];
      case SorcererSkill.Meteor:
        return [
          'Mana Cost: 40',
          'Lucky Hit Chance: 40%',
          'Summon a meteor that strikes the target location, dealing ${80 + 8 * perLevel}% damage and Burning the ground for ${35.5 + 3.5 * perLevel}% damage over 3 seconds.',
          '',
          'Enchantment effect:',
          'Lucky Hit: Up to an 8% chance for a Meteor to fall on a random enemy.',
        ];
      case SorcererSkill.EnhancedMeteor:
        return [
          'If a cast of Meteor hits 3 or more enemies, there is a 30% chance an additional Meteor falls on the same location.',
        ];
      case SorcererSkill.MagesMeteor:
        return [
          'Meteor falls 30% faster.',
        ];
      case SorcererSkill.WizardsMeteor:
        return [
          'Meteor\'s impact Immobilizes enemies for 2 seconds.',
        ];
      case SorcererSkill.BallLightning:
        return [
          'Mana Cost: 50',
          'Lucky Hit Chance: 5%',
          'Discharge a ball of lightning that slowly moves forward, continually zapping enemies for ${18 + 2 * perLevel}% damage.',
          '',
          'Enchantment effect:',
          'Lucky Hit: Critical Strikes have up to a 25% chance to spawn a static Ball Lightning.',
        ];
      case SorcererSkill.EnhancedBallLightning:
        return [
          'Ball Lightning\'s damage rate is increased by 200% of your Attack Speed Bonus.',
        ];
      case SorcererSkill.MagesBallLightning:
        return [
          'After hitting Close enemies 50 times with Ball Lightning, your next cast of it Stuns enemies hit for 1 second.',
        ];
      case SorcererSkill.WizardsBallLightning:
        return [
          'If an enemy is hit at least 4 times by a cast of Ball Lightning, a Crackling Energy is formed. Can only happen once per cast.',
        ];
      case SorcererSkill.IcyVeil:
        return [
          'Your Barriers have a ${5 + 5 * perLevel}% increased duration.',
        ];
      case SorcererSkill.ColdFront:
        return [
          'While you have a Barrier active, you apply ${8 + 8 * perLevel}% more Chill.',
        ];
      case SorcererSkill.SnapFreeze:
        return [
          'Lucky Hit: Frost Skills have up to a ${3 + 3 * perLevel}% chance to instantly Freeze.',
        ];
      case SorcererSkill.InnerFlames:
        return [
          'Your Pyromancy Skills deal ${3 + 3 * perLevel}% increased damage while you are Healthy.',
        ];
      case SorcererSkill.CripplingFlames:
        return [
          'Lucky Hit: Your Pyromancy Skills have up to a ${5 + 5 * perLevel}% chance to Immobilize enemies for 2 seconds. This chance is doubled while you are Healthy.',
        ];
      case SorcererSkill.DevouringBlaze:
        return [
          'You deal ${10 + 10 * perLevel}% increased Critical Strike Damage against Burning enemies. If they are also Immobilized, this bonus is increased to ${25 + 25 * perLevel}%.',
        ];
      case SorcererSkill.StaticDischarge:
        return [
          'Lucky Hit: Critical Strikes with Shock Skills have up to a ${5 + 5 * perLevel}% chance to form a Crackling Energy.',
        ];
      case SorcererSkill.ShockingImpact:
        return [
          'Every time you Stun an enemy, you deal ${15 + 15 * perLevel}% Lightning damage to them.',
        ];
      case SorcererSkill.InvigoratingConduit:
        return [
          'Upon absorbing Crackling Energy, you gain ${4 + 4 * perLevel} Mana.',
        ];
      case SorcererSkill.DeepFreeze:
        return [
          'Cooldown: 60',
          'Lucky Hit Chance: 2%',
          'Encase yourself in ice, becoming Immune for 4 seconds, continually dealing 25% damage, and Chilling enemies for 14%. When Deep Freeze expires, it deals an additional 100% damage.',
          '',
          'Casting Deep Freeze again ends the effect early.',
        ];
      case SorcererSkill.PrimeDeepFreeze:
        return [
          'When Deep Freeze ends, gain 10% of your Base Life as a Barrier for 6 seconds for each enemy you Froze while it was active.',
        ];
      case SorcererSkill.SupremeDeepFreeze:
        return [
          'When Deep Freeze ends, your Non-Ultimate Cooldowns are reduced by 50%.',
        ];
      case SorcererSkill.Inferno:
        return [
          'Cooldown: 45',
          'Lucky Hit Chance: 10%',
          'Summon a fiery serpent that continually constricts the target area, Burning enemies for 295% damage over 8 seconds.',
        ];
      case SorcererSkill.PrimeInferno:
        return [
          'Inferno repeatedly Pulls enemies to its center.',
        ];
      case SorcererSkill.SupremeInferno:
        return [
          'While Inferno is active, your Pyromancy Skills cost no Mana.',
        ];
      case SorcererSkill.UnstableCurrents:
        return [
          'Cooldown: 70',
          'Lightning surges within you for 10 seconds. Whenever you cast a Shock Skill, a random Core, Conjuration, or Mastery Shock Skill is also cast.',
        ];
      case SorcererSkill.PrimeUnstableCurrents:
        return [
          'Unstable Currents increases your Attack Speed by 25% while active.',
        ];
      case SorcererSkill.SupremeUnstableCurrents:
        return [
          'While Unstable Currents is active, Crackling Energy continually pulses and consumes no charges.',
        ];
      case SorcererSkill.Permafrost:
        return [
          'Frost Skills deal ${5 + 5 * perLevel}% increased damage to Elites.',
        ];
      case SorcererSkill.Hoarfrost:
        return [
          'You deal ${3 + 3 * perLevel}% increased damage to Chilled enemies, and ${6 + 6 * perLevel}% increased damage to Frozen enemies.',
        ];
      case SorcererSkill.IcyTouch:
        return [
          'You deal ${4 + 4 * perLevel}% increased Cold damage to Vulnerable enemies.',
        ];
      case SorcererSkill.FrigidBreeze:
        return [
          'Lucky Hit: Cold damage against Vulnerable enemies has up to a 20% chance to generate ${5 + 5 * perLevel} Mana.',
        ];
      case SorcererSkill.FierySurge:
        return [
          'Killing a Burning enemy increases your Mana Regeneration by ${10 + 10 * perLevel}% for 3 seconds.',
        ];
      case SorcererSkill.EndlessPyre:
        return [
          'You deal increased Burning damage to enemies for each second they remain Burning, up to ${5 + 5 * perLevel}% after 5 seconds.',
        ];
      case SorcererSkill.Soulfire:
        return [
          'After standing still for 1.5 seconds, your Pyromancy Skills cost ${5 + 5 * perLevel}% less Mana.',
        ];
      case SorcererSkill.Warmth:
        return [
          'Every 1 second, you Heal for ${0.3 + 0.3 * perLevel}% of your Maximum Life for each Nearby Burning enemy. Healing increased to ${0.6 + 0.6 * perLevel}% from Bosses.',
        ];
      case SorcererSkill.CoursingCurrents:
        return [
          'Hitting enemies with Shock Skills increases your Critical Strike Chance by ${1 + 1 * perLevel}%. Resets upon getting a Critical Strike.',
        ];
      case SorcererSkill.Conduction:
        return [
          'Critical Strikes with Shock Skills increase your Movement Speed by ${3 + 3 * perLevel}% for 3 seconds.',
        ];
      case SorcererSkill.Electrocution:
        return [
          'Enemies deal ${5 + 5 * perLevel}% less damage for 5 seconds after being Critically Struck by your Shock Skills.',
        ];
      case SorcererSkill.Convulsions:
        return [
          'Lucky Hit: Shock Skills have up to a ${3 + 3 * perLevel}% chance to Stun enemies for 3 seconds.',
        ];
      case SorcererSkill.Avalanche:
        return [
          'Lucky Hit: Your Frost Skills have up to a 10% chance to make your next cast of Ice Shards, Frozen Orb, or Blizzard consume no Mana and deal 40% increased damage. Chance is doubled against Vulnerable enemies.',
        ];
      case SorcererSkill.Shatter:
        return [
          'After Freeze expires, enemies explode for 25% of the damage you dealt to them while Frozen.',
        ];
      case SorcererSkill.OverflowingEnergy:
        return [
          'Crackling Energy hits 1 additional enemy. Each time Crackling Energy hits an enemy, your Shock Skill Cooldowns are reduced by 0.1 seconds, increased to 0.25 seconds against Elites.',
        ];
      case SorcererSkill.VyrsMastery:
        return [
          'Close enemies take 10% increased damage from your Shock Skills and deal 20% less damage to you. Critical Strikes increase these bonuses by 25% for 3 seconds.',
        ];
      case SorcererSkill.EsusFerocity:
        return [
          'Your Fire Critical Strike Damage is increased by 25% against enemies above 50% Life. Your Fire Critical Strike Chance is increased by 5% against enemies below 50% Life.',
          '',
          'Killing an enemy with a Critical Strike grants both bonuses against all enemies for 3 seconds.',
        ];
      case SorcererSkill.Combustion:
        return [
          'Your Burning effects deal 2% increased damage per unique source of Burning you have applied to the enemy. If the enemy is Burning from 3 or more sources, this bonus is doubled.',
        ];
    }
  }

  static SorcererCluster clusterOf(SorcererSkill sorcererSkill) {
    switch (sorcererSkill) {
      case SorcererSkill.Spark:
      case SorcererSkill.EnhancedSpark:
      case SorcererSkill.FlickeringSpark:
      case SorcererSkill.GlintingSpark:
      case SorcererSkill.FrostBolt:
      case SorcererSkill.EnhancedFrostBolt:
      case SorcererSkill.FlickeringFrostBolt:
      case SorcererSkill.GlintingFrostBolt:
      case SorcererSkill.FireBolt:
      case SorcererSkill.EnhancedFireBolt:
      case SorcererSkill.FlickeringFireBolt:
      case SorcererSkill.GlintingFireBolt:
      case SorcererSkill.ArcLash:
      case SorcererSkill.EnhancedArcLash:
      case SorcererSkill.FlickeringArcLash:
      case SorcererSkill.GlintingArcLash:
        return SorcererCluster.Basic;
      case SorcererSkill.ChainLightning:
      case SorcererSkill.EnhancedChainLightning:
      case SorcererSkill.DestructiveChainLightning:
      case SorcererSkill.GreaterChainLightning:
      case SorcererSkill.ChargedBolts:
      case SorcererSkill.EnhancedChargedBolts:
      case SorcererSkill.DestructiveChargedBolts:
      case SorcererSkill.GreaterChargedBolts:
      case SorcererSkill.Fireball:
      case SorcererSkill.EnhancedFireball:
      case SorcererSkill.DestructiveFireball:
      case SorcererSkill.GreaterFireball:
      case SorcererSkill.FrozenOrb:
      case SorcererSkill.EnhancedFrozenOrb:
      case SorcererSkill.DestructiveFrozenOrb:
      case SorcererSkill.GreaterFrozenOrb:
      case SorcererSkill.Incinerate:
      case SorcererSkill.EnhancedIncinerate:
      case SorcererSkill.DestructiveIncinerate:
      case SorcererSkill.GreaterIncinerate:
      case SorcererSkill.IceShards:
      case SorcererSkill.EnhancedIceShards:
      case SorcererSkill.DestructiveIceShards:
      case SorcererSkill.GreaterIceShards:
      case SorcererSkill.Devastation:
      case SorcererSkill.ElementalDominance:
      case SorcererSkill.PotentWarding:
        return SorcererCluster.Core;
      case SorcererSkill.FlameShield:
      case SorcererSkill.EnhancedFlameShield:
      case SorcererSkill.MysticalFlameShield:
      case SorcererSkill.ShimmeringFlameShield:
      case SorcererSkill.IceArmor:
      case SorcererSkill.EnhancedIceArmor:
      case SorcererSkill.MysticalIceArmor:
      case SorcererSkill.ShimmeringIceArmor:
      case SorcererSkill.Teleport:
      case SorcererSkill.EnhancedTeleport:
      case SorcererSkill.MysticalTeleport:
      case SorcererSkill.ShimmeringTeleport:
      case SorcererSkill.FrostNova:
      case SorcererSkill.EnhancedFrostNova:
      case SorcererSkill.MysticalFrostNova:
      case SorcererSkill.ShimmeringFrostNova:
      case SorcererSkill.ElementalAttunement:
      case SorcererSkill.GlassCannon:
        return SorcererCluster.Defensive;
      case SorcererSkill.Hydra:
      case SorcererSkill.EnhancedHydra:
      case SorcererSkill.InvokedHydra:
      case SorcererSkill.SummonedHydra:
      case SorcererSkill.IceBlades:
      case SorcererSkill.EnhancedIceBlades:
      case SorcererSkill.InvokedIceBlades:
      case SorcererSkill.SummonedIceBlades:
      case SorcererSkill.LightningSpear:
      case SorcererSkill.EnhancedLightningSpear:
      case SorcererSkill.InvokedLightningSpear:
      case SorcererSkill.SummonedLightningSpear:
      case SorcererSkill.AlignTheElements:
      case SorcererSkill.ManaShield:
      case SorcererSkill.Protection:
      case SorcererSkill.PrecisionMagic:
      case SorcererSkill.ConjurationMastery:
        return SorcererCluster.Conjuration;
      case SorcererSkill.Blizzard:
      case SorcererSkill.EnhancedBlizzard:
      case SorcererSkill.MagesBlizzard:
      case SorcererSkill.WizardsBlizzard:
      case SorcererSkill.Firewall:
      case SorcererSkill.EnhancedFirewall:
      case SorcererSkill.MagesFirewall:
      case SorcererSkill.WizardsFirewall:
      case SorcererSkill.Meteor:
      case SorcererSkill.EnhancedMeteor:
      case SorcererSkill.MagesMeteor:
      case SorcererSkill.WizardsMeteor:
      case SorcererSkill.BallLightning:
      case SorcererSkill.EnhancedBallLightning:
      case SorcererSkill.MagesBallLightning:
      case SorcererSkill.WizardsBallLightning:
      case SorcererSkill.IcyVeil:
      case SorcererSkill.ColdFront:
      case SorcererSkill.SnapFreeze:
      case SorcererSkill.InnerFlames:
      case SorcererSkill.CripplingFlames:
      case SorcererSkill.DevouringBlaze:
      case SorcererSkill.StaticDischarge:
      case SorcererSkill.ShockingImpact:
      case SorcererSkill.InvigoratingConduit:
        return SorcererCluster.Mastery;
      case SorcererSkill.DeepFreeze:
      case SorcererSkill.PrimeDeepFreeze:
      case SorcererSkill.SupremeDeepFreeze:
      case SorcererSkill.Inferno:
      case SorcererSkill.PrimeInferno:
      case SorcererSkill.SupremeInferno:
      case SorcererSkill.UnstableCurrents:
      case SorcererSkill.PrimeUnstableCurrents:
      case SorcererSkill.SupremeUnstableCurrents:
      case SorcererSkill.Permafrost:
      case SorcererSkill.Hoarfrost:
      case SorcererSkill.IcyTouch:
      case SorcererSkill.FrigidBreeze:
      case SorcererSkill.FierySurge:
      case SorcererSkill.EndlessPyre:
      case SorcererSkill.Soulfire:
      case SorcererSkill.Warmth:
      case SorcererSkill.CoursingCurrents:
      case SorcererSkill.Conduction:
      case SorcererSkill.Electrocution:
      case SorcererSkill.Convulsions:
        return SorcererCluster.Ultimate;
      case SorcererSkill.Avalanche:
      case SorcererSkill.Shatter:
      case SorcererSkill.OverflowingEnergy:
      case SorcererSkill.VyrsMastery:
      case SorcererSkill.EsusFerocity:
      case SorcererSkill.Combustion:
        return SorcererCluster.KeyPassive;
      default:
        assert(false, 'case $sorcererSkill missing');
        return SorcererCluster.Basic;
    }
  }

  static SkillType skillTypeOf(SorcererSkill sorcererSkill) {
    switch (sorcererSkill) {
      case SorcererSkill.Spark:
      case SorcererSkill.FrostBolt:
      case SorcererSkill.FireBolt:
      case SorcererSkill.ArcLash:
      case SorcererSkill.ChainLightning:
      case SorcererSkill.ChargedBolts:
      case SorcererSkill.Fireball:
      case SorcererSkill.FrozenOrb:
      case SorcererSkill.Incinerate:
      case SorcererSkill.IceShards:
      case SorcererSkill.FlameShield:
      case SorcererSkill.IceArmor:
      case SorcererSkill.Teleport:
      case SorcererSkill.FrostNova:
      case SorcererSkill.Hydra:
      case SorcererSkill.IceBlades:
      case SorcererSkill.LightningSpear:
      case SorcererSkill.Blizzard:
      case SorcererSkill.Firewall:
      case SorcererSkill.Meteor:
      case SorcererSkill.BallLightning:
      case SorcererSkill.DeepFreeze:
      case SorcererSkill.Inferno:
      case SorcererSkill.UnstableCurrents:
        return SkillType.Active;
      case SorcererSkill.EnhancedSpark:
      case SorcererSkill.EnhancedFrostBolt:
      case SorcererSkill.EnhancedFireBolt:
      case SorcererSkill.EnhancedArcLash:
      case SorcererSkill.EnhancedChainLightning:
      case SorcererSkill.EnhancedChargedBolts:
      case SorcererSkill.EnhancedFireball:
      case SorcererSkill.EnhancedFrozenOrb:
      case SorcererSkill.EnhancedIncinerate:
      case SorcererSkill.EnhancedIceShards:
      case SorcererSkill.EnhancedFlameShield:
      case SorcererSkill.EnhancedIceArmor:
      case SorcererSkill.EnhancedTeleport:
      case SorcererSkill.EnhancedFrostNova:
      case SorcererSkill.EnhancedHydra:
      case SorcererSkill.EnhancedIceBlades:
      case SorcererSkill.EnhancedLightningSpear:
      case SorcererSkill.EnhancedBlizzard:
      case SorcererSkill.EnhancedFirewall:
      case SorcererSkill.EnhancedMeteor:
      case SorcererSkill.EnhancedBallLightning:
      case SorcererSkill.PrimeDeepFreeze:
      case SorcererSkill.PrimeInferno:
      case SorcererSkill.PrimeUnstableCurrents:
        return SkillType.Enhancement;
      case SorcererSkill.FlickeringSpark:
      case SorcererSkill.GlintingSpark:
      case SorcererSkill.FlickeringFrostBolt:
      case SorcererSkill.GlintingFrostBolt:
      case SorcererSkill.FlickeringFireBolt:
      case SorcererSkill.GlintingFireBolt:
      case SorcererSkill.FlickeringArcLash:
      case SorcererSkill.GlintingArcLash:
      case SorcererSkill.DestructiveChainLightning:
      case SorcererSkill.GreaterChainLightning:
      case SorcererSkill.DestructiveChargedBolts:
      case SorcererSkill.GreaterChargedBolts:
      case SorcererSkill.DestructiveFireball:
      case SorcererSkill.GreaterFireball:
      case SorcererSkill.DestructiveFrozenOrb:
      case SorcererSkill.GreaterFrozenOrb:
      case SorcererSkill.DestructiveIncinerate:
      case SorcererSkill.GreaterIncinerate:
      case SorcererSkill.DestructiveIceShards:
      case SorcererSkill.GreaterIceShards:
      case SorcererSkill.MysticalFlameShield:
      case SorcererSkill.ShimmeringFlameShield:
      case SorcererSkill.MysticalIceArmor:
      case SorcererSkill.ShimmeringIceArmor:
      case SorcererSkill.MysticalTeleport:
      case SorcererSkill.ShimmeringTeleport:
      case SorcererSkill.MysticalFrostNova:
      case SorcererSkill.ShimmeringFrostNova:
      case SorcererSkill.InvokedHydra:
      case SorcererSkill.SummonedHydra:
      case SorcererSkill.InvokedIceBlades:
      case SorcererSkill.SummonedIceBlades:
      case SorcererSkill.InvokedLightningSpear:
      case SorcererSkill.SummonedLightningSpear:
      case SorcererSkill.MagesBlizzard:
      case SorcererSkill.WizardsBlizzard:
      case SorcererSkill.MagesFirewall:
      case SorcererSkill.WizardsFirewall:
      case SorcererSkill.MagesMeteor:
      case SorcererSkill.WizardsMeteor:
      case SorcererSkill.MagesBallLightning:
      case SorcererSkill.WizardsBallLightning:
      case SorcererSkill.SupremeDeepFreeze:
      case SorcererSkill.SupremeInferno:
      case SorcererSkill.SupremeUnstableCurrents:
        return SkillType.Upgrade;
      case SorcererSkill.Devastation:
      case SorcererSkill.ElementalDominance:
      case SorcererSkill.PotentWarding:
      case SorcererSkill.ElementalAttunement:
      case SorcererSkill.GlassCannon:
      case SorcererSkill.AlignTheElements:
      case SorcererSkill.ManaShield:
      case SorcererSkill.Protection:
      case SorcererSkill.PrecisionMagic:
      case SorcererSkill.ConjurationMastery:
      case SorcererSkill.IcyVeil:
      case SorcererSkill.ColdFront:
      case SorcererSkill.SnapFreeze:
      case SorcererSkill.InnerFlames:
      case SorcererSkill.CripplingFlames:
      case SorcererSkill.DevouringBlaze:
      case SorcererSkill.StaticDischarge:
      case SorcererSkill.ShockingImpact:
      case SorcererSkill.InvigoratingConduit:
      case SorcererSkill.Permafrost:
      case SorcererSkill.Hoarfrost:
      case SorcererSkill.IcyTouch:
      case SorcererSkill.FrigidBreeze:
      case SorcererSkill.FierySurge:
      case SorcererSkill.EndlessPyre:
      case SorcererSkill.Soulfire:
      case SorcererSkill.Warmth:
      case SorcererSkill.CoursingCurrents:
      case SorcererSkill.Conduction:
      case SorcererSkill.Electrocution:
      case SorcererSkill.Convulsions:
      case SorcererSkill.Avalanche:
      case SorcererSkill.Shatter:
      case SorcererSkill.OverflowingEnergy:
      case SorcererSkill.VyrsMastery:
      case SorcererSkill.EsusFerocity:
      case SorcererSkill.Combustion:
        return SkillType.Passive;
    }
  }

  static Tree<Enum> get spark => _skillTree(
        SorcererSkill.Spark,
        [
          _skillTree(
            SorcererSkill.EnhancedSpark,
            [
              _skillTree(SorcererSkill.FlickeringSpark, _childless),
              _skillTree(SorcererSkill.GlintingSpark, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get frostBolt => _skillTree(
        SorcererSkill.FrostBolt,
        [
          _skillTree(
            SorcererSkill.EnhancedFrostBolt,
            [
              _skillTree(SorcererSkill.FlickeringFrostBolt, _childless),
              _skillTree(SorcererSkill.GlintingFrostBolt, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get fireBolt => _skillTree(
        SorcererSkill.FireBolt,
        [
          _skillTree(
            SorcererSkill.EnhancedFireBolt,
            [
              _skillTree(SorcererSkill.FlickeringFireBolt, _childless),
              _skillTree(SorcererSkill.GlintingFireBolt, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get arcLash => _skillTree(
        SorcererSkill.ArcLash,
        [
          _skillTree(
            SorcererSkill.EnhancedArcLash,
            [
              _skillTree(SorcererSkill.FlickeringArcLash, _childless),
              _skillTree(SorcererSkill.GlintingArcLash, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get chainLightning => _skillTree(
        SorcererSkill.ChainLightning,
        [
          _skillTree(
            SorcererSkill.EnhancedChainLightning,
            [
              _skillTree(SorcererSkill.DestructiveChainLightning, _childless),
              _skillTree(SorcererSkill.GreaterChainLightning, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get chargedBolts => _skillTree(
        SorcererSkill.ChargedBolts,
        [
          _skillTree(
            SorcererSkill.EnhancedChargedBolts,
            [
              _skillTree(SorcererSkill.DestructiveChargedBolts, _childless),
              _skillTree(SorcererSkill.GreaterChargedBolts, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get fireball => _skillTree(
        SorcererSkill.Fireball,
        [
          _skillTree(
            SorcererSkill.EnhancedFireball,
            [
              _skillTree(SorcererSkill.DestructiveFireball, _childless),
              _skillTree(SorcererSkill.GreaterFireball, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get frozenOrb => _skillTree(
        SorcererSkill.FrozenOrb,
        [
          _skillTree(
            SorcererSkill.EnhancedFrozenOrb,
            [
              _skillTree(SorcererSkill.DestructiveFrozenOrb, _childless),
              _skillTree(SorcererSkill.GreaterFrozenOrb, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get incinerate => _skillTree(
        SorcererSkill.Incinerate,
        [
          _skillTree(
            SorcererSkill.EnhancedIncinerate,
            [
              _skillTree(SorcererSkill.DestructiveIncinerate, _childless),
              _skillTree(SorcererSkill.GreaterIncinerate, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get iceShards => _skillTree(
        SorcererSkill.IceShards,
        [
          _skillTree(
            SorcererSkill.EnhancedIceShards,
            [
              _skillTree(SorcererSkill.DestructiveIceShards, _childless),
              _skillTree(SorcererSkill.GreaterIceShards, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get devastation => _skillTree(
        SorcererSkill.Devastation,
        [
          _skillTree(SorcererSkill.ElementalDominance, _childless),
        ],
      );

  static Tree<Enum> get potentWarding =>
      _skillTree(SorcererSkill.PotentWarding, _childless);

  static Tree<Enum> get flameShield => _skillTree(
        SorcererSkill.FlameShield,
        [
          _skillTree(
            SorcererSkill.EnhancedFlameShield,
            [
              _skillTree(SorcererSkill.MysticalFlameShield, _childless),
              _skillTree(SorcererSkill.ShimmeringFlameShield, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get iceArmor => _skillTree(
        SorcererSkill.IceArmor,
        [
          _skillTree(
            SorcererSkill.EnhancedIceArmor,
            [
              _skillTree(SorcererSkill.MysticalIceArmor, _childless),
              _skillTree(SorcererSkill.ShimmeringIceArmor, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get teleport => _skillTree(
        SorcererSkill.Teleport,
        [
          _skillTree(
            SorcererSkill.EnhancedTeleport,
            [
              _skillTree(SorcererSkill.MysticalTeleport, _childless),
              _skillTree(SorcererSkill.ShimmeringTeleport, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get frostNova => _skillTree(
        SorcererSkill.FrostNova,
        [
          _skillTree(
            SorcererSkill.EnhancedFrostNova,
            [
              _skillTree(SorcererSkill.MysticalFrostNova, _childless),
              _skillTree(SorcererSkill.ShimmeringFrostNova, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get elementalAttunement =>
      _skillTree(SorcererSkill.ElementalAttunement, _childless);

  static Tree<Enum> get glassCannon =>
      _skillTree(SorcererSkill.GlassCannon, _childless);

  static Tree<Enum> get hydra => _skillTree(
        SorcererSkill.Hydra,
        [
          _skillTree(
            SorcererSkill.EnhancedHydra,
            [
              _skillTree(SorcererSkill.InvokedHydra, _childless),
              _skillTree(SorcererSkill.SummonedHydra, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get iceBlades => _skillTree(
        SorcererSkill.IceBlades,
        [
          _skillTree(
            SorcererSkill.EnhancedIceBlades,
            [
              _skillTree(SorcererSkill.InvokedIceBlades, _childless),
              _skillTree(SorcererSkill.SummonedIceBlades, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get lightningSpear => _skillTree(
        SorcererSkill.LightningSpear,
        [
          _skillTree(
            SorcererSkill.EnhancedLightningSpear,
            [
              _skillTree(SorcererSkill.InvokedLightningSpear, _childless),
              _skillTree(SorcererSkill.SummonedLightningSpear, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get alignTheElements => _skillTree(
        SorcererSkill.AlignTheElements,
        [
          _skillTree(SorcererSkill.ManaShield, _childless),
          _skillTree(SorcererSkill.Protection, _childless),
        ],
      );

  static Tree<Enum> get precisionMagic =>
      _skillTree(SorcererSkill.PrecisionMagic, _childless);

  static Tree<Enum> get conjurationMastery =>
      _skillTree(SorcererSkill.ConjurationMastery, _childless);

  static Tree<Enum> get blizzard => _skillTree(
        SorcererSkill.Blizzard,
        [
          _skillTree(
            SorcererSkill.EnhancedBlizzard,
            [
              _skillTree(SorcererSkill.MagesBlizzard, _childless),
              _skillTree(SorcererSkill.WizardsBlizzard, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get firewall => _skillTree(
        SorcererSkill.Firewall,
        [
          _skillTree(
            SorcererSkill.EnhancedFirewall,
            [
              _skillTree(SorcererSkill.MagesFirewall, _childless),
              _skillTree(SorcererSkill.WizardsFirewall, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get meteor => _skillTree(
        SorcererSkill.Meteor,
        [
          _skillTree(
            SorcererSkill.EnhancedMeteor,
            [
              _skillTree(SorcererSkill.MagesMeteor, _childless),
              _skillTree(SorcererSkill.WizardsMeteor, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get ballLightning => _skillTree(
        SorcererSkill.BallLightning,
        [
          _skillTree(
            SorcererSkill.EnhancedBallLightning,
            [
              _skillTree(SorcererSkill.MagesBallLightning, _childless),
              _skillTree(SorcererSkill.WizardsBallLightning, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get icyVeil => _skillTree(
        SorcererSkill.IcyVeil,
        [
          _skillTree(SorcererSkill.ColdFront, _childless),
          _skillTree(SorcererSkill.SnapFreeze, _childless),
        ],
      );

  static Tree<Enum> get innerFlames => _skillTree(
        SorcererSkill.InnerFlames,
        [
          _skillTree(SorcererSkill.CripplingFlames, _childless),
          _skillTree(SorcererSkill.DevouringBlaze, _childless),
        ],
      );

  static Tree<Enum> get staticDischarge => _skillTree(
        SorcererSkill.StaticDischarge,
        [
          _skillTree(SorcererSkill.ShockingImpact, _childless),
          _skillTree(SorcererSkill.InvigoratingConduit, _childless),
        ],
      );

  static Tree<Enum> get deepFreeze => _skillTree(
        SorcererSkill.DeepFreeze,
        [
          _skillTree(
            SorcererSkill.PrimeDeepFreeze,
            [
              _skillTree(SorcererSkill.SupremeDeepFreeze, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get inferno => _skillTree(
        SorcererSkill.Inferno,
        [
          _skillTree(
            SorcererSkill.PrimeInferno,
            [
              _skillTree(SorcererSkill.SupremeInferno, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get unstableCurrents => _skillTree(
        SorcererSkill.UnstableCurrents,
        [
          _skillTree(
            SorcererSkill.PrimeUnstableCurrents,
            [
              _skillTree(SorcererSkill.SupremeUnstableCurrents, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get permafrost => _skillTree(
        SorcererSkill.Permafrost,
        [
          _skillTree(
            SorcererSkill.Hoarfrost,
            [
              _skillTree(SorcererSkill.FrigidBreeze, _childless),
            ],
          ),
          _skillTree(
            SorcererSkill.IcyTouch,
            [
              _skillTree(SorcererSkill.FrigidBreeze, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get fierySurge => _skillTree(
        SorcererSkill.FierySurge,
        [
          _skillTree(
            SorcererSkill.EndlessPyre,
            [
              _skillTree(SorcererSkill.Warmth, _childless),
            ],
          ),
          _skillTree(
            SorcererSkill.Soulfire,
            [
              _skillTree(SorcererSkill.Warmth, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get coursingCurrents => _skillTree(
        SorcererSkill.CoursingCurrents,
        [
          _skillTree(
            SorcererSkill.Conduction,
            [
              _skillTree(SorcererSkill.Convulsions, _childless),
            ],
          ),
          _skillTree(
            SorcererSkill.Electrocution,
            [
              _skillTree(SorcererSkill.Convulsions, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get avalanche =>
      _skillTree(SorcererSkill.Avalanche, _childless);

  static Tree<Enum> get shatter =>
      _skillTree(SorcererSkill.Shatter, _childless);

  static Tree<Enum> get overflowingEnergy =>
      _skillTree(SorcererSkill.OverflowingEnergy, _childless);

  static Tree<Enum> get vyrsMastery =>
      _skillTree(SorcererSkill.VyrsMastery, _childless);

  static Tree<Enum> get esusFerocity =>
      _skillTree(SorcererSkill.EsusFerocity, _childless);

  static Tree<Enum> get combustion =>
      _skillTree(SorcererSkill.Combustion, _childless);

  static Tree<Enum> get basic => _skillTree(
        SorcererCluster.Basic,
        [
          spark,
          frostBolt,
          fireBolt,
          arcLash,
        ],
      );

  static Tree<Enum> get core => _skillTree(
        SorcererCluster.Core,
        [
          chainLightning,
          chargedBolts,
          fireball,
          frozenOrb,
          incinerate,
          iceShards,
          devastation,
          potentWarding,
        ],
      );

  static Tree<Enum> get defensive => _skillTree(
        SorcererCluster.Defensive,
        [
          flameShield,
          iceArmor,
          teleport,
          frostNova,
          elementalAttunement,
          glassCannon,
        ],
      );

  static Tree<Enum> get conjuration => _skillTree(
        SorcererCluster.Conjuration,
        [
          hydra,
          iceBlades,
          lightningSpear,
          alignTheElements,
          precisionMagic,
          conjurationMastery,
        ],
      );

  static Tree<Enum> get mastery => _skillTree(
        SorcererCluster.Mastery,
        [
          blizzard,
          firewall,
          meteor,
          ballLightning,
          icyVeil,
          innerFlames,
          staticDischarge,
        ],
      );

  static Tree<Enum> get ultimate => _skillTree(
        SorcererCluster.Ultimate,
        [
          deepFreeze,
          inferno,
          unstableCurrents,
          permafrost,
          fierySurge,
          coursingCurrents,
        ],
      );

  static Tree<Enum> get keyPassive => _skillTree(
        SorcererCluster.KeyPassive,
        [
          avalanche,
          shatter,
          overflowingEnergy,
          vyrsMastery,
          esusFerocity,
          combustion,
        ],
      );

  static Tree<Enum> get sorcerer => _skillTree(
        Hero.Sorcerer,
        [
          basic,
          core,
          defensive,
          conjuration,
          mastery,
          ultimate,
          keyPassive,
        ],
      );
}
