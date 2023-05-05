import 'package:d4_utils/src/character_classes/barbarian.dart';
import 'package:d4_utils/src/character_classes/druid.dart';
import 'package:d4_utils/src/character_classes/necromancer.dart';
import 'package:d4_utils/src/character_classes/rogue.dart';
import 'package:d4_utils/src/character_classes/sorcerer.dart';
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
import 'package:d4_utils/src/widgets/skill_widget.dart';
import 'package:flutter/material.dart';

class SkillTreeWidget extends StatelessWidget {
  const SkillTreeWidget({
    super.key,
    required this.parent,
    required this.isClusterUnlocked,
    required this.isClusterDecrementable,
    required this.skill,
    required this.skills,
    required this.incrementCallback,
    required this.decrementCallback,
  });

  final Enum parent;
  final bool isClusterUnlocked;
  final bool isClusterDecrementable;
  final Tree<Enum> skill;
  final Map<Enum, Skill> skills;
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
    switch (skill.element) {
      /* Upgrade */
      case BarbarianSkill.BattleBash:
        return (skills[BarbarianSkill.CombatBash]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.CombatBash:
        return (skills[BarbarianSkill.BattleBash]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.BattleFlay:
        return (skills[BarbarianSkill.CombatFlay]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.CombatFlay:
        return (skills[BarbarianSkill.BattleFlay]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.BattleFrenzy:
        return (skills[BarbarianSkill.CombatFrenzy]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.CombatFrenzy:
        return (skills[BarbarianSkill.BattleFrenzy]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.BattleLungingStrike:
        return (skills[BarbarianSkill.CombatLungingStrike]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.CombatLungingStrike:
        return (skills[BarbarianSkill.BattleLungingStrike]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FuriousDoubleSwing:
        return (skills[BarbarianSkill.ViolentDoubleSwing]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.ViolentDoubleSwing:
        return (skills[BarbarianSkill.FuriousDoubleSwing]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FuriousHammerOfTheAncients:
        return (skills[BarbarianSkill.ViolentHammerOfTheAncients]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.ViolentHammerOfTheAncients:
        return (skills[BarbarianSkill.FuriousHammerOfTheAncients]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FuriousRend:
        return (skills[BarbarianSkill.ViolentRend]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.ViolentRend:
        return (skills[BarbarianSkill.FuriousRend]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FuriousUpheaval:
        return (skills[BarbarianSkill.ViolentUpheaval]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.ViolentUpheaval:
        return (skills[BarbarianSkill.FuriousUpheaval]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FuriousWhirlwind:
        return (skills[BarbarianSkill.ViolentWhirlwind]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.ViolentWhirlwind:
        return (skills[BarbarianSkill.FuriousWhirlwind]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.StrategicChallengingShout:
        return (skills[BarbarianSkill.TacticalChallengingShout]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.TacticalChallengingShout:
        return (skills[BarbarianSkill.StrategicChallengingShout]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.StrategicGroundStomp:
        return (skills[BarbarianSkill.TacticalGroundStomp]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.TacticalGroundStomp:
        return (skills[BarbarianSkill.StrategicGroundStomp]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.StrategicIronSkin:
        return (skills[BarbarianSkill.TacticalIronSkin]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.TacticalIronSkin:
        return (skills[BarbarianSkill.StrategicIronSkin]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.StrategicRallyingCry:
        return (skills[BarbarianSkill.TacticalRallyingCry]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.TacticalRallyingCry:
        return (skills[BarbarianSkill.StrategicRallyingCry]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.MightyCharge:
        return (skills[BarbarianSkill.PowerCharge]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.PowerCharge:
        return (skills[BarbarianSkill.MightyCharge]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.MightyKick:
        return (skills[BarbarianSkill.PowerKick]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.PowerKick:
        return (skills[BarbarianSkill.MightyKick]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.MightyLeap:
        return (skills[BarbarianSkill.PowerLeap]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.PowerLeap:
        return (skills[BarbarianSkill.MightyLeap]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.MightyWarCry:
        return (skills[BarbarianSkill.PowerWarCry]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.PowerWarCry:
        return (skills[BarbarianSkill.MightyWarCry]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FightersDeathBlow:
        return (skills[BarbarianSkill.WarriorsDeathBlow]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.WarriorsDeathBlow:
        return (skills[BarbarianSkill.FightersDeathBlow]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FightersRupture:
        return (skills[BarbarianSkill.WarriorsRupture]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.WarriorsRupture:
        return (skills[BarbarianSkill.FightersRupture]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FightersSteelGrasp:
        return (skills[BarbarianSkill.WarriorsSteelGrasp]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.WarriorsSteelGrasp:
        return (skills[BarbarianSkill.FightersSteelGrasp]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FierceMaul:
        return (skills[DruidSkill.WildMaul]?.assignedSkillPoints ?? 0) == 0;
      case DruidSkill.WildMaul:
        return (skills[DruidSkill.FierceMaul]?.assignedSkillPoints ?? 0) == 0;
      case DruidSkill.FierceClaw:
        return (skills[DruidSkill.WildClaw]?.assignedSkillPoints ?? 0) == 0;
      case DruidSkill.WildClaw:
        return (skills[DruidSkill.FierceClaw]?.assignedSkillPoints ?? 0) == 0;
      case DruidSkill.FierceStormStrike:
        return (skills[DruidSkill.WildStormStrike]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.WildStormStrike:
        return (skills[DruidSkill.FierceStormStrike]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FierceWindShear:
        return (skills[DruidSkill.WildWindShear]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.WildWindShear:
        return (skills[DruidSkill.FierceWindShear]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FierceEarthSpike:
        return (skills[DruidSkill.WildEarthSpike]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.WildEarthSpike:
        return (skills[DruidSkill.FierceEarthSpike]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PrimalLightningStorm:
        return (skills[DruidSkill.RagingLightningStorm]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.RagingLightningStorm:
        return (skills[DruidSkill.PrimalLightningStorm]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PrimalTornado:
        return (skills[DruidSkill.RagingTornado]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.RagingTornado:
        return (skills[DruidSkill.PrimalTornado]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.PrimalPulverize:
        return (skills[DruidSkill.RagingPulverize]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.RagingPulverize:
        return (skills[DruidSkill.PrimalPulverize]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PrimalShred:
        return (skills[DruidSkill.RagingShred]?.assignedSkillPoints ?? 0) == 0;
      case DruidSkill.RagingShred:
        return (skills[DruidSkill.PrimalShred]?.assignedSkillPoints ?? 0) == 0;
      case DruidSkill.PrimalLandSlide:
        return (skills[DruidSkill.RagingLandSlide]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.RagingLandSlide:
        return (skills[DruidSkill.PrimalLandSlide]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.InnateEarthenBulwark:
        return (skills[DruidSkill.PreservingEarthenBulwark]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PreservingEarthenBulwark:
        return (skills[DruidSkill.InnateEarthenBulwark]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.InnateCycloneArmor:
        return (skills[DruidSkill.PreservingCycloneArmor]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PreservingCycloneArmor:
        return (skills[DruidSkill.InnateCycloneArmor]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.InnateBloodHowl:
        return (skills[DruidSkill.PreservingBloodHowl]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PreservingBloodHowl:
        return (skills[DruidSkill.InnateBloodHowl]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.InnateDebilitatingRoar:
        return (skills[DruidSkill.PreservingDebilitatingRoar]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PreservingDebilitatingRoar:
        return (skills[DruidSkill.InnateDebilitatingRoar]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.BrutalWolves:
        return (skills[DruidSkill.FerociousWolves]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FerociousWolves:
        return (skills[DruidSkill.BrutalWolves]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.BrutalRavens:
        return (skills[DruidSkill.FerociousRavens]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FerociousRavens:
        return (skills[DruidSkill.BrutalRavens]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.BrutalVineCreeper:
        return (skills[DruidSkill.FerociousVineCreeper]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FerociousVineCreeper:
        return (skills[DruidSkill.BrutalVineCreeper]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.NaturalBoulder:
        return (skills[DruidSkill.SavageBoulder]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.SavageBoulder:
        return (skills[DruidSkill.NaturalBoulder]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.NaturalTrample:
        return (skills[DruidSkill.SavageTrample]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.SavageTrample:
        return (skills[DruidSkill.NaturalTrample]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.NaturalHurricane:
        return (skills[DruidSkill.SavageHurricane]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.SavageHurricane:
        return (skills[DruidSkill.NaturalHurricane]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.NaturalRabies:
        return (skills[DruidSkill.SavageRabies]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.SavageRabies:
        return (skills[DruidSkill.NaturalRabies]?.assignedSkillPoints ?? 0) ==
            0;
      case NecromancerSkill.AcolytesBoneSplinters:
        return (skills[NecromancerSkill.InitiatesBoneSplinters]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.InitiatesBoneSplinters:
        return (skills[NecromancerSkill.AcolytesBoneSplinters]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.AcolytesDecompose:
        return (skills[NecromancerSkill.InitiatesDecompose]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.InitiatesDecompose:
        return (skills[NecromancerSkill.AcolytesDecompose]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.AcolytesHemorrhage:
        return (skills[NecromancerSkill.InitiatesHemorrhage]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.InitiatesHemorrhage:
        return (skills[NecromancerSkill.AcolytesHemorrhage]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.AcolytesReap:
        return (skills[NecromancerSkill.InitiatesReap]?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.InitiatesReap:
        return (skills[NecromancerSkill.AcolytesReap]?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.ParanormalBlight:
        return (skills[NecromancerSkill.SupernaturalBlight]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.SupernaturalBlight:
        return (skills[NecromancerSkill.ParanormalBlight]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.ParanormalBloodLance:
        return (skills[NecromancerSkill.SupernaturalBloodLance]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.SupernaturalBloodLance:
        return (skills[NecromancerSkill.ParanormalBloodLance]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.ParanormalBloodSurge:
        return (skills[NecromancerSkill.SupernaturalBloodSurge]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.SupernaturalBloodSurge:
        return (skills[NecromancerSkill.ParanormalBloodSurge]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.ParanormalBoneSpear:
        return (skills[NecromancerSkill.SupernaturalBoneSpear]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.SupernaturalBoneSpear:
        return (skills[NecromancerSkill.ParanormalBoneSpear]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.ParanormalSever:
        return (skills[NecromancerSkill.SupernaturalSever]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.SupernaturalSever:
        return (skills[NecromancerSkill.ParanormalSever]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.DreadfulBloodMist:
        return (skills[NecromancerSkill.GhastlyBloodMist]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.GhastlyBloodMist:
        return (skills[NecromancerSkill.DreadfulBloodMist]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.DreadfulBonePrison:
        return (skills[NecromancerSkill.GhastlyBonePrison]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.GhastlyBonePrison:
        return (skills[NecromancerSkill.DreadfulBonePrison]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.BlightedCorpseExplosion:
        return (skills[NecromancerSkill.PlaguedCorpseExplosion]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.PlaguedCorpseExplosion:
        return (skills[NecromancerSkill.BlightedCorpseExplosion]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.AbhorrentDecrepify:
        return (skills[NecromancerSkill.HorridDecrepify]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.HorridDecrepify:
        return (skills[NecromancerSkill.AbhorrentDecrepify]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.AbhorrentIronMaiden:
        return (skills[NecromancerSkill.HorridIronMaiden]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.HorridIronMaiden:
        return (skills[NecromancerSkill.AbhorrentIronMaiden]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.DreadfulBoneSpirit:
        return (skills[NecromancerSkill.GhastlyBoneSpirit]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.GhastlyBoneSpirit:
        return (skills[NecromancerSkill.DreadfulBoneSpirit]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.BlightedCorpseTendrils:
        return (skills[NecromancerSkill.PlaguedCorpseTendrils]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.PlaguedCorpseTendrils:
        return (skills[NecromancerSkill.BlightedCorpseTendrils]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.FundamentalBladeShift:
        return (skills[RogueSkill.PrimaryBladeShift]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.PrimaryBladeShift:
        return (skills[RogueSkill.FundamentalBladeShift]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.FundamentalForcefulArrow:
        return (skills[RogueSkill.PrimaryForcefulArrow]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.PrimaryForcefulArrow:
        return (skills[RogueSkill.FundamentalForcefulArrow]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.FundamentalHeartseeker:
        return (skills[RogueSkill.PrimaryHeartseeker]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.PrimaryHeartseeker:
        return (skills[RogueSkill.FundamentalHeartseeker]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.FundamentalInvigoratingStrike:
        return (skills[RogueSkill.PrimaryInvigoratingStrike]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.PrimaryInvigoratingStrike:
        return (skills[RogueSkill.FundamentalInvigoratingStrike]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.FundamentalPuncture:
        return (skills[RogueSkill.PrimaryPuncture]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.PrimaryPuncture:
        return (skills[RogueSkill.FundamentalPuncture]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.AdvancedBarrage:
        return (skills[RogueSkill.ImprovedBarrage]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.ImprovedBarrage:
        return (skills[RogueSkill.AdvancedBarrage]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.AdvancedFlurry:
        return (skills[RogueSkill.ImprovedFlurry]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.ImprovedFlurry:
        return (skills[RogueSkill.AdvancedFlurry]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.AdvancedPenetratingShot:
        return (skills[RogueSkill.ImprovedPenetratingShot]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.ImprovedPenetratingShot:
        return (skills[RogueSkill.AdvancedPenetratingShot]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.AdvancedRapidFire:
        return (skills[RogueSkill.ImprovedRapidFire]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.ImprovedRapidFire:
        return (skills[RogueSkill.AdvancedRapidFire]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.AdvancedTwistingBlades:
        return (skills[RogueSkill.ImprovedTwistingBlades]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.ImprovedTwistingBlades:
        return (skills[RogueSkill.AdvancedTwistingBlades]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.DisciplinedCaltrops:
        return (skills[RogueSkill.MethodicalCaltrops]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.MethodicalCaltrops:
        return (skills[RogueSkill.DisciplinedCaltrops]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.DisciplinedDash:
        return (skills[RogueSkill.MethodicalDash]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.MethodicalDash:
        return (skills[RogueSkill.DisciplinedDash]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.DisciplinedShadowStep:
        return (skills[RogueSkill.MethodicalShadowStep]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.MethodicalShadowStep:
        return (skills[RogueSkill.DisciplinedShadowStep]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.CounteringConcealment:
        return (skills[RogueSkill.SubvertingConcealment]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.SubvertingConcealment:
        return (skills[RogueSkill.CounteringConcealment]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.CounteringDarkShroud:
        return (skills[RogueSkill.SubvertingDarkShroud]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.SubvertingDarkShroud:
        return (skills[RogueSkill.CounteringDarkShroud]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.CounteringPoisonTrap:
        return (skills[RogueSkill.SubvertingPoisonTrap]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.SubvertingPoisonTrap:
        return (skills[RogueSkill.CounteringPoisonTrap]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.CounteringSmokeGrenade:
        return (skills[RogueSkill.SubvertingSmokeGrenade]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.SubvertingSmokeGrenade:
        return (skills[RogueSkill.CounteringSmokeGrenade]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.BlendedColdImbuement:
        return (skills[RogueSkill.MixedColdImbuement]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.MixedColdImbuement:
        return (skills[RogueSkill.BlendedColdImbuement]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.BlendedPoisonImbuement:
        return (skills[RogueSkill.MixedPoisonImbuement]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.MixedPoisonImbuement:
        return (skills[RogueSkill.BlendedPoisonImbuement]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.BlendedShadowImbuement:
        return (skills[RogueSkill.MixedShadowImbuement]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.MixedShadowImbuement:
        return (skills[RogueSkill.BlendedShadowImbuement]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.FlickeringSpark:
        return (skills[SorcererSkill.GlintingSpark]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GlintingSpark:
        return (skills[SorcererSkill.FlickeringSpark]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.FlickeringFrostBolt:
        return (skills[SorcererSkill.GlintingFrostBolt]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GlintingFrostBolt:
        return (skills[SorcererSkill.FlickeringFrostBolt]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.FlickeringFireBolt:
        return (skills[SorcererSkill.GlintingFireBolt]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GlintingFireBolt:
        return (skills[SorcererSkill.FlickeringFireBolt]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.FlickeringArcLash:
        return (skills[SorcererSkill.GlintingArcLash]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GlintingArcLash:
        return (skills[SorcererSkill.FlickeringArcLash]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveChainLightning:
        return (skills[SorcererSkill.GreaterChainLightning]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterChainLightning:
        return (skills[SorcererSkill.DestructiveChainLightning]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveChargedBolts:
        return (skills[SorcererSkill.GreaterChargedBolts]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterChargedBolts:
        return (skills[SorcererSkill.DestructiveChargedBolts]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveFireball:
        return (skills[SorcererSkill.GreaterFireball]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterFireball:
        return (skills[SorcererSkill.DestructiveFireball]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveFrozenOrb:
        return (skills[SorcererSkill.GreaterFrozenOrb]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterFrozenOrb:
        return (skills[SorcererSkill.DestructiveFrozenOrb]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveIncinerate:
        return (skills[SorcererSkill.GreaterIncinerate]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterIncinerate:
        return (skills[SorcererSkill.DestructiveIncinerate]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveIceShards:
        return (skills[SorcererSkill.GreaterIceShards]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterIceShards:
        return (skills[SorcererSkill.DestructiveIceShards]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MysticalFlameShield:
        return (skills[SorcererSkill.ShimmeringFlameShield]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.ShimmeringFlameShield:
        return (skills[SorcererSkill.MysticalFlameShield]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MysticalIceArmor:
        return (skills[SorcererSkill.ShimmeringIceArmor]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.ShimmeringIceArmor:
        return (skills[SorcererSkill.MysticalIceArmor]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MysticalTeleport:
        return (skills[SorcererSkill.ShimmeringTeleport]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.ShimmeringTeleport:
        return (skills[SorcererSkill.MysticalTeleport]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MysticalFrostNova:
        return (skills[SorcererSkill.ShimmeringFrostNova]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.ShimmeringFrostNova:
        return (skills[SorcererSkill.MysticalFrostNova]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.InvokedHydra:
        return (skills[SorcererSkill.SummonedHydra]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.SummonedHydra:
        return (skills[SorcererSkill.InvokedHydra]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.InvokedIceBlades:
        return (skills[SorcererSkill.SummonedIceBlades]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.SummonedIceBlades:
        return (skills[SorcererSkill.InvokedIceBlades]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.InvokedLightningSpear:
        return (skills[SorcererSkill.SummonedLightningSpear]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.SummonedLightningSpear:
        return (skills[SorcererSkill.InvokedLightningSpear]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MagesBlizzard:
        return (skills[SorcererSkill.WizardsBlizzard]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.WizardsBlizzard:
        return (skills[SorcererSkill.MagesBlizzard]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MagesFirewall:
        return (skills[SorcererSkill.WizardsFirewall]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.WizardsFirewall:
        return (skills[SorcererSkill.MagesFirewall]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MagesMeteor:
        return (skills[SorcererSkill.WizardsMeteor]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.WizardsMeteor:
        return (skills[SorcererSkill.MagesMeteor]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.MagesBallLightning:
        return (skills[SorcererSkill.WizardsBallLightning]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.WizardsBallLightning:
        return (skills[SorcererSkill.MagesBallLightning]
                    ?.assignedSkillPoints ??
                0) ==
            0;

      /* Ultimate */
      case BarbarianSkill.CallOfTheAncients:
        return (skills[BarbarianSkill.IronMaelstrom]?.assignedSkillPoints ??
                    0) +
                (skills[BarbarianSkill.WrathOfTheBerserker]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case BarbarianSkill.IronMaelstrom:
        return (skills[BarbarianSkill.CallOfTheAncients]
                        ?.assignedSkillPoints ??
                    0) +
                (skills[BarbarianSkill.WrathOfTheBerserker]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case BarbarianSkill.WrathOfTheBerserker:
        return (skills[BarbarianSkill.CallOfTheAncients]
                        ?.assignedSkillPoints ??
                    0) +
                (skills[BarbarianSkill.IronMaelstrom]?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.GrizzlyRage:
        return (skills[DruidSkill.Petrify]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.Lacerate]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.Cataclysm]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.Petrify:
        return (skills[DruidSkill.GrizzlyRage]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.Lacerate]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.Cataclysm]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.Lacerate:
        return (skills[DruidSkill.GrizzlyRage]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.Petrify]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.Cataclysm]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.Cataclysm:
        return (skills[DruidSkill.GrizzlyRage]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.Petrify]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.Lacerate]?.assignedSkillPoints ?? 0) ==
            0;
      case NecromancerSkill.ArmyOfTheDead:
        return (skills[NecromancerSkill.BloodWave]?.assignedSkillPoints ?? 0) +
                (skills[NecromancerSkill.BoneStorm]?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.BloodWave:
        return (skills[NecromancerSkill.ArmyOfTheDead]?.assignedSkillPoints ??
                    0) +
                (skills[NecromancerSkill.BoneStorm]?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.BoneStorm:
        return (skills[NecromancerSkill.ArmyOfTheDead]?.assignedSkillPoints ??
                    0) +
                (skills[NecromancerSkill.BloodWave]?.assignedSkillPoints ??
                    0) ==
            0;
      case RogueSkill.DeathTrap:
        return (skills[RogueSkill.RainOfArrows]?.assignedSkillPoints ?? 0) +
                (skills[RogueSkill.ShadowClone]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.RainOfArrows:
        return (skills[RogueSkill.DeathTrap]?.assignedSkillPoints ?? 0) +
                (skills[RogueSkill.ShadowClone]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.ShadowClone:
        return (skills[RogueSkill.DeathTrap]?.assignedSkillPoints ?? 0) +
                (skills[RogueSkill.RainOfArrows]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.DeepFreeze:
        return (skills[SorcererSkill.Inferno]?.assignedSkillPoints ?? 0) +
                (skills[SorcererSkill.UnstableCurrents]?.assignedSkillPoints ??
                    0) ==
            0;
      case SorcererSkill.Inferno:
        return (skills[SorcererSkill.DeepFreeze]?.assignedSkillPoints ?? 0) +
                (skills[SorcererSkill.UnstableCurrents]?.assignedSkillPoints ??
                    0) ==
            0;
      case SorcererSkill.UnstableCurrents:
        return (skills[SorcererSkill.DeepFreeze]?.assignedSkillPoints ?? 0) +
                (skills[SorcererSkill.Inferno]?.assignedSkillPoints ?? 0) ==
            0;

      /* Key Passive */
      case BarbarianSkill.Unconstrained:
        return (skills[
                            BarbarianSkill.WalkingArsenal]
                        ?.assignedSkillPoints ??
                    0) +
                (skills[BarbarianSkill.UnbridledRage]?.assignedSkillPoints ??
                    0) +
                (skills[BarbarianSkill.GushingWounds]?.assignedSkillPoints ??
                    0) ==
            0;
      case BarbarianSkill.WalkingArsenal:
        return (skills[BarbarianSkill.Unconstrained]?.assignedSkillPoints ??
                    0) +
                (skills[BarbarianSkill.UnbridledRage]?.assignedSkillPoints ??
                    0) +
                (skills[BarbarianSkill.GushingWounds]?.assignedSkillPoints ??
                    0) ==
            0;
      case BarbarianSkill.UnbridledRage:
        return (skills[BarbarianSkill.Unconstrained]?.assignedSkillPoints ??
                    0) +
                (skills[BarbarianSkill.WalkingArsenal]?.assignedSkillPoints ??
                    0) +
                (skills[BarbarianSkill.GushingWounds]?.assignedSkillPoints ??
                    0) ==
            0;
      case BarbarianSkill.GushingWounds:
        return (skills[BarbarianSkill.Unconstrained]?.assignedSkillPoints ??
                    0) +
                (skills[BarbarianSkill.WalkingArsenal]?.assignedSkillPoints ??
                    0) +
                (skills[BarbarianSkill.UnbridledRage]?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.NaturesFury:
        return (skills[DruidSkill.EarthenMight]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.LupineFerocity]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.BestialRampage]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.PerfectStorm]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.UrsineStrength]?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.EarthenMight:
        return (skills[DruidSkill.NaturesFury]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.LupineFerocity]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.BestialRampage]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.PerfectStorm]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.UrsineStrength]?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.LupineFerocity:
        return (skills[DruidSkill.NaturesFury]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.EarthenMight]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.BestialRampage]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.PerfectStorm]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.UrsineStrength]?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.BestialRampage:
        return (skills[DruidSkill.NaturesFury]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.EarthenMight]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.LupineFerocity]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.PerfectStorm]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.UrsineStrength]?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.PerfectStorm:
        return (skills[DruidSkill.NaturesFury]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.EarthenMight]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.LupineFerocity]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.BestialRampage]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.UrsineStrength]?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.UrsineStrength:
        return (skills[DruidSkill.NaturesFury]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.EarthenMight]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.LupineFerocity]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.BestialRampage]?.assignedSkillPoints ?? 0) +
                (skills[DruidSkill.PerfectStorm]?.assignedSkillPoints ?? 0) ==
            0;
      case NecromancerSkill.OssifiedEssence:
        return (skills[NecromancerSkill.RathmasVigor]?.assignedSkillPoints ??
                    0) +
                (skills[NecromancerSkill.Shadowblight]?.assignedSkillPoints ??
                    0) +
                (skills[NecromancerSkill.KalansEdict]?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.RathmasVigor:
        return (skills[NecromancerSkill.OssifiedEssence]
                        ?.assignedSkillPoints ??
                    0) +
                (skills[NecromancerSkill.Shadowblight]?.assignedSkillPoints ??
                    0) +
                (skills[NecromancerSkill.KalansEdict]?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.Shadowblight:
        return (skills[NecromancerSkill.OssifiedEssence]
                        ?.assignedSkillPoints ??
                    0) +
                (skills[NecromancerSkill.RathmasVigor]?.assignedSkillPoints ??
                    0) +
                (skills[NecromancerSkill.KalansEdict]?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.KalansEdict:
        return (skills[NecromancerSkill.OssifiedEssence]
                        ?.assignedSkillPoints ??
                    0) +
                (skills[NecromancerSkill.RathmasVigor]?.assignedSkillPoints ??
                    0) +
                (skills[NecromancerSkill.Shadowblight]?.assignedSkillPoints ??
                    0) ==
            0;
      case RogueSkill.Momentum:
        return (skills[RogueSkill.CloseQuartersCombat]?.assignedSkillPoints ??
                    0) +
                (skills[RogueSkill.Precision]?.assignedSkillPoints ?? 0) +
                (skills[RogueSkill.Victimize]?.assignedSkillPoints ?? 0) +
                (skills[RogueSkill.Exposure]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.CloseQuartersCombat:
        return (skills[RogueSkill.Momentum]?.assignedSkillPoints ?? 0) +
                (skills[RogueSkill.Precision]?.assignedSkillPoints ?? 0) +
                (skills[RogueSkill.Victimize]?.assignedSkillPoints ?? 0) +
                (skills[RogueSkill.Exposure]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.Precision:
        return (skills[RogueSkill.Momentum]?.assignedSkillPoints ?? 0) +
                (skills[RogueSkill.CloseQuartersCombat]?.assignedSkillPoints ??
                    0) +
                (skills[RogueSkill.Victimize]?.assignedSkillPoints ?? 0) +
                (skills[RogueSkill.Exposure]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.Victimize:
        return (skills[RogueSkill.Momentum]?.assignedSkillPoints ?? 0) +
                (skills[RogueSkill.CloseQuartersCombat]?.assignedSkillPoints ??
                    0) +
                (skills[RogueSkill.Precision]?.assignedSkillPoints ?? 0) +
                (skills[RogueSkill.Exposure]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.Exposure:
        return (skills[RogueSkill.Momentum]?.assignedSkillPoints ?? 0) +
                (skills[RogueSkill.CloseQuartersCombat]?.assignedSkillPoints ??
                    0) +
                (skills[RogueSkill.Precision]?.assignedSkillPoints ?? 0) +
                (skills[RogueSkill.Victimize]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.Avalanche:
        return (skills[SorcererSkill.Shatter]?.assignedSkillPoints ?? 0) +
                (skills[
                            SorcererSkill.OverflowingEnergy]
                        ?.assignedSkillPoints ??
                    0) +
                (skills[SorcererSkill.VyrsMastery]?.assignedSkillPoints ?? 0) +
                (skills[SorcererSkill.EsusFerocity]?.assignedSkillPoints ??
                    0) +
                (skills[SorcererSkill.Combustion]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.Shatter:
        return (skills[SorcererSkill.Avalanche]?.assignedSkillPoints ?? 0) +
                (skills[
                            SorcererSkill.OverflowingEnergy]
                        ?.assignedSkillPoints ??
                    0) +
                (skills[SorcererSkill.VyrsMastery]?.assignedSkillPoints ?? 0) +
                (skills[SorcererSkill.EsusFerocity]?.assignedSkillPoints ??
                    0) +
                (skills[SorcererSkill.Combustion]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.OverflowingEnergy:
        return (skills[SorcererSkill.Avalanche]?.assignedSkillPoints ?? 0) +
                (skills[SorcererSkill.Shatter]?.assignedSkillPoints ?? 0) +
                (skills[SorcererSkill.VyrsMastery]?.assignedSkillPoints ?? 0) +
                (skills[SorcererSkill.EsusFerocity]?.assignedSkillPoints ??
                    0) +
                (skills[SorcererSkill.Combustion]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.VyrsMastery:
        return (skills[SorcererSkill.Avalanche]?.assignedSkillPoints ?? 0) +
                (skills[SorcererSkill.Shatter]?.assignedSkillPoints ?? 0) +
                (skills[
                            SorcererSkill.OverflowingEnergy]
                        ?.assignedSkillPoints ??
                    0) +
                (skills[SorcererSkill.EsusFerocity]?.assignedSkillPoints ??
                    0) +
                (skills[SorcererSkill.Combustion]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.EsusFerocity:
        return (skills[SorcererSkill.Avalanche]?.assignedSkillPoints ?? 0) +
                (skills[SorcererSkill.Shatter]?.assignedSkillPoints ?? 0) +
                (skills[SorcererSkill.OverflowingEnergy]
                        ?.assignedSkillPoints ??
                    0) +
                (skills[SorcererSkill.VyrsMastery]?.assignedSkillPoints ?? 0) +
                (skills[SorcererSkill.Combustion]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.Combustion:
        return (skills[SorcererSkill.Avalanche]?.assignedSkillPoints ?? 0) +
                (skills[SorcererSkill.Shatter]?.assignedSkillPoints ?? 0) +
                (skills[SorcererSkill.OverflowingEnergy]
                        ?.assignedSkillPoints ??
                    0) +
                (skills[SorcererSkill.VyrsMastery]?.assignedSkillPoints ?? 0) +
                (skills[SorcererSkill.EsusFerocity]?.assignedSkillPoints ??
                    0) ==
            0;
      default:
        return true;
    }
  }

  bool get _parentsThresholdIsMet {
    switch (skill.element) {
      case BarbarianSkill.ExposeVulnerability:
        return (skills[BarbarianSkill.NoMercy]?.assignedSkillPoints ?? 0) >
                0 ||
            (skills[BarbarianSkill.SlayingStrike]?.assignedSkillPoints ?? 0) >
                0;
      case BarbarianSkill.BruteForce:
        return (skills[BarbarianSkill.HeavyHanded]?.assignedSkillPoints ?? 0) >
                0 ||
            (skills[BarbarianSkill.Wallop]?.assignedSkillPoints ?? 0) > 0;
      case DruidSkill.BadOmen:
        return (skills[DruidSkill.ChargedAtmosphere]?.assignedSkillPoints ??
                    0) >
                0 ||
            (skills[DruidSkill.EndlessTempest]?.assignedSkillPoints ?? 0) > 0;
      case DruidSkill.Unrestrained:
        return (skills[DruidSkill.ThickHide]?.assignedSkillPoints ?? 0) > 0 ||
            (skills[DruidSkill.NaturesResolve]?.assignedSkillPoints ?? 0) > 0;
      case DruidSkill.Resonance:
        return (skills[DruidSkill.NaturalDisaster]?.assignedSkillPoints ?? 0) >
                0 ||
            (skills[DruidSkill.CircleOfLife]?.assignedSkillPoints ?? 0) > 0;
      case NecromancerSkill.TidesOfBlood:
        return (skills[NecromancerSkill.Transfusion]?.assignedSkillPoints ??
                    0) >
                0 ||
            (skills[NecromancerSkill.CoalescedBlood]?.assignedSkillPoints ??
                    0) >
                0;
      case NecromancerSkill.Evulsion:
        return (skills[NecromancerSkill.CompoundFracture]
                        ?.assignedSkillPoints ??
                    0) >
                0 ||
            (skills[NecromancerSkill.RapidOssification]?.assignedSkillPoints ??
                    0) >
                0;
      case NecromancerSkill.Terror:
        return (skills[NecromancerSkill.Gloom]?.assignedSkillPoints ?? 0) >
                0 ||
            (skills[NecromancerSkill.CripplingDarkness]?.assignedSkillPoints ??
                    0) >
                0;
      case RogueSkill.TrickAttacks:
        return (skills[RogueSkill.Concussive]?.assignedSkillPoints ?? 0) > 0 ||
            (skills[RogueSkill.RapidGambits]?.assignedSkillPoints ?? 0) > 0;
      case SorcererSkill.FrigidBreeze:
        return (skills[SorcererSkill.Hoarfrost]?.assignedSkillPoints ?? 0) >
                0 ||
            (skills[SorcererSkill.IcyTouch]?.assignedSkillPoints ?? 0) > 0;
      case SorcererSkill.Warmth:
        return (skills[SorcererSkill.EndlessPyre]?.assignedSkillPoints ?? 0) >
                0 ||
            (skills[SorcererSkill.Soulfire]?.assignedSkillPoints ?? 0) > 0;
      case SorcererSkill.Convulsions:
        return (skills[SorcererSkill.Conduction]?.assignedSkillPoints ?? 0) >
                0 ||
            (skills[SorcererSkill.Electrocution]?.assignedSkillPoints ?? 0) >
                0;
      default:
        if (_isNotCluster(parent)) {
          return (skills[parent]?.assignedSkillPoints ?? 0) > 0;
        } else {
          return true;
        }
    }
  }

  bool get _isDecrementable =>
      isClusterDecrementable &&
      ((skills[skill.element]?.assignedSkillPoints ?? 0) > 1 ||
          (skills[skill.element]?.assignedSkillPoints ?? 0) == 1 &&
              skill.children.fold(
                      0,
                      (b, a) =>
                          b +
                          a.fold(
                              0,
                              (d, c) =>
                                  d +
                                  (skills[c]?.assignedSkillPoints ?? 0))) ==
                  0);

  bool get _isIncrementable =>
      isClusterUnlocked &&
      (skills[skill.element]?.assignedSkillPoints ?? 0) <
          _maxAssignedOf(skill.element) &&
      _parentsThresholdIsMet &&
      _isUnique;

  @override
  Widget build(BuildContext context) => ExpansionTile(
        shape: Theme.of(context).expansionTileTheme.shape,
        childrenPadding: Theme.of(context).expansionTileTheme.childrenPadding,
        title: Text(EnumUtils.enumToNameWithSpaces(skill.element)),
        trailing: SkillWidget(
          skill.element,
          level: skills[skill.element]?.assignedSkillPoints ?? 0,
          onMinusPressed: () {
            if (_isDecrementable) {
              decrementCallback(skill.element);
            }
          },
          onPlusPressed: () {
            if (_isIncrementable) {
              incrementCallback(skill.element);
            }
          },
        ),
        children: skill.children
            .map(
              (child) => SkillTreeWidget(
                parent: skill.element,
                isClusterUnlocked: isClusterUnlocked,
                isClusterDecrementable: isClusterDecrementable,
                skill: child,
                skills: skills,
                incrementCallback: incrementCallback,
                decrementCallback: decrementCallback,
              ),
            )
            .toList(growable: false),
      );
}
