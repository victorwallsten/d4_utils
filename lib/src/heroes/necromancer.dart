import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/necromancer_cluster.dart';
import 'package:d4_utils/src/enums/necromancer_skill.dart';
import 'package:d4_utils/src/enums/hero.dart';
import 'package:d4_utils/src/enums/skill_type.dart';

abstract class Necromancer {
  static Tree<Enum> _skillTree(Enum e, List<Tree<Enum>> children) =>
      Tree(element: e, children: children);

  static List<Tree<Enum>> get _childless => const [];

  static List<String> descriptionOf(
    NecromancerSkill necromancerSkill,
    int level,
  ) {
    int perLevel = level > 0 ? level - 1 : level;
    String s;
    switch (necromancerSkill) {
      case NecromancerSkill.BoneSplinters:
        return [
          'Generate Essence: 6',
          'Lucky Hit Chance: 17%',
          'Fire 3 bone splinters, dealing ${8 + 1 * perLevel}% damage each. Each subsequent time an enemy is hit by the same cast of Bone Splinters, you gain 1 Essence.',
        ];
      case NecromancerSkill.EnhancedBoneSplinters:
        return [
          'Bone Splinters has a 25% chance to fire 2 additional projectiles if cast while you have 50 or more Essence.',
        ];
      case NecromancerSkill.AcolytesBoneSplinters:
        return [
          'Hitting the same enemy at least 3 times with the same cast of Bone Splinters grants 8% Critical Strike Chance for 4 seconds.',
        ];
      case NecromancerSkill.InitiatesBoneSplinters:
        return [
          'Bone Splinters has a 20% chance per hit to make enemies Vulnerable for 2 seconds.',
        ];
      case NecromancerSkill.Decompose:
        return [
          'Generate Essence: 8 per second',
          'Lucky Hit Chance: 40%',
          'Tear the flesh from an enemy, dealing ${30 + 3 * perLevel}% damage per second and forming a usable Corpse with the flesh every 2.5 seconds.',
        ];
      case NecromancerSkill.EnhancedDecompose:
        return [
          'If an enemy dies while being Decomposed, you gain 10 Essence.',
        ];
      case NecromancerSkill.AcolytesDecompose:
        return [
          'You and your Minions deal 10% increased damage to enemies who are being Decomposed.',
        ];
      case NecromancerSkill.InitiatesDecompose:
        return [
          'Decompose Slows enemies by 30%.',
        ];
      case NecromancerSkill.Hemorrhage:
        return [
          'Generate Essence: 8',
          'Lucky Hit Chance: 35%',
          'Burst an enemy\'s blood, dealing ${25 + 3 * perLevel}% damage. Hemorrhage has a 20% chance to form a Blood Orb.',
        ];
      case NecromancerSkill.EnhancedHemorrhage:
        return [
          'After picking up a Blood Orb, your next Hemorrhage also deals damage to enemies around your target and grants 2 additional Essence per enemy hit.',
        ];
      case NecromancerSkill.AcolytesHemorrhage:
        return [
          'Hemorrhage gains an additional 20% Attack Speed while Healthy.',
        ];
      case NecromancerSkill.InitiatesHemorrhage:
        return [
          'Hemorrhage grants 1.6% Base Life as Fortify each time it hits an enemy, and has a 1.5% chance per enemy hit to Fortify you for 100% Base Life.',
        ];
      case NecromancerSkill.Reap:
        return [
          'Generate Essence: 4 per enemy hit',
          'Lucky Hit Chance: 17%',
          'Sweep an ethereal scythe in front of you, dealing ${12 + 1 * perLevel}% damage. Hitting an enemy with Reap increases your Damage Reduction by 15% for 2 seconds.',
        ];
      case NecromancerSkill.EnhancedReap:
        return [
          'If an enemy hit by Reap dies within 2 seconds, you gain 30% Attack Speed for 3 seconds.',
        ];
      case NecromancerSkill.AcolytesReap:
        return [
          'Reap forms a Corpse under the first enemy hit. Can only occur every 5 seconds.',
        ];
      case NecromancerSkill.InitiatesReap:
        return [
          'Reap instantly kills enemies below 5% Life. This does not work on Bosses or Players.',
        ];
      case NecromancerSkill.Blight:
        return [
          'Essence Cost: 25',
          'Lucky Hit Chance: 40%',
          'Unleash concentrated blight that deals ${30 + 3 * perLevel}% damage and leaves behind a defiled area, dealing ${80 + 8 * perLevel}% damage over 6 seconds.',
        ];
      case NecromancerSkill.EnhancedBlight:
        return [
          'Blight Slows enemies by 25%.',
        ];
      case NecromancerSkill.ParanormalBlight:
        return [
          'Blight has a 30% chance to Immobilize enemies for 1.5 seconds on impact.',
        ];
      case NecromancerSkill.SupernaturalBlight:
        return [
          'You and your Minions deal 15% increased damage to enemies within Blight.',
        ];
      case NecromancerSkill.BloodLance:
        return [
          'Essence Cost: 15',
          'Lucky Hit Chance: 33%',
          'Throw a blood lance that lingers in an enemy for 3 seconds, dealing ${68 + 6.5 * perLevel}% damage to the enemy and all other lanced enemies.',
        ];
      case NecromancerSkill.EnhancedBloodLance:
        return [
          'Blood Lance pierces through enemies who are currently lanced, dealing 15% reduced damage to subsequent enemies after the first.',
        ];
      case NecromancerSkill.ParanormalBloodLance:
        return [
          'While at least 2 enemies or a Boss are affected by Blood Lance, you gain 15% Attack Speed and Blood Lance\'s Essence cost is reduced by 3.',
        ];
      case NecromancerSkill.SupernaturalBloodLance:
        return [
          'After casting Blood Lance 8 times, your next cast of Blood Lance is guaranteed to Overpower and spawns a Blood Orb under the first enemy hit.',
        ];
      case NecromancerSkill.BloodSurge:
        return [
          'Essence Cost: 30',
          'Lucky Hit Chance: 12%',
          'Draw blood from enemies, dealing ${20 + 2 * perLevel}% damage, and expel a blood nova, dealing ${50 + 5 * perLevel}% damage. Blood Surge\'s nova damage is increased by 10% per enemy drained, up to 50%.',
        ];
      case NecromancerSkill.EnhancedBloodSurge:
        return [
          'Blood Surge Heals you for 2.5% of your Maximum Life when drawing blood from enemies. If 4 or more enemies are drawn from, then Heal for an additional 2.5% of your Maximum Life.',
        ];
      case NecromancerSkill.ParanormalBloodSurge:
        return [
          'If an enemy is damaged by Blood Surge\'s nova while you are Healthy, then gain 1 stack of Overwhelming Blood. When you have 5 stacks of Overwhelming Blood, your next Blood Surge Overpowers.',
        ];
      case NecromancerSkill.SupernaturalBloodSurge:
        return [
          'Each time an enemy is hit by Blood Surge\'s nova, you are Fortified for 1% Base Life. While you have Fortify for over 50% of your Maximum Life, Blood Surge deals 20% increased damage.',
        ];
      case NecromancerSkill.BoneSpear:
        return [
          'Essence Cost: 25',
          'Lucky Hit Chance: 50%',
          'Conjure a bone spear from the ground, dealing ${85 + 8.5 * perLevel}% damage and piercing through enemies.',
        ];
      case NecromancerSkill.EnhancedBoneSpear:
        return [
          'Bone Spear breaks into 3 shards when it is destroyed, dealing 25% damage each.',
        ];
      case NecromancerSkill.ParanormalBoneSpear:
        return [
          'Bone Spear has a 5% increased Critical Strike Chance. If Bone Spear\'s primary projectile Critically Strikes, it fires 2 additional bone shards upon being destroyed.',
        ];
      case NecromancerSkill.SupernaturalBoneSpear:
        return [
          'Bone Spear makes the first enemy hit Vulnerable for 3 seconds.',
        ];
      case NecromancerSkill.Sever:
        return [
          'Essence Cost: 20',
          'Lucky Hit Chance: 20%',
          'A specter of you charges forward and attacks with its scythe for ${63 + 6 * perLevel}% damage then returns to you and attacks again for ${21 + 2 * perLevel}% damage.',
        ];
      case NecromancerSkill.EnhancedSever:
        return [
          'Sever damages enemies along its path for 25% of its initial damage.',
        ];
      case NecromancerSkill.ParanormalSever:
        return [
          'Every 4th cast of Sever makes enemies Vulnerable for 2 seconds.',
        ];
      case NecromancerSkill.SupernaturalSever:
        return [
          'Sever deals 2% increased damage for each Minion you have upon cast.',
        ];
      case NecromancerSkill.UnlivingEnergy:
        return [
          'Your maximum Essence is increased by ${3 + 3 * perLevel}.',
        ];
      case NecromancerSkill.ImperfectlyBalanced:
        return [
          'Your Core Skills cost ${3 + 3 * perLevel}% more Essence, but deal ${5 + 5 * perLevel}% increased damage.',
        ];
      case NecromancerSkill.HewedFlesh:
        return [
          'Lucky Hit: Your damage has up to a ${4 + 4 * perLevel}% chance to create a Corpse at the target\'s location.',
          '',
          'This chance is doubled against Bosses.',
        ];
      case NecromancerSkill.BloodMist:
        return [
          'Cooldown: ${24 - 0.9 * perLevel} seconds',
          'Lucky Hit Chance: 9%',
          'Disperse into a bloody mist, becoming Immune for 3 seconds. Your Movement Speed is reduced by 20% and you periodically deal 2% damage to enemies and Heal for ${0.5 + 0.05 * perLevel}% of your Maximum Life.',
        ];
      case NecromancerSkill.EnhancedBloodMist:
        return [
          'Casting a Skill that Overpowers reduces the cooldown of Blood Mist by 2 seconds.',
        ];
      case NecromancerSkill.DreadfulBloodMist:
        return [
          'Blood Mist Fortifies you for 0.5% Base Life each time it hits an enemy.',
        ];
      case NecromancerSkill.GhastlyBloodMist:
        return [
          'Blood Mist leaves behind a Corpse every 1 second.',
        ];
      case NecromancerSkill.BonePrison:
        return [
          'Cooldown: ${20 - 1 * perLevel} seconds',
          'Unearth a prison of bone with ${96 + 96 * perLevel} Life that surrounds the target area for 6 seconds.',
        ];
      case NecromancerSkill.EnhancedBonePrison:
        return [
          'If an enemy is trapped by Bone Prison, gain 15 Essence, plus an additional 5 per enemy trapped.',
        ];
      case NecromancerSkill.DreadfulBonePrison:
        return [
          'Fortify for 5% Base Life for each enemy trapped by Bone Prison.',
        ];
      case NecromancerSkill.GhastlyBonePrison:
        return [
          'Enemies inside of Bone Prison are Vulnerable.',
        ];
      case NecromancerSkill.CorpseExplosion:
        return [
          'Lucky Hit Chance: 40%',
          'Detonate a Corpse, dealing ${50 + 5 * perLevel}% damage to surrounding enemies.',
        ];
      case NecromancerSkill.EnhancedCorpseExplosion:
        return [
          'Corpse Explosion\'s radius is increased by 15%.',
        ];
      case NecromancerSkill.BlightedCorpseExplosion:
        return [
          'Corpse Explosion becomes a Darkness Skill and, instead of exploding, releases a vile miasma dealing 110% Shadow damage over 6 seconds.',
        ];
      case NecromancerSkill.PlaguedCorpseExplosion:
        return [
          'Corpse Explosion deals 8% increased damage to enemies that are Slowed, Stunned or Vulnerable. These damage bonuses can stack.',
        ];
      case NecromancerSkill.GrimHarvest:
        return [
          'Consuming a Corpse generates ${3 + 3 * perLevel} Essence.',
        ];
      case NecromancerSkill.FueledByDeath:
        return [
          'You deal ${3 + 3 * perLevel}% increased damage for 6 seconds after consuming a Corpse.',
        ];
      case NecromancerSkill.SpikedArmor:
        return [
          'Gain ${26 + 25.5 * perLevel} Thorns.',
        ];
      case NecromancerSkill.SkeletalWarriorMastery:
        return [
          'Increase the damage and Life of your Skeletal Warriors by ${15 + 15 * perLevel}%.',
        ];
      case NecromancerSkill.Decrepify:
        return [
          'Essence Cost: 10',
          'Curse the target area. Enemies afflicted by Decrepify are Slowed by ${40 + 3 * perLevel}% and deal ${20 + 0.9 * perLevel}% less damage for 10 seconds.',
        ];
      case NecromancerSkill.EnhancedDecrepify:
        return [
          'Lucky Hit: Enemies hit while afflicted with Decrepify have up to a 10% chance to be Stunned for 2 seconds.',
        ];
      case NecromancerSkill.AbhorrentDecrepify:
        return [
          'Lucky Hit: Enemies hit while afficted with Decrepify have up to a 15% chance to reduce your active Cooldowns by 1 second.',
        ];
      case NecromancerSkill.HorridDecrepify:
        return [
          'When you or your Minions hit an enemy afflicted with Decrepify below 10% Life, they are instantly killed. Does not work on Bosses.',
        ];
      case NecromancerSkill.IronMaiden:
        return [
          'Essence Cost: 10',
          'Curse the target area. Enemies afflicted by Iron Maiden take ${10 + 1 * perLevel}% damage each time they deal direct damage. Lasts 10 seconds.',
        ];
      case NecromancerSkill.EnhancedIronMaiden:
        return [
          'Iron Maiden no longer costs Eccence. Instead, gain 5 Essence for each enemy Cursed. Does not work with enemies who are already Cursed with Iron Maiden.',
        ];
      case NecromancerSkill.AbhorrentIronMaiden:
        return [
          'Heal for 5% of your Maximum Life when an enemy dies while afflicted with Iron Maiden.',
        ];
      case NecromancerSkill.HorridIronMaiden:
        return [
          'When at least 3 enemies are afflicted by Iron Maiden, its damage is increased by 15%.',
        ];
      case NecromancerSkill.DeathsEmbrace:
        return [
          'Close enemies take ${2 + 2 * perLevel}% more damage from you and deal ${3 + 3 * perLevel}% less damage to you.',
        ];
      case NecromancerSkill.DeathsReach:
        return [
          'You deal ${4 + 4 * perLevel}% increased damage to Distant enemies.',
        ];
      case NecromancerSkill.AmplifyDamage:
        return [
          'You deal ${3 + 3 * perLevel}% increased damage to Cursed enemies.',
        ];
      case NecromancerSkill.SkeletalMageMastery:
        return [
          'Increase the damage and Life of your Skeletal Mages by ${20 + 20 * perLevel}%.',
        ];
      case NecromancerSkill.BoneSpirit:
        return [
          'Cooldown: 12 seconds',
          'Essence Cost: All Remaining Essence',
          'Lucky Hit Chance: 33%',
          'Consume all of your Essence to conjure a spirit of bone that seeks enemies. Upon reaching an enemy, the spirit explodes, dealing ${80 + 8 * perLevel}% damage to the target and all surrounding enemies. Damage is increased by 3% for each point of Essence spent casting Bone Spirit.',
        ];
      case NecromancerSkill.EnhancedBoneSpirit:
        return [
          'If Bone Spirit Critically Strikes, its Cooldown is reduced by 6 seconds. This effect can only happen once per cast.',
        ];
      case NecromancerSkill.DreadfulBoneSpirit:
        return [
          'After Bone Spirit hits an enemy, you generate 30 Essence over the next 4 seconds.',
        ];
      case NecromancerSkill.GhastlyBoneSpirit:
        return [
          'Bone Spirit has an additional 10% Critical Strike Chance.',
        ];
      case NecromancerSkill.CorpseTendrils:
        return [
          'Cooldown: ${11 - 0.55 * perLevel} seconds',
          'Lucky Hit Chance: 20%',
          'Veins burst out of a Corpse, Pulling in enemies, Stunning them for 3 seconds, and dealing ${20 + 2 * perLevel}% damage to them. Does not consume the Corpse.',
        ];
      case NecromancerSkill.EnhancedCorpseTendrils:
        return [
          'Enemies who are in range of Corpse Tendrils are Slowed by 50% before being Pulled.',
        ];
      case NecromancerSkill.BlightedCorpseTendrils:
        return [
          'Corpse Tendrils has a 30% chance to drop a Blood Orb when damaging enemies.',
        ];
      case NecromancerSkill.PlaguedCorpseTendrils:
        return [
          'Enemies damaged by Corpse Tendrils are made Vulnerable for 3 seconds.',
        ];
      case NecromancerSkill.GruesomeMending:
        return [
          'While below 50% Life, you receive ${10 + 10 * perLevel}% more Healing from all sources.',
        ];
      case NecromancerSkill.Transfusion:
        return [
          'Blood Orbs also Heal your Minions for ${15 + 15 * perLevel}% of the amount.',
        ];
      case NecromancerSkill.CoalescedBlood:
        return [
          'While Healthy your Blood Skills deal ${6 + 6 * perLevel}% increased damage.',
        ];
      case NecromancerSkill.TidesOfBlood:
        return [
          'Your Blood Skills deal ${5 + 5 * perLevel}% increased Overpower damage. This bonus is doubled while you are Healthy.',
        ];
      case NecromancerSkill.DrainVitality:
        return [
          'Lucky Hit: Hitting enemies with Blood Skills has up to a 25% chance to Fortify you for ${2 + 3 * perLevel}% Base Life.',
        ];
      case NecromancerSkill.Serration:
        return [
          'Your Bone Skills have a ${0.5 + 0.5 * perLevel}% increased Critical Strike Chance for each 10 Essence you have upon cast.',
        ];
      case NecromancerSkill.CompoundFracture:
        return [
          'After Critically Striking 10 times with Bone Skills, your Bone Skills deal ${5 + 5 * perLevel}% increased damage for 5 seconds.',
        ];
      case NecromancerSkill.RapidOssification:
        return [
          'Every 100 Essence you spend reduces the cooldowns of your Bone Skills by ${0.5 + 0.5 * perLevel} seconds.',
        ];
      case NecromancerSkill.Evulsion:
        return [
          'Your Bone Skills deal ${6 + 6 * perLevel}% increased Critical Strike Damage to Vulnerable enemies.',
        ];
      case NecromancerSkill.ReapersPursuit:
        return [
          'Damaging enemies with Darkness Skills increases your Movement Speed by ${5 + 5 * perLevel}% for 3 seconds.',
        ];
      case NecromancerSkill.Gloom:
        return [
          'When you damage enemies with Darkness Skills, they take ${2 + 2 * perLevel}% increased Shadow damage from you and your Minions for 2 seconds, stacking up to 3 times.',
        ];
      case NecromancerSkill.CripplingDarkness:
        s = perLevel > 0 ? 'seconds' : 'second';
        return [
          'Lucky Hit: Darkness Skills have up to a 15% chance to Stun for ${1 +
        1 * perLevel} $s',
        ];
      case NecromancerSkill.Terror:
        return [
          'Darkness Skills deal ${3 + 3 * perLevel}% bonus damage to enemies who are Slowed, and ${3 + 3 * perLevel}% bonus damage to enemies who are Stunned or Immobilized. These bonuses stack and apply to Shadow damage dealt by your Minions.',
        ];
      case NecromancerSkill.NecroticCarapace:
        return [
          'When a Corpse is formed from your Skills or your Minions, Fortify for ${2 + 2 * perLevel}% Base Life.',
        ];
      case NecromancerSkill.ArmyOfTheDead:
        return [
          'Cooldown: 90 seconds',
          'Lucky Hit Chance: 64%',
          'Call forth the deep buried dead. Volatile Skeletons emerge over the next 7 seconds that explode when around enemies, dealing 30% damage.',
        ];
      case NecromancerSkill.PrimeArmyOfTheDead:
        return [
          'When Army of the Dead\'s Volatile Skeletons explode, they have a 15% chance to leave behind a Corpse.',
        ];
      case NecromancerSkill.SupremeArmyOfTheDead:
        return [
          'Army of the Dead also raises your Skeletal Warriors and Skeletal Mages.',
        ];
      case NecromancerSkill.BloodWave:
        return [
          'Cooldown: 50 seconds',
          'Lucky Hit Chance: 20%',
          'Conjure a tidal wave of blood that deals 90% damage and Knocks Back enemies.',
        ];
      case NecromancerSkill.PrimeBloodWave:
        return [
          'Blood Wave Slows enemies by 50% for 4 seconds.',
        ];
      case NecromancerSkill.SupremeBloodWave:
        return [
          'Blood Wave leaves behind 3 Blood Orbs as it travels.',
        ];
      case NecromancerSkill.BoneStorm:
        return [
          'Cooldown: 60 seconds',
          'Lucky Hit Chance: 40%',
          'A swirling storm of bones appears around you and your Golem, dealing 180% damage to surrounding enemies over 10 seconds.',
        ];
      case NecromancerSkill.PrimeBoneStorm:
        return [
          'Your Damage Reduction is increased by 15% while Bone Storm is active.',
        ];
      case NecromancerSkill.SupremeBoneStorm:
        return [
          'Your Critical Strike Chance is increased by 20% while Bone Storm is active.',
        ];
      case NecromancerSkill.StandAlone:
        return [
          'Increases Damage Reduction by ${6 + 6 * perLevel}%, reduced by 2% for each active Minion.',
        ];
      case NecromancerSkill.MementoMori:
        return [
          'Sacrificing both Skeletal Warriors and Skeletal Mages increases their Sacrifice bonuses by ${20 + 20 * perLevel}%.',
        ];
      case NecromancerSkill.InspiringLeader:
        return [
          'After you have been Healthy for at least 4 seconds, you and your Minions gain ${4 + 4 * perLevel}% Attack Speed.',
        ];
      case NecromancerSkill.BondedInEssence:
        return [
          'Every 5 seconds, your Skeletal Priest\'s Healing will Heal your Skeletons for an additional ${20 + 20 * perLevel}% of their Maximum Life.',
        ];
      case NecromancerSkill.DeathsDefense:
        return [
          'Your Minions cannot lose more than ${75 - 15 * perLevel}% of their Maximum Life from a single damage instance.',
        ];
      case NecromancerSkill.HellbentCommander:
        return [
          'Your Minions deal ${10 + 10 * perLevel}% increased damage while you are Close to them.',
        ];
      case NecromancerSkill.GolemMastery:
        return [
          'Increase the damage and Life of your Golem by ${25 + 25 * perLevel}%.',
        ];
      case NecromancerSkill.OssifiedEssence:
        return [
          'Your Bone Skills deal 1% increased damage for each point of Essence you have above 50 upon cast.',
        ];
      case NecromancerSkill.RathmasVigor:
        return [
          'Increase your Maximum Life by 10%. After being Healthy for 15 seconds, your next Blood Skill Overpowers.',
        ];
      case NecromancerSkill.Shadowblight:
        return [
          'Shadow damage infects enemies with Shadowblight for 2 seconds. You and your Minions deal 10% bonus damage to enemies with Shadowblight.',
          '',
          'Every 10th time an enemy receives Shadow damage from you or your Minions while they are affected by Shadowblight, they take an additional 20% Shadow damage.',
        ];
      case NecromancerSkill.KalansEdict:
        return [
          'After you have not taken damage in the last 3 seconds, your Minions gain 15% Attack Speed. While you have at least 7 Minions, this bonus is doubled.',
        ];
    }
  }

  static NecromancerCluster clusterOf(NecromancerSkill necromancerSkill) {
    switch (necromancerSkill) {
      case NecromancerSkill.BoneSplinters:
      case NecromancerSkill.EnhancedBoneSplinters:
      case NecromancerSkill.AcolytesBoneSplinters:
      case NecromancerSkill.InitiatesBoneSplinters:
      case NecromancerSkill.Decompose:
      case NecromancerSkill.EnhancedDecompose:
      case NecromancerSkill.AcolytesDecompose:
      case NecromancerSkill.InitiatesDecompose:
      case NecromancerSkill.Hemorrhage:
      case NecromancerSkill.EnhancedHemorrhage:
      case NecromancerSkill.AcolytesHemorrhage:
      case NecromancerSkill.InitiatesHemorrhage:
      case NecromancerSkill.Reap:
      case NecromancerSkill.EnhancedReap:
      case NecromancerSkill.AcolytesReap:
      case NecromancerSkill.InitiatesReap:
        return NecromancerCluster.Basic;
      case NecromancerSkill.Blight:
      case NecromancerSkill.EnhancedBlight:
      case NecromancerSkill.ParanormalBlight:
      case NecromancerSkill.SupernaturalBlight:
      case NecromancerSkill.BloodLance:
      case NecromancerSkill.EnhancedBloodLance:
      case NecromancerSkill.ParanormalBloodLance:
      case NecromancerSkill.SupernaturalBloodLance:
      case NecromancerSkill.BloodSurge:
      case NecromancerSkill.EnhancedBloodSurge:
      case NecromancerSkill.ParanormalBloodSurge:
      case NecromancerSkill.SupernaturalBloodSurge:
      case NecromancerSkill.BoneSpear:
      case NecromancerSkill.EnhancedBoneSpear:
      case NecromancerSkill.ParanormalBoneSpear:
      case NecromancerSkill.SupernaturalBoneSpear:
      case NecromancerSkill.Sever:
      case NecromancerSkill.EnhancedSever:
      case NecromancerSkill.ParanormalSever:
      case NecromancerSkill.SupernaturalSever:
      case NecromancerSkill.UnlivingEnergy:
      case NecromancerSkill.ImperfectlyBalanced:
      case NecromancerSkill.HewedFlesh:
        return NecromancerCluster.Core;
      case NecromancerSkill.BloodMist:
      case NecromancerSkill.EnhancedBloodMist:
      case NecromancerSkill.DreadfulBloodMist:
      case NecromancerSkill.GhastlyBloodMist:
      case NecromancerSkill.BonePrison:
      case NecromancerSkill.EnhancedBonePrison:
      case NecromancerSkill.DreadfulBonePrison:
      case NecromancerSkill.GhastlyBonePrison:
      case NecromancerSkill.CorpseExplosion:
      case NecromancerSkill.EnhancedCorpseExplosion:
      case NecromancerSkill.BlightedCorpseExplosion:
      case NecromancerSkill.PlaguedCorpseExplosion:
      case NecromancerSkill.GrimHarvest:
      case NecromancerSkill.FueledByDeath:
      case NecromancerSkill.SpikedArmor:
      case NecromancerSkill.SkeletalWarriorMastery:
        return NecromancerCluster.FirstCorpseAndMacabre;
      case NecromancerSkill.Decrepify:
      case NecromancerSkill.EnhancedDecrepify:
      case NecromancerSkill.AbhorrentDecrepify:
      case NecromancerSkill.HorridDecrepify:
      case NecromancerSkill.IronMaiden:
      case NecromancerSkill.EnhancedIronMaiden:
      case NecromancerSkill.AbhorrentIronMaiden:
      case NecromancerSkill.HorridIronMaiden:
      case NecromancerSkill.DeathsEmbrace:
      case NecromancerSkill.DeathsReach:
      case NecromancerSkill.AmplifyDamage:
      case NecromancerSkill.SkeletalMageMastery:
        return NecromancerCluster.Curse;
      case NecromancerSkill.BoneSpirit:
      case NecromancerSkill.EnhancedBoneSpirit:
      case NecromancerSkill.DreadfulBoneSpirit:
      case NecromancerSkill.GhastlyBoneSpirit:
      case NecromancerSkill.CorpseTendrils:
      case NecromancerSkill.EnhancedCorpseTendrils:
      case NecromancerSkill.BlightedCorpseTendrils:
      case NecromancerSkill.PlaguedCorpseTendrils:
      case NecromancerSkill.GruesomeMending:
      case NecromancerSkill.Transfusion:
      case NecromancerSkill.CoalescedBlood:
      case NecromancerSkill.TidesOfBlood:
      case NecromancerSkill.DrainVitality:
      case NecromancerSkill.Serration:
      case NecromancerSkill.CompoundFracture:
      case NecromancerSkill.RapidOssification:
      case NecromancerSkill.Evulsion:
      case NecromancerSkill.ReapersPursuit:
      case NecromancerSkill.Gloom:
      case NecromancerSkill.CripplingDarkness:
      case NecromancerSkill.Terror:
      case NecromancerSkill.NecroticCarapace:
        return NecromancerCluster.SecondCorpseAndMacabre;
      case NecromancerSkill.ArmyOfTheDead:
      case NecromancerSkill.PrimeArmyOfTheDead:
      case NecromancerSkill.SupremeArmyOfTheDead:
      case NecromancerSkill.BloodWave:
      case NecromancerSkill.PrimeBloodWave:
      case NecromancerSkill.SupremeBloodWave:
      case NecromancerSkill.BoneStorm:
      case NecromancerSkill.PrimeBoneStorm:
      case NecromancerSkill.SupremeBoneStorm:
      case NecromancerSkill.StandAlone:
      case NecromancerSkill.MementoMori:
      case NecromancerSkill.InspiringLeader:
      case NecromancerSkill.BondedInEssence:
      case NecromancerSkill.DeathsDefense:
      case NecromancerSkill.HellbentCommander:
      case NecromancerSkill.GolemMastery:
        return NecromancerCluster.Ultimate;
      case NecromancerSkill.OssifiedEssence:
      case NecromancerSkill.RathmasVigor:
      case NecromancerSkill.Shadowblight:
      case NecromancerSkill.KalansEdict:
        return NecromancerCluster.KeyPassive;
      default:
        assert(false, 'case $necromancerSkill missing');
        return NecromancerCluster.Basic;
    }
  }

  static SkillType skillTypeOf(NecromancerSkill necromancerSkill) {
    switch (necromancerSkill) {
      case NecromancerSkill.BoneSplinters:
      case NecromancerSkill.Decompose:
      case NecromancerSkill.Hemorrhage:
      case NecromancerSkill.Reap:
      case NecromancerSkill.Blight:
      case NecromancerSkill.BloodLance:
      case NecromancerSkill.BloodSurge:
      case NecromancerSkill.BoneSpear:
      case NecromancerSkill.Sever:
      case NecromancerSkill.BloodMist:
      case NecromancerSkill.BonePrison:
      case NecromancerSkill.CorpseExplosion:
      case NecromancerSkill.Decrepify:
      case NecromancerSkill.IronMaiden:
      case NecromancerSkill.BoneSpirit:
      case NecromancerSkill.CorpseTendrils:
      case NecromancerSkill.ArmyOfTheDead:
      case NecromancerSkill.BloodWave:
      case NecromancerSkill.BoneStorm:
        return SkillType.Active;
      case NecromancerSkill.EnhancedBoneSplinters:
      case NecromancerSkill.EnhancedDecompose:
      case NecromancerSkill.EnhancedHemorrhage:
      case NecromancerSkill.EnhancedReap:
      case NecromancerSkill.EnhancedBlight:
      case NecromancerSkill.EnhancedBloodLance:
      case NecromancerSkill.EnhancedBloodSurge:
      case NecromancerSkill.EnhancedBoneSpear:
      case NecromancerSkill.EnhancedSever:
      case NecromancerSkill.EnhancedBloodMist:
      case NecromancerSkill.EnhancedBonePrison:
      case NecromancerSkill.EnhancedCorpseExplosion:
      case NecromancerSkill.EnhancedDecrepify:
      case NecromancerSkill.EnhancedIronMaiden:
      case NecromancerSkill.EnhancedBoneSpirit:
      case NecromancerSkill.EnhancedCorpseTendrils:
      case NecromancerSkill.PrimeArmyOfTheDead:
      case NecromancerSkill.PrimeBloodWave:
      case NecromancerSkill.PrimeBoneStorm:
        return SkillType.Enhancement;
      case NecromancerSkill.AcolytesBoneSplinters:
      case NecromancerSkill.InitiatesBoneSplinters:
      case NecromancerSkill.AcolytesDecompose:
      case NecromancerSkill.InitiatesDecompose:
      case NecromancerSkill.AcolytesHemorrhage:
      case NecromancerSkill.InitiatesHemorrhage:
      case NecromancerSkill.AcolytesReap:
      case NecromancerSkill.InitiatesReap:
      case NecromancerSkill.ParanormalBlight:
      case NecromancerSkill.SupernaturalBlight:
      case NecromancerSkill.ParanormalBloodLance:
      case NecromancerSkill.SupernaturalBloodLance:
      case NecromancerSkill.ParanormalBloodSurge:
      case NecromancerSkill.SupernaturalBloodSurge:
      case NecromancerSkill.ParanormalBoneSpear:
      case NecromancerSkill.SupernaturalBoneSpear:
      case NecromancerSkill.ParanormalSever:
      case NecromancerSkill.SupernaturalSever:
      case NecromancerSkill.DreadfulBloodMist:
      case NecromancerSkill.GhastlyBloodMist:
      case NecromancerSkill.DreadfulBonePrison:
      case NecromancerSkill.GhastlyBonePrison:
      case NecromancerSkill.BlightedCorpseExplosion:
      case NecromancerSkill.PlaguedCorpseExplosion:
      case NecromancerSkill.AbhorrentDecrepify:
      case NecromancerSkill.HorridDecrepify:
      case NecromancerSkill.AbhorrentIronMaiden:
      case NecromancerSkill.HorridIronMaiden:
      case NecromancerSkill.DreadfulBoneSpirit:
      case NecromancerSkill.GhastlyBoneSpirit:
      case NecromancerSkill.BlightedCorpseTendrils:
      case NecromancerSkill.PlaguedCorpseTendrils:
      case NecromancerSkill.SupremeArmyOfTheDead:
      case NecromancerSkill.SupremeBloodWave:
      case NecromancerSkill.SupremeBoneStorm:
        return SkillType.Upgrade;
      case NecromancerSkill.UnlivingEnergy:
      case NecromancerSkill.ImperfectlyBalanced:
      case NecromancerSkill.HewedFlesh:
      case NecromancerSkill.GrimHarvest:
      case NecromancerSkill.FueledByDeath:
      case NecromancerSkill.SpikedArmor:
      case NecromancerSkill.SkeletalWarriorMastery:
      case NecromancerSkill.DeathsEmbrace:
      case NecromancerSkill.DeathsReach:
      case NecromancerSkill.AmplifyDamage:
      case NecromancerSkill.SkeletalMageMastery:
      case NecromancerSkill.GruesomeMending:
      case NecromancerSkill.Transfusion:
      case NecromancerSkill.CoalescedBlood:
      case NecromancerSkill.TidesOfBlood:
      case NecromancerSkill.DrainVitality:
      case NecromancerSkill.Serration:
      case NecromancerSkill.CompoundFracture:
      case NecromancerSkill.RapidOssification:
      case NecromancerSkill.Evulsion:
      case NecromancerSkill.ReapersPursuit:
      case NecromancerSkill.Gloom:
      case NecromancerSkill.CripplingDarkness:
      case NecromancerSkill.Terror:
      case NecromancerSkill.NecroticCarapace:
      case NecromancerSkill.StandAlone:
      case NecromancerSkill.MementoMori:
      case NecromancerSkill.InspiringLeader:
      case NecromancerSkill.BondedInEssence:
      case NecromancerSkill.DeathsDefense:
      case NecromancerSkill.HellbentCommander:
      case NecromancerSkill.GolemMastery:
      case NecromancerSkill.OssifiedEssence:
      case NecromancerSkill.RathmasVigor:
      case NecromancerSkill.Shadowblight:
      case NecromancerSkill.KalansEdict:
        return SkillType.Passive;
    }
  }

  static Tree<Enum> get boneSplinters => _skillTree(
        NecromancerSkill.BoneSplinters,
        [
          _skillTree(
            NecromancerSkill.EnhancedBoneSplinters,
            [
              _skillTree(NecromancerSkill.AcolytesBoneSplinters, _childless),
              _skillTree(NecromancerSkill.InitiatesBoneSplinters, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get decompose => _skillTree(
        NecromancerSkill.Decompose,
        [
          _skillTree(
            NecromancerSkill.EnhancedDecompose,
            [
              _skillTree(NecromancerSkill.AcolytesDecompose, _childless),
              _skillTree(NecromancerSkill.InitiatesDecompose, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get hemorrhage => _skillTree(
        NecromancerSkill.Hemorrhage,
        [
          _skillTree(
            NecromancerSkill.EnhancedHemorrhage,
            [
              _skillTree(NecromancerSkill.AcolytesHemorrhage, _childless),
              _skillTree(NecromancerSkill.InitiatesHemorrhage, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get reap => _skillTree(
        NecromancerSkill.Reap,
        [
          _skillTree(
            NecromancerSkill.EnhancedReap,
            [
              _skillTree(NecromancerSkill.AcolytesReap, _childless),
              _skillTree(NecromancerSkill.InitiatesReap, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get blight => _skillTree(
        NecromancerSkill.Blight,
        [
          _skillTree(
            NecromancerSkill.EnhancedBlight,
            [
              _skillTree(NecromancerSkill.ParanormalBlight, _childless),
              _skillTree(NecromancerSkill.SupernaturalBlight, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get bloodLance => _skillTree(
        NecromancerSkill.BloodLance,
        [
          _skillTree(
            NecromancerSkill.EnhancedBloodLance,
            [
              _skillTree(NecromancerSkill.ParanormalBloodLance, _childless),
              _skillTree(NecromancerSkill.SupernaturalBloodLance, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get bloodSurge => _skillTree(
        NecromancerSkill.BloodSurge,
        [
          _skillTree(
            NecromancerSkill.EnhancedBloodSurge,
            [
              _skillTree(NecromancerSkill.ParanormalBloodSurge, _childless),
              _skillTree(NecromancerSkill.SupernaturalBloodSurge, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get boneSpear => _skillTree(
        NecromancerSkill.BoneSpear,
        [
          _skillTree(
            NecromancerSkill.EnhancedBoneSpear,
            [
              _skillTree(NecromancerSkill.ParanormalBoneSpear, _childless),
              _skillTree(NecromancerSkill.SupernaturalBoneSpear, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get sever => _skillTree(
        NecromancerSkill.Sever,
        [
          _skillTree(
            NecromancerSkill.EnhancedSever,
            [
              _skillTree(NecromancerSkill.ParanormalSever, _childless),
              _skillTree(NecromancerSkill.SupernaturalSever, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get unlivingEnergy => _skillTree(
        NecromancerSkill.UnlivingEnergy,
        [
          _skillTree(NecromancerSkill.ImperfectlyBalanced, _childless),
        ],
      );

  static Tree<Enum> get hewedFlesh =>
      _skillTree(NecromancerSkill.HewedFlesh, _childless);

  static Tree<Enum> get bloodMist => _skillTree(
        NecromancerSkill.BloodMist,
        [
          _skillTree(
            NecromancerSkill.EnhancedBloodMist,
            [
              _skillTree(NecromancerSkill.DreadfulBloodMist, _childless),
              _skillTree(NecromancerSkill.GhastlyBloodMist, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get bonePrison => _skillTree(
        NecromancerSkill.BonePrison,
        [
          _skillTree(
            NecromancerSkill.EnhancedBonePrison,
            [
              _skillTree(NecromancerSkill.DreadfulBonePrison, _childless),
              _skillTree(NecromancerSkill.GhastlyBonePrison, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get corpseExplosion => _skillTree(
        NecromancerSkill.CorpseExplosion,
        [
          _skillTree(
            NecromancerSkill.EnhancedCorpseExplosion,
            [
              _skillTree(NecromancerSkill.BlightedCorpseExplosion, _childless),
              _skillTree(NecromancerSkill.PlaguedCorpseExplosion, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get grimHarvest => _skillTree(
        NecromancerSkill.GrimHarvest,
        [
          _skillTree(NecromancerSkill.FueledByDeath, _childless),
        ],
      );

  static Tree<Enum> get spikedArmor =>
      _skillTree(NecromancerSkill.SpikedArmor, _childless);

  static Tree<Enum> get skeletalWarriorMastery =>
      _skillTree(NecromancerSkill.SkeletalWarriorMastery, _childless);

  static Tree<Enum> get decrepify => _skillTree(
        NecromancerSkill.Decrepify,
        [
          _skillTree(
            NecromancerSkill.EnhancedDecrepify,
            [
              _skillTree(NecromancerSkill.AbhorrentDecrepify, _childless),
              _skillTree(NecromancerSkill.HorridDecrepify, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get ironMaiden => _skillTree(
        NecromancerSkill.IronMaiden,
        [
          _skillTree(
            NecromancerSkill.EnhancedIronMaiden,
            [
              _skillTree(NecromancerSkill.AbhorrentIronMaiden, _childless),
              _skillTree(NecromancerSkill.HorridIronMaiden, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get deathsEmbrace =>
      _skillTree(NecromancerSkill.DeathsEmbrace, _childless);

  static Tree<Enum> get deathsReach =>
      _skillTree(NecromancerSkill.DeathsReach, _childless);

  static Tree<Enum> get amplifyDamage =>
      _skillTree(NecromancerSkill.AmplifyDamage, _childless);

  static Tree<Enum> get skeletalMageMastery =>
      _skillTree(NecromancerSkill.SkeletalMageMastery, _childless);

  static Tree<Enum> get boneSpirit => _skillTree(
        NecromancerSkill.BoneSpirit,
        [
          _skillTree(
            NecromancerSkill.EnhancedBoneSpirit,
            [
              _skillTree(NecromancerSkill.DreadfulBoneSpirit, _childless),
              _skillTree(NecromancerSkill.GhastlyBoneSpirit, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get corpseTendrils => _skillTree(
        NecromancerSkill.CorpseTendrils,
        [
          _skillTree(
            NecromancerSkill.EnhancedCorpseTendrils,
            [
              _skillTree(NecromancerSkill.BlightedCorpseTendrils, _childless),
              _skillTree(NecromancerSkill.PlaguedCorpseTendrils, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get gruesomeMending => _skillTree(
        NecromancerSkill.GruesomeMending,
        [
          _skillTree(
            NecromancerSkill.Transfusion,
            [
              _skillTree(NecromancerSkill.TidesOfBlood, _childless),
            ],
          ),
          _skillTree(
            NecromancerSkill.CoalescedBlood,
            [
              _skillTree(NecromancerSkill.TidesOfBlood, _childless),
              _skillTree(NecromancerSkill.DrainVitality, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get serration => _skillTree(
        NecromancerSkill.Serration,
        [
          _skillTree(
            NecromancerSkill.CompoundFracture,
            [
              _skillTree(NecromancerSkill.Evulsion, _childless),
            ],
          ),
          _skillTree(
            NecromancerSkill.RapidOssification,
            [
              _skillTree(NecromancerSkill.Evulsion, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get reapersPursuit => _skillTree(
        NecromancerSkill.ReapersPursuit,
        [
          _skillTree(
            NecromancerSkill.Gloom,
            [
              _skillTree(NecromancerSkill.Terror, _childless),
            ],
          ),
          _skillTree(
            NecromancerSkill.CripplingDarkness,
            [
              _skillTree(NecromancerSkill.Terror, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get necroticCarapace =>
      _skillTree(NecromancerSkill.NecroticCarapace, _childless);

  static Tree<Enum> get armyOfTheDead => _skillTree(
        NecromancerSkill.ArmyOfTheDead,
        [
          _skillTree(
            NecromancerSkill.PrimeArmyOfTheDead,
            [
              _skillTree(NecromancerSkill.SupremeArmyOfTheDead, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get bloodWave => _skillTree(
        NecromancerSkill.BloodWave,
        [
          _skillTree(
            NecromancerSkill.PrimeBloodWave,
            [
              _skillTree(NecromancerSkill.SupremeBloodWave, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get boneStorm => _skillTree(
        NecromancerSkill.BoneStorm,
        [
          _skillTree(
            NecromancerSkill.PrimeBoneStorm,
            [
              _skillTree(NecromancerSkill.SupremeBoneStorm, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get standAlone => _skillTree(
        NecromancerSkill.StandAlone,
        [
          _skillTree(NecromancerSkill.MementoMori, _childless),
        ],
      );

  static Tree<Enum> get inspiringLeader => _skillTree(
        NecromancerSkill.InspiringLeader,
        [
          _skillTree(NecromancerSkill.HellbentCommander, _childless),
          _skillTree(NecromancerSkill.DeathsDefense, _childless),
        ],
      );

  static Tree<Enum> get bondedInEssence => _skillTree(
        NecromancerSkill.BondedInEssence,
        [
          _skillTree(NecromancerSkill.DeathsDefense, _childless),
        ],
      );

  static Tree<Enum> get golemMastery =>
      _skillTree(NecromancerSkill.GolemMastery, _childless);

  static Tree<Enum> get ossifiedEssence =>
      _skillTree(NecromancerSkill.OssifiedEssence, _childless);

  static Tree<Enum> get rathmasVigor =>
      _skillTree(NecromancerSkill.RathmasVigor, _childless);

  static Tree<Enum> get shadowblight =>
      _skillTree(NecromancerSkill.Shadowblight, _childless);

  static Tree<Enum> get kalansEdict =>
      _skillTree(NecromancerSkill.KalansEdict, _childless);

  static Tree<Enum> get basic => _skillTree(
        NecromancerCluster.Basic,
        [
          boneSplinters,
          decompose,
          hemorrhage,
          reap,
        ],
      );

  static Tree<Enum> get core => _skillTree(
        NecromancerCluster.Core,
        [
          blight,
          bloodLance,
          bloodSurge,
          boneSpear,
          sever,
          unlivingEnergy,
          hewedFlesh,
        ],
      );

  static Tree<Enum> get firstCorpseAndMacabre => _skillTree(
        NecromancerCluster.FirstCorpseAndMacabre,
        [
          bloodMist,
          bonePrison,
          corpseExplosion,
          grimHarvest,
          spikedArmor,
          skeletalWarriorMastery,
        ],
      );

  static Tree<Enum> get curse => _skillTree(
        NecromancerCluster.Curse,
        [
          decrepify,
          ironMaiden,
          deathsEmbrace,
          deathsReach,
          amplifyDamage,
          skeletalMageMastery,
        ],
      );

  static Tree<Enum> get secondCorpseAndMacabre => _skillTree(
        NecromancerCluster.SecondCorpseAndMacabre,
        [
          boneSpirit,
          corpseTendrils,
          gruesomeMending,
          serration,
          reapersPursuit,
          necroticCarapace,
        ],
      );

  static Tree<Enum> get ultimate => _skillTree(
        NecromancerCluster.Ultimate,
        [
          armyOfTheDead,
          bloodWave,
          boneStorm,
          standAlone,
          inspiringLeader,
          bondedInEssence,
          golemMastery,
        ],
      );

  static Tree<Enum> get keyPassive => _skillTree(
        NecromancerCluster.KeyPassive,
        [
          ossifiedEssence,
          rathmasVigor,
          shadowblight,
          kalansEdict,
        ],
      );

  static Tree<Enum> get necromancer => _skillTree(
        Hero.Necromancer,
        [
          basic,
          core,
          firstCorpseAndMacabre,
          curse,
          secondCorpseAndMacabre,
          ultimate,
          keyPassive,
        ],
      );
}
