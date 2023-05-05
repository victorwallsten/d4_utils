import 'package:d4_utils/src/heroes/barbarian.dart';
import 'package:d4_utils/src/heroes/druid.dart';
import 'package:d4_utils/src/heroes/necromancer.dart';
import 'package:d4_utils/src/heroes/rogue.dart';
import 'package:d4_utils/src/heroes/sorcerer.dart';
import 'package:d4_utils/src/data_structures/skill.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/barbarian_cluster.dart';
import 'package:d4_utils/src/enums/barbarian_skill.dart';
import 'package:d4_utils/src/enums/druid_cluster.dart';
import 'package:d4_utils/src/enums/druid_skill.dart';
import 'package:d4_utils/src/enums/necromancer_cluster.dart';
import 'package:d4_utils/src/enums/necromancer_skill.dart';
import 'package:d4_utils/src/enums/rogue_cluster.dart';
import 'package:d4_utils/src/enums/rogue_skill.dart';
import 'package:d4_utils/src/enums/skill_type.dart';
import 'package:d4_utils/src/enums/sorcerer_cluster.dart';
import 'package:d4_utils/src/enums/sorcerer_skill.dart';
import 'package:d4_utils/src/utils/enum_utils.dart';
import 'package:d4_utils/src/widgets/allocation_widget.dart';
import 'package:flutter/material.dart';

class SkillWidget extends StatelessWidget {
  const SkillWidget({
    super.key,
    required this.parent,
    required this.isClusterUnlocked,
    required this.isClusterDecrementable,
    required this.skillTree,
    required this.skillMap,
    required this.incrementCallback,
    required this.decrementCallback,
  });

  final Enum parent;
  final bool isClusterUnlocked;
  final bool isClusterDecrementable;
  final Tree<Enum> skillTree;
  final Map<Enum, Skill> skillMap;
  final Function(Enum) incrementCallback;
  final Function(Enum) decrementCallback;

  Enum _clusterOf(Enum e) {
    if (e is BarbarianSkill) {
      return Barbarian.clusterOf(e);
    } else if (e is DruidSkill) {
      return Druid.clusterOf(e);
    } else if (e is NecromancerSkill) {
      return Necromancer.clusterOf(e);
    } else if (e is RogueSkill) {
      return Rogue.clusterOf(e);
    } else if (e is SorcererSkill) {
      return Sorcerer.clusterOf(e);
    } else {
      assert(false, 'cluster of $e missing');
      return BarbarianCluster.Basic;
    }
  }

  SkillType _skillTypeOf(Enum e) {
    if (e is BarbarianSkill) {
      return Barbarian.skillTypeOf(e);
    } else if (e is DruidSkill) {
      return Druid.skillTypeOf(e);
    } else if (e is NecromancerSkill) {
      return Necromancer.skillTypeOf(e);
    } else if (e is RogueSkill) {
      return Rogue.skillTypeOf(e);
    } else if (e is SorcererSkill) {
      return Sorcerer.skillTypeOf(e);
    } else {
      assert(false, 'skillType of $e missing');
      return SkillType.Active;
    }
  }

  int _maxAssignedOf(Enum e) {
    SkillType skillType = _skillTypeOf(e);
    Enum cluster = _clusterOf(e);

    switch (cluster) {
      case BarbarianCluster.Ultimate:
      case BarbarianCluster.KeyPassive:
      case DruidCluster.Ultimate:
      case DruidCluster.KeyPassive:
      case NecromancerCluster.Ultimate:
      case NecromancerCluster.KeyPassive:
      case RogueCluster.Ultimate:
      case RogueCluster.KeyPassive:
      case SorcererCluster.Ultimate:
      case SorcererCluster.KeyPassive:
        return 1;
    }

    switch (skillType) {
      case SkillType.Active:
        return 5;
      case SkillType.Passive:
        return 3;
      case SkillType.Enhancement:
      case SkillType.Upgrade:
        return 1;
    }
  }

  bool _isNotCluster(Enum e) => !(e is BarbarianCluster ||
      e is DruidCluster ||
      e is NecromancerCluster ||
      e is RogueCluster ||
      e is SorcererCluster);

  bool get _isUnique {
    switch (skillTree.element) {
      /* Upgrade */
      case BarbarianSkill.BattleBash:
        return (skillMap[BarbarianSkill.CombatBash]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.CombatBash:
        return (skillMap[BarbarianSkill.BattleBash]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.BattleFlay:
        return (skillMap[BarbarianSkill.CombatFlay]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.CombatFlay:
        return (skillMap[BarbarianSkill.BattleFlay]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.BattleFrenzy:
        return (skillMap[BarbarianSkill.CombatFrenzy]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.CombatFrenzy:
        return (skillMap[BarbarianSkill.BattleFrenzy]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.BattleLungingStrike:
        return (skillMap[BarbarianSkill.CombatLungingStrike]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.CombatLungingStrike:
        return (skillMap[BarbarianSkill.BattleLungingStrike]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FuriousDoubleSwing:
        return (skillMap[BarbarianSkill.ViolentDoubleSwing]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.ViolentDoubleSwing:
        return (skillMap[BarbarianSkill.FuriousDoubleSwing]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FuriousHammerOfTheAncients:
        return (skillMap[BarbarianSkill.ViolentHammerOfTheAncients]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.ViolentHammerOfTheAncients:
        return (skillMap[BarbarianSkill.FuriousHammerOfTheAncients]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FuriousRend:
        return (skillMap[BarbarianSkill.ViolentRend]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.ViolentRend:
        return (skillMap[BarbarianSkill.FuriousRend]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.FuriousUpheaval:
        return (skillMap[BarbarianSkill.ViolentUpheaval]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.ViolentUpheaval:
        return (skillMap[BarbarianSkill.FuriousUpheaval]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FuriousWhirlwind:
        return (skillMap[BarbarianSkill.ViolentWhirlwind]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.ViolentWhirlwind:
        return (skillMap[BarbarianSkill.FuriousWhirlwind]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.StrategicChallengingShout:
        return (skillMap[BarbarianSkill.TacticalChallengingShout]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.TacticalChallengingShout:
        return (skillMap[BarbarianSkill.StrategicChallengingShout]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.StrategicGroundStomp:
        return (skillMap[BarbarianSkill.TacticalGroundStomp]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.TacticalGroundStomp:
        return (skillMap[BarbarianSkill.StrategicGroundStomp]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.StrategicIronSkin:
        return (skillMap[BarbarianSkill.TacticalIronSkin]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.TacticalIronSkin:
        return (skillMap[BarbarianSkill.StrategicIronSkin]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.StrategicRallyingCry:
        return (skillMap[BarbarianSkill.TacticalRallyingCry]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.TacticalRallyingCry:
        return (skillMap[BarbarianSkill.StrategicRallyingCry]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.MightyCharge:
        return (skillMap[BarbarianSkill.PowerCharge]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.PowerCharge:
        return (skillMap[BarbarianSkill.MightyCharge]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.MightyKick:
        return (skillMap[BarbarianSkill.PowerKick]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.PowerKick:
        return (skillMap[BarbarianSkill.MightyKick]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.MightyLeap:
        return (skillMap[BarbarianSkill.PowerLeap]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.PowerLeap:
        return (skillMap[BarbarianSkill.MightyLeap]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.MightyWarCry:
        return (skillMap[BarbarianSkill.PowerWarCry]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.PowerWarCry:
        return (skillMap[BarbarianSkill.MightyWarCry]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FightersDeathBlow:
        return (skillMap[BarbarianSkill.WarriorsDeathBlow]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.WarriorsDeathBlow:
        return (skillMap[BarbarianSkill.FightersDeathBlow]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FightersRupture:
        return (skillMap[BarbarianSkill.WarriorsRupture]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.WarriorsRupture:
        return (skillMap[BarbarianSkill.FightersRupture]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FightersSteelGrasp:
        return (skillMap[BarbarianSkill.WarriorsSteelGrasp]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.WarriorsSteelGrasp:
        return (skillMap[BarbarianSkill.FightersSteelGrasp]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FierceMaul:
        return (skillMap[DruidSkill.WildMaul]?.assignedSkillPoints ?? 0) == 0;
      case DruidSkill.WildMaul:
        return (skillMap[DruidSkill.FierceMaul]?.assignedSkillPoints ?? 0) == 0;
      case DruidSkill.FierceClaw:
        return (skillMap[DruidSkill.WildClaw]?.assignedSkillPoints ?? 0) == 0;
      case DruidSkill.WildClaw:
        return (skillMap[DruidSkill.FierceClaw]?.assignedSkillPoints ?? 0) == 0;
      case DruidSkill.FierceStormStrike:
        return (skillMap[DruidSkill.WildStormStrike]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.WildStormStrike:
        return (skillMap[DruidSkill.FierceStormStrike]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FierceWindShear:
        return (skillMap[DruidSkill.WildWindShear]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.WildWindShear:
        return (skillMap[DruidSkill.FierceWindShear]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.FierceEarthSpike:
        return (skillMap[DruidSkill.WildEarthSpike]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.WildEarthSpike:
        return (skillMap[DruidSkill.FierceEarthSpike]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PrimalLightningStorm:
        return (skillMap[DruidSkill.RagingLightningStorm]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.RagingLightningStorm:
        return (skillMap[DruidSkill.PrimalLightningStorm]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PrimalTornado:
        return (skillMap[DruidSkill.RagingTornado]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.RagingTornado:
        return (skillMap[DruidSkill.PrimalTornado]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.PrimalPulverize:
        return (skillMap[DruidSkill.RagingPulverize]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.RagingPulverize:
        return (skillMap[DruidSkill.PrimalPulverize]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.PrimalShred:
        return (skillMap[DruidSkill.RagingShred]?.assignedSkillPoints ?? 0) == 0;
      case DruidSkill.RagingShred:
        return (skillMap[DruidSkill.PrimalShred]?.assignedSkillPoints ?? 0) == 0;
      case DruidSkill.PrimalLandSlide:
        return (skillMap[DruidSkill.RagingLandSlide]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.RagingLandSlide:
        return (skillMap[DruidSkill.PrimalLandSlide]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.InnateEarthenBulwark:
        return (skillMap[DruidSkill.PreservingEarthenBulwark]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PreservingEarthenBulwark:
        return (skillMap[DruidSkill.InnateEarthenBulwark]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.InnateCycloneArmor:
        return (skillMap[DruidSkill.PreservingCycloneArmor]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PreservingCycloneArmor:
        return (skillMap[DruidSkill.InnateCycloneArmor]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.InnateBloodHowl:
        return (skillMap[DruidSkill.PreservingBloodHowl]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PreservingBloodHowl:
        return (skillMap[DruidSkill.InnateBloodHowl]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.InnateDebilitatingRoar:
        return (skillMap[DruidSkill.PreservingDebilitatingRoar]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PreservingDebilitatingRoar:
        return (skillMap[DruidSkill.InnateDebilitatingRoar]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.BrutalWolves:
        return (skillMap[DruidSkill.FerociousWolves]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.FerociousWolves:
        return (skillMap[DruidSkill.BrutalWolves]?.assignedSkillPoints ?? 0) == 0;
      case DruidSkill.BrutalRavens:
        return (skillMap[DruidSkill.FerociousRavens]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.FerociousRavens:
        return (skillMap[DruidSkill.BrutalRavens]?.assignedSkillPoints ?? 0) == 0;
      case DruidSkill.BrutalVineCreeper:
        return (skillMap[DruidSkill.FerociousVineCreeper]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FerociousVineCreeper:
        return (skillMap[DruidSkill.BrutalVineCreeper]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.NaturalBoulder:
        return (skillMap[DruidSkill.SavageBoulder]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.SavageBoulder:
        return (skillMap[DruidSkill.NaturalBoulder]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.NaturalTrample:
        return (skillMap[DruidSkill.SavageTrample]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.SavageTrample:
        return (skillMap[DruidSkill.NaturalTrample]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.NaturalHurricane:
        return (skillMap[DruidSkill.SavageHurricane]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.SavageHurricane:
        return (skillMap[DruidSkill.NaturalHurricane]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.NaturalRabies:
        return (skillMap[DruidSkill.SavageRabies]?.assignedSkillPoints ?? 0) == 0;
      case DruidSkill.SavageRabies:
        return (skillMap[DruidSkill.NaturalRabies]?.assignedSkillPoints ?? 0) ==
            0;
      case NecromancerSkill.AcolytesBoneSplinters:
        return (skillMap[NecromancerSkill.InitiatesBoneSplinters]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.InitiatesBoneSplinters:
        return (skillMap[NecromancerSkill.AcolytesBoneSplinters]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.AcolytesDecompose:
        return (skillMap[NecromancerSkill.InitiatesDecompose]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.InitiatesDecompose:
        return (skillMap[NecromancerSkill.AcolytesDecompose]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.AcolytesHemorrhage:
        return (skillMap[NecromancerSkill.InitiatesHemorrhage]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.InitiatesHemorrhage:
        return (skillMap[NecromancerSkill.AcolytesHemorrhage]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.AcolytesReap:
        return (skillMap[NecromancerSkill.InitiatesReap]?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.InitiatesReap:
        return (skillMap[NecromancerSkill.AcolytesReap]?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.ParanormalBlight:
        return (skillMap[NecromancerSkill.SupernaturalBlight]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.SupernaturalBlight:
        return (skillMap[NecromancerSkill.ParanormalBlight]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.ParanormalBloodLance:
        return (skillMap[NecromancerSkill.SupernaturalBloodLance]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.SupernaturalBloodLance:
        return (skillMap[NecromancerSkill.ParanormalBloodLance]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.ParanormalBloodSurge:
        return (skillMap[NecromancerSkill.SupernaturalBloodSurge]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.SupernaturalBloodSurge:
        return (skillMap[NecromancerSkill.ParanormalBloodSurge]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.ParanormalBoneSpear:
        return (skillMap[NecromancerSkill.SupernaturalBoneSpear]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.SupernaturalBoneSpear:
        return (skillMap[NecromancerSkill.ParanormalBoneSpear]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.ParanormalSever:
        return (skillMap[NecromancerSkill.SupernaturalSever]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.SupernaturalSever:
        return (skillMap[NecromancerSkill.ParanormalSever]?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.DreadfulBloodMist:
        return (skillMap[NecromancerSkill.GhastlyBloodMist]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.GhastlyBloodMist:
        return (skillMap[NecromancerSkill.DreadfulBloodMist]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.DreadfulBonePrison:
        return (skillMap[NecromancerSkill.GhastlyBonePrison]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.GhastlyBonePrison:
        return (skillMap[NecromancerSkill.DreadfulBonePrison]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.BlightedCorpseExplosion:
        return (skillMap[NecromancerSkill.PlaguedCorpseExplosion]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.PlaguedCorpseExplosion:
        return (skillMap[NecromancerSkill.BlightedCorpseExplosion]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.AbhorrentDecrepify:
        return (skillMap[NecromancerSkill.HorridDecrepify]?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.HorridDecrepify:
        return (skillMap[NecromancerSkill.AbhorrentDecrepify]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.AbhorrentIronMaiden:
        return (skillMap[NecromancerSkill.HorridIronMaiden]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.HorridIronMaiden:
        return (skillMap[NecromancerSkill.AbhorrentIronMaiden]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.DreadfulBoneSpirit:
        return (skillMap[NecromancerSkill.GhastlyBoneSpirit]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.GhastlyBoneSpirit:
        return (skillMap[NecromancerSkill.DreadfulBoneSpirit]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.BlightedCorpseTendrils:
        return (skillMap[NecromancerSkill.PlaguedCorpseTendrils]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.PlaguedCorpseTendrils:
        return (skillMap[NecromancerSkill.BlightedCorpseTendrils]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.FundamentalBladeShift:
        return (skillMap[RogueSkill.PrimaryBladeShift]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.PrimaryBladeShift:
        return (skillMap[RogueSkill.FundamentalBladeShift]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.FundamentalForcefulArrow:
        return (skillMap[RogueSkill.PrimaryForcefulArrow]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.PrimaryForcefulArrow:
        return (skillMap[RogueSkill.FundamentalForcefulArrow]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.FundamentalHeartseeker:
        return (skillMap[RogueSkill.PrimaryHeartseeker]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.PrimaryHeartseeker:
        return (skillMap[RogueSkill.FundamentalHeartseeker]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.FundamentalInvigoratingStrike:
        return (skillMap[RogueSkill.PrimaryInvigoratingStrike]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.PrimaryInvigoratingStrike:
        return (skillMap[RogueSkill.FundamentalInvigoratingStrike]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.FundamentalPuncture:
        return (skillMap[RogueSkill.PrimaryPuncture]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.PrimaryPuncture:
        return (skillMap[RogueSkill.FundamentalPuncture]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.AdvancedBarrage:
        return (skillMap[RogueSkill.ImprovedBarrage]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.ImprovedBarrage:
        return (skillMap[RogueSkill.AdvancedBarrage]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.AdvancedFlurry:
        return (skillMap[RogueSkill.ImprovedFlurry]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.ImprovedFlurry:
        return (skillMap[RogueSkill.AdvancedFlurry]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.AdvancedPenetratingShot:
        return (skillMap[RogueSkill.ImprovedPenetratingShot]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.ImprovedPenetratingShot:
        return (skillMap[RogueSkill.AdvancedPenetratingShot]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.AdvancedRapidFire:
        return (skillMap[RogueSkill.ImprovedRapidFire]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.ImprovedRapidFire:
        return (skillMap[RogueSkill.AdvancedRapidFire]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.AdvancedTwistingBlades:
        return (skillMap[RogueSkill.ImprovedTwistingBlades]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.ImprovedTwistingBlades:
        return (skillMap[RogueSkill.AdvancedTwistingBlades]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.DisciplinedCaltrops:
        return (skillMap[RogueSkill.MethodicalCaltrops]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.MethodicalCaltrops:
        return (skillMap[RogueSkill.DisciplinedCaltrops]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.DisciplinedDash:
        return (skillMap[RogueSkill.MethodicalDash]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.MethodicalDash:
        return (skillMap[RogueSkill.DisciplinedDash]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.DisciplinedShadowStep:
        return (skillMap[RogueSkill.MethodicalShadowStep]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.MethodicalShadowStep:
        return (skillMap[RogueSkill.DisciplinedShadowStep]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.CounteringConcealment:
        return (skillMap[RogueSkill.SubvertingConcealment]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.SubvertingConcealment:
        return (skillMap[RogueSkill.CounteringConcealment]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.CounteringDarkShroud:
        return (skillMap[RogueSkill.SubvertingDarkShroud]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.SubvertingDarkShroud:
        return (skillMap[RogueSkill.CounteringDarkShroud]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.CounteringPoisonTrap:
        return (skillMap[RogueSkill.SubvertingPoisonTrap]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.SubvertingPoisonTrap:
        return (skillMap[RogueSkill.CounteringPoisonTrap]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.CounteringSmokeGrenade:
        return (skillMap[RogueSkill.SubvertingSmokeGrenade]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.SubvertingSmokeGrenade:
        return (skillMap[RogueSkill.CounteringSmokeGrenade]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.BlendedColdImbuement:
        return (skillMap[RogueSkill.MixedColdImbuement]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.MixedColdImbuement:
        return (skillMap[RogueSkill.BlendedColdImbuement]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.BlendedPoisonImbuement:
        return (skillMap[RogueSkill.MixedPoisonImbuement]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.MixedPoisonImbuement:
        return (skillMap[RogueSkill.BlendedPoisonImbuement]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.BlendedShadowImbuement:
        return (skillMap[RogueSkill.MixedShadowImbuement]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.MixedShadowImbuement:
        return (skillMap[RogueSkill.BlendedShadowImbuement]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.FlickeringSpark:
        return (skillMap[SorcererSkill.GlintingSpark]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GlintingSpark:
        return (skillMap[SorcererSkill.FlickeringSpark]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.FlickeringFrostBolt:
        return (skillMap[SorcererSkill.GlintingFrostBolt]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GlintingFrostBolt:
        return (skillMap[SorcererSkill.FlickeringFrostBolt]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.FlickeringFireBolt:
        return (skillMap[SorcererSkill.GlintingFireBolt]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GlintingFireBolt:
        return (skillMap[SorcererSkill.FlickeringFireBolt]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.FlickeringArcLash:
        return (skillMap[SorcererSkill.GlintingArcLash]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GlintingArcLash:
        return (skillMap[SorcererSkill.FlickeringArcLash]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveChainLightning:
        return (skillMap[SorcererSkill.GreaterChainLightning]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterChainLightning:
        return (skillMap[SorcererSkill.DestructiveChainLightning]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveChargedBolts:
        return (skillMap[SorcererSkill.GreaterChargedBolts]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterChargedBolts:
        return (skillMap[SorcererSkill.DestructiveChargedBolts]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveFireball:
        return (skillMap[SorcererSkill.GreaterFireball]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterFireball:
        return (skillMap[SorcererSkill.DestructiveFireball]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveFrozenOrb:
        return (skillMap[SorcererSkill.GreaterFrozenOrb]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterFrozenOrb:
        return (skillMap[SorcererSkill.DestructiveFrozenOrb]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveIncinerate:
        return (skillMap[SorcererSkill.GreaterIncinerate]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterIncinerate:
        return (skillMap[SorcererSkill.DestructiveIncinerate]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveIceShards:
        return (skillMap[SorcererSkill.GreaterIceShards]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterIceShards:
        return (skillMap[SorcererSkill.DestructiveIceShards]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MysticalFlameShield:
        return (skillMap[SorcererSkill.ShimmeringFlameShield]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.ShimmeringFlameShield:
        return (skillMap[SorcererSkill.MysticalFlameShield]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MysticalIceArmor:
        return (skillMap[SorcererSkill.ShimmeringIceArmor]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.ShimmeringIceArmor:
        return (skillMap[SorcererSkill.MysticalIceArmor]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MysticalTeleport:
        return (skillMap[SorcererSkill.ShimmeringTeleport]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.ShimmeringTeleport:
        return (skillMap[SorcererSkill.MysticalTeleport]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MysticalFrostNova:
        return (skillMap[SorcererSkill.ShimmeringFrostNova]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.ShimmeringFrostNova:
        return (skillMap[SorcererSkill.MysticalFrostNova]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.InvokedHydra:
        return (skillMap[SorcererSkill.SummonedHydra]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.SummonedHydra:
        return (skillMap[SorcererSkill.InvokedHydra]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.InvokedIceBlades:
        return (skillMap[SorcererSkill.SummonedIceBlades]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.SummonedIceBlades:
        return (skillMap[SorcererSkill.InvokedIceBlades]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.InvokedLightningSpear:
        return (skillMap[SorcererSkill.SummonedLightningSpear]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.SummonedLightningSpear:
        return (skillMap[SorcererSkill.InvokedLightningSpear]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MagesBlizzard:
        return (skillMap[SorcererSkill.WizardsBlizzard]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.WizardsBlizzard:
        return (skillMap[SorcererSkill.MagesBlizzard]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MagesFirewall:
        return (skillMap[SorcererSkill.WizardsFirewall]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.WizardsFirewall:
        return (skillMap[SorcererSkill.MagesFirewall]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MagesMeteor:
        return (skillMap[SorcererSkill.WizardsMeteor]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.WizardsMeteor:
        return (skillMap[SorcererSkill.MagesMeteor]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.MagesBallLightning:
        return (skillMap[SorcererSkill.WizardsBallLightning]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.WizardsBallLightning:
        return (skillMap[SorcererSkill.MagesBallLightning]?.assignedSkillPoints ??
                0) ==
            0;

      /* Ultimate */
      case BarbarianSkill.CallOfTheAncients:
        return (skillMap[BarbarianSkill.IronMaelstrom]?.assignedSkillPoints ??
                    0) +
                (skillMap[BarbarianSkill.WrathOfTheBerserker]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case BarbarianSkill.IronMaelstrom:
        return (skillMap[BarbarianSkill.CallOfTheAncients]?.assignedSkillPoints ??
                    0) +
                (skillMap[BarbarianSkill.WrathOfTheBerserker]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case BarbarianSkill.WrathOfTheBerserker:
        return (skillMap[BarbarianSkill.CallOfTheAncients]?.assignedSkillPoints ??
                    0) +
                (skillMap[BarbarianSkill.IronMaelstrom]?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.GrizzlyRage:
        return (skillMap[DruidSkill.Petrify]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.Lacerate]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.Cataclysm]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.Petrify:
        return (skillMap[DruidSkill.GrizzlyRage]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.Lacerate]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.Cataclysm]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.Lacerate:
        return (skillMap[DruidSkill.GrizzlyRage]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.Petrify]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.Cataclysm]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.Cataclysm:
        return (skillMap[DruidSkill.GrizzlyRage]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.Petrify]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.Lacerate]?.assignedSkillPoints ?? 0) ==
            0;
      case NecromancerSkill.ArmyOfTheDead:
        return (skillMap[NecromancerSkill.BloodWave]?.assignedSkillPoints ?? 0) +
                (skillMap[NecromancerSkill.BoneStorm]?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.BloodWave:
        return (skillMap[NecromancerSkill.ArmyOfTheDead]?.assignedSkillPoints ??
                    0) +
                (skillMap[NecromancerSkill.BoneStorm]?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.BoneStorm:
        return (skillMap[NecromancerSkill.ArmyOfTheDead]?.assignedSkillPoints ??
                    0) +
                (skillMap[NecromancerSkill.BloodWave]?.assignedSkillPoints ??
                    0) ==
            0;
      case RogueSkill.DeathTrap:
        return (skillMap[RogueSkill.RainOfArrows]?.assignedSkillPoints ?? 0) +
                (skillMap[RogueSkill.ShadowClone]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.RainOfArrows:
        return (skillMap[RogueSkill.DeathTrap]?.assignedSkillPoints ?? 0) +
                (skillMap[RogueSkill.ShadowClone]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.ShadowClone:
        return (skillMap[RogueSkill.DeathTrap]?.assignedSkillPoints ?? 0) +
                (skillMap[RogueSkill.RainOfArrows]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.DeepFreeze:
        return (skillMap[SorcererSkill.Inferno]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.UnstableCurrents]?.assignedSkillPoints ??
                    0) ==
            0;
      case SorcererSkill.Inferno:
        return (skillMap[SorcererSkill.DeepFreeze]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.UnstableCurrents]?.assignedSkillPoints ??
                    0) ==
            0;
      case SorcererSkill.UnstableCurrents:
        return (skillMap[SorcererSkill.DeepFreeze]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.Inferno]?.assignedSkillPoints ?? 0) ==
            0;

      /* Key Passive */
      case BarbarianSkill.Unconstrained:
        return (skillMap[
                            BarbarianSkill.WalkingArsenal]
                        ?.assignedSkillPoints ??
                    0) +
                (skillMap[BarbarianSkill.UnbridledRage]?.assignedSkillPoints ??
                    0) +
                (skillMap[BarbarianSkill.GushingWounds]?.assignedSkillPoints ??
                    0) ==
            0;
      case BarbarianSkill.WalkingArsenal:
        return (skillMap[BarbarianSkill.Unconstrained]?.assignedSkillPoints ??
                    0) +
                (skillMap[BarbarianSkill.UnbridledRage]?.assignedSkillPoints ??
                    0) +
                (skillMap[BarbarianSkill.GushingWounds]?.assignedSkillPoints ??
                    0) ==
            0;
      case BarbarianSkill.UnbridledRage:
        return (skillMap[BarbarianSkill.Unconstrained]?.assignedSkillPoints ??
                    0) +
                (skillMap[BarbarianSkill.WalkingArsenal]?.assignedSkillPoints ??
                    0) +
                (skillMap[BarbarianSkill.GushingWounds]?.assignedSkillPoints ??
                    0) ==
            0;
      case BarbarianSkill.GushingWounds:
        return (skillMap[BarbarianSkill.Unconstrained]?.assignedSkillPoints ??
                    0) +
                (skillMap[BarbarianSkill.WalkingArsenal]?.assignedSkillPoints ??
                    0) +
                (skillMap[BarbarianSkill.UnbridledRage]?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.NaturesFury:
        return (skillMap[DruidSkill.EarthenMight]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.LupineFerocity]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.BestialRampage]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.PerfectStorm]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.UrsineStrength]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.EarthenMight:
        return (skillMap[DruidSkill.NaturesFury]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.LupineFerocity]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.BestialRampage]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.PerfectStorm]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.UrsineStrength]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.LupineFerocity:
        return (skillMap[DruidSkill.NaturesFury]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.EarthenMight]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.BestialRampage]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.PerfectStorm]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.UrsineStrength]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.BestialRampage:
        return (skillMap[DruidSkill.NaturesFury]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.EarthenMight]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.LupineFerocity]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.PerfectStorm]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.UrsineStrength]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.PerfectStorm:
        return (skillMap[DruidSkill.NaturesFury]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.EarthenMight]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.LupineFerocity]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.BestialRampage]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.UrsineStrength]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.UrsineStrength:
        return (skillMap[DruidSkill.NaturesFury]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.EarthenMight]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.LupineFerocity]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.BestialRampage]?.assignedSkillPoints ?? 0) +
                (skillMap[DruidSkill.PerfectStorm]?.assignedSkillPoints ?? 0) ==
            0;
      case NecromancerSkill.OssifiedEssence:
        return (skillMap[NecromancerSkill.RathmasVigor]?.assignedSkillPoints ??
                    0) +
                (skillMap[NecromancerSkill.Shadowblight]?.assignedSkillPoints ??
                    0) +
                (skillMap[NecromancerSkill.KalansEdict]?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.RathmasVigor:
        return (skillMap[NecromancerSkill.OssifiedEssence]?.assignedSkillPoints ??
                    0) +
                (skillMap[NecromancerSkill.Shadowblight]?.assignedSkillPoints ??
                    0) +
                (skillMap[NecromancerSkill.KalansEdict]?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.Shadowblight:
        return (skillMap[NecromancerSkill.OssifiedEssence]?.assignedSkillPoints ??
                    0) +
                (skillMap[NecromancerSkill.RathmasVigor]?.assignedSkillPoints ??
                    0) +
                (skillMap[NecromancerSkill.KalansEdict]?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.KalansEdict:
        return (skillMap[NecromancerSkill.OssifiedEssence]?.assignedSkillPoints ??
                    0) +
                (skillMap[NecromancerSkill.RathmasVigor]?.assignedSkillPoints ??
                    0) +
                (skillMap[NecromancerSkill.Shadowblight]?.assignedSkillPoints ??
                    0) ==
            0;
      case RogueSkill.Momentum:
        return (skillMap[RogueSkill.CloseQuartersCombat]?.assignedSkillPoints ??
                    0) +
                (skillMap[RogueSkill.Precision]?.assignedSkillPoints ?? 0) +
                (skillMap[RogueSkill.Victimize]?.assignedSkillPoints ?? 0) +
                (skillMap[RogueSkill.Exposure]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.CloseQuartersCombat:
        return (skillMap[RogueSkill.Momentum]?.assignedSkillPoints ?? 0) +
                (skillMap[RogueSkill.Precision]?.assignedSkillPoints ?? 0) +
                (skillMap[RogueSkill.Victimize]?.assignedSkillPoints ?? 0) +
                (skillMap[RogueSkill.Exposure]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.Precision:
        return (skillMap[RogueSkill.Momentum]?.assignedSkillPoints ?? 0) +
                (skillMap[RogueSkill.CloseQuartersCombat]?.assignedSkillPoints ??
                    0) +
                (skillMap[RogueSkill.Victimize]?.assignedSkillPoints ?? 0) +
                (skillMap[RogueSkill.Exposure]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.Victimize:
        return (skillMap[RogueSkill.Momentum]?.assignedSkillPoints ?? 0) +
                (skillMap[RogueSkill.CloseQuartersCombat]?.assignedSkillPoints ??
                    0) +
                (skillMap[RogueSkill.Precision]?.assignedSkillPoints ?? 0) +
                (skillMap[RogueSkill.Exposure]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.Exposure:
        return (skillMap[RogueSkill.Momentum]?.assignedSkillPoints ?? 0) +
                (skillMap[RogueSkill.CloseQuartersCombat]?.assignedSkillPoints ??
                    0) +
                (skillMap[RogueSkill.Precision]?.assignedSkillPoints ?? 0) +
                (skillMap[RogueSkill.Victimize]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.Avalanche:
        return (skillMap[SorcererSkill.Shatter]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.OverflowingEnergy]?.assignedSkillPoints ??
                    0) +
                (skillMap[SorcererSkill.VyrsMastery]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.EsusFerocity]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.Combustion]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.Shatter:
        return (skillMap[SorcererSkill.Avalanche]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.OverflowingEnergy]?.assignedSkillPoints ??
                    0) +
                (skillMap[SorcererSkill.VyrsMastery]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.EsusFerocity]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.Combustion]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.OverflowingEnergy:
        return (skillMap[SorcererSkill.Avalanche]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.Shatter]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.VyrsMastery]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.EsusFerocity]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.Combustion]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.VyrsMastery:
        return (skillMap[SorcererSkill.Avalanche]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.Shatter]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.OverflowingEnergy]?.assignedSkillPoints ??
                    0) +
                (skillMap[SorcererSkill.EsusFerocity]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.Combustion]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.EsusFerocity:
        return (skillMap[SorcererSkill.Avalanche]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.Shatter]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.OverflowingEnergy]?.assignedSkillPoints ??
                    0) +
                (skillMap[SorcererSkill.VyrsMastery]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.Combustion]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.Combustion:
        return (skillMap[SorcererSkill.Avalanche]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.Shatter]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.OverflowingEnergy]?.assignedSkillPoints ??
                    0) +
                (skillMap[SorcererSkill.VyrsMastery]?.assignedSkillPoints ?? 0) +
                (skillMap[SorcererSkill.EsusFerocity]?.assignedSkillPoints ??
                    0) ==
            0;
      default:
        return true;
    }
  }

  bool get _parentsThresholdIsMet {
    switch (skillTree.element) {
      case BarbarianSkill.ExposeVulnerability:
        return (skillMap[BarbarianSkill.NoMercy]?.assignedSkillPoints ?? 0) > 0 ||
            (skillMap[BarbarianSkill.SlayingStrike]?.assignedSkillPoints ?? 0) >
                0;
      case BarbarianSkill.BruteForce:
        return (skillMap[BarbarianSkill.HeavyHanded]?.assignedSkillPoints ?? 0) >
                0 ||
            (skillMap[BarbarianSkill.Wallop]?.assignedSkillPoints ?? 0) > 0;
      case DruidSkill.BadOmen:
        return (skillMap[DruidSkill.ChargedAtmosphere]?.assignedSkillPoints ??
                    0) >
                0 ||
            (skillMap[DruidSkill.EndlessTempest]?.assignedSkillPoints ?? 0) > 0;
      case DruidSkill.Unrestrained:
        return (skillMap[DruidSkill.ThickHide]?.assignedSkillPoints ?? 0) > 0 ||
            (skillMap[DruidSkill.NaturesResolve]?.assignedSkillPoints ?? 0) > 0;
      case DruidSkill.Resonance:
        return (skillMap[DruidSkill.NaturalDisaster]?.assignedSkillPoints ?? 0) >
                0 ||
            (skillMap[DruidSkill.CircleOfLife]?.assignedSkillPoints ?? 0) > 0;
      case NecromancerSkill.TidesOfBlood:
        return (skillMap[NecromancerSkill.Transfusion]?.assignedSkillPoints ??
                    0) >
                0 ||
            (skillMap[NecromancerSkill.CoalescedBlood]?.assignedSkillPoints ??
                    0) >
                0;
      case NecromancerSkill.Evulsion:
        return (skillMap[NecromancerSkill.CompoundFracture]
                        ?.assignedSkillPoints ??
                    0) >
                0 ||
            (skillMap[NecromancerSkill.RapidOssification]?.assignedSkillPoints ??
                    0) >
                0;
      case NecromancerSkill.Terror:
        return (skillMap[NecromancerSkill.Gloom]?.assignedSkillPoints ?? 0) > 0 ||
            (skillMap[NecromancerSkill.CripplingDarkness]?.assignedSkillPoints ??
                    0) >
                0;
      case RogueSkill.TrickAttacks:
        return (skillMap[RogueSkill.Concussive]?.assignedSkillPoints ?? 0) > 0 ||
            (skillMap[RogueSkill.RapidGambits]?.assignedSkillPoints ?? 0) > 0;
      case SorcererSkill.FrigidBreeze:
        return (skillMap[SorcererSkill.Hoarfrost]?.assignedSkillPoints ?? 0) >
                0 ||
            (skillMap[SorcererSkill.IcyTouch]?.assignedSkillPoints ?? 0) > 0;
      case SorcererSkill.Warmth:
        return (skillMap[SorcererSkill.EndlessPyre]?.assignedSkillPoints ?? 0) >
                0 ||
            (skillMap[SorcererSkill.Soulfire]?.assignedSkillPoints ?? 0) > 0;
      case SorcererSkill.Convulsions:
        return (skillMap[SorcererSkill.Conduction]?.assignedSkillPoints ?? 0) >
                0 ||
            (skillMap[SorcererSkill.Electrocution]?.assignedSkillPoints ?? 0) > 0;
      default:
        if (_isNotCluster(parent)) {
          return (skillMap[parent]?.assignedSkillPoints ?? 0) > 0;
        } else {
          return true;
        }
    }
  }

  bool get _isDecrementable =>
      isClusterDecrementable &&
      ((skillMap[skillTree.element]?.assignedSkillPoints ?? 0) > 1 ||
          (skillMap[skillTree.element]?.assignedSkillPoints ?? 0) == 1 &&
              skillTree.children.fold(
                      0,
                      (b, a) =>
                          b +
                          a.fold(
                              0,
                              (d, c) =>
                                  d + (skillMap[c]?.assignedSkillPoints ?? 0))) ==
                  0);

  bool get _isIncrementable =>
      isClusterUnlocked &&
      (skillMap[skillTree.element]?.assignedSkillPoints ?? 0) <
          _maxAssignedOf(skillTree.element) &&
      _parentsThresholdIsMet &&
      _isUnique;

  @override
  Widget build(BuildContext context) => ExpansionTile(
        shape: Theme.of(context).expansionTileTheme.shape,
        childrenPadding: Theme.of(context).expansionTileTheme.childrenPadding,
        title: Text(EnumUtils.enumToNameWithSpaces(skillTree.element)),
        trailing: AllocationWidget(
          skillTree.element,
          level: skillMap[skillTree.element]?.assignedSkillPoints ?? 0,
          onMinusPressed: () {
            if (_isDecrementable) {
              decrementCallback(skillTree.element);
            }
          },
          onPlusPressed: () {
            if (_isIncrementable) {
              incrementCallback(skillTree.element);
            }
          },
        ),
        children: skillTree.children
            .map(
              (child) => SkillWidget(
                parent: skillTree.element,
                isClusterUnlocked: isClusterUnlocked,
                isClusterDecrementable: isClusterDecrementable,
                skillTree: child,
                skillMap: skillMap,
                incrementCallback: incrementCallback,
                decrementCallback: decrementCallback,
              ),
            )
            .toList(growable: false),
      );
}
