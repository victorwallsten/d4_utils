import 'dart:math';

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

class SkillWidget extends StatefulWidget {
  const SkillWidget({
    super.key,
    required this.parent,
    required this.isClusterUnlocked,
    required this.maxClusterReduction,
    required this.skillTree,
    required this.skillMap,
    required this.callback,
  });

  final Enum parent;
  final bool isClusterUnlocked;
  final int maxClusterReduction;
  final Tree<Enum> skillTree;
  final Map<Enum, Skill> skillMap;
  final Function(Enum, int) callback;

  @override
  State<SkillWidget> createState() => _SkillWidgetState();
}

class _SkillWidgetState extends State<SkillWidget> {
  bool _isExpanded = false;

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
    switch (widget.skillTree.element) {
      /* Upgrade */
      case BarbarianSkill.BattleBash:
        return (widget
                    .skillMap[BarbarianSkill.CombatBash]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.CombatBash:
        return (widget
                    .skillMap[BarbarianSkill.BattleBash]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.BattleFlay:
        return (widget
                    .skillMap[BarbarianSkill.CombatFlay]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.CombatFlay:
        return (widget
                    .skillMap[BarbarianSkill.BattleFlay]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.BattleFrenzy:
        return (widget.skillMap[BarbarianSkill.CombatFrenzy]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.CombatFrenzy:
        return (widget.skillMap[BarbarianSkill.BattleFrenzy]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.BattleLungingStrike:
        return (widget.skillMap[BarbarianSkill.CombatLungingStrike]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.CombatLungingStrike:
        return (widget.skillMap[BarbarianSkill.BattleLungingStrike]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FuriousDoubleSwing:
        return (widget.skillMap[BarbarianSkill.ViolentDoubleSwing]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.ViolentDoubleSwing:
        return (widget.skillMap[BarbarianSkill.FuriousDoubleSwing]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FuriousHammerOfTheAncients:
        return (widget.skillMap[BarbarianSkill.ViolentHammerOfTheAncients]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.ViolentHammerOfTheAncients:
        return (widget.skillMap[BarbarianSkill.FuriousHammerOfTheAncients]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FuriousRend:
        return (widget.skillMap[BarbarianSkill.ViolentRend]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.ViolentRend:
        return (widget.skillMap[BarbarianSkill.FuriousRend]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FuriousUpheaval:
        return (widget.skillMap[BarbarianSkill.ViolentUpheaval]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.ViolentUpheaval:
        return (widget.skillMap[BarbarianSkill.FuriousUpheaval]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FuriousWhirlwind:
        return (widget.skillMap[BarbarianSkill.ViolentWhirlwind]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.ViolentWhirlwind:
        return (widget.skillMap[BarbarianSkill.FuriousWhirlwind]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.StrategicChallengingShout:
        return (widget.skillMap[BarbarianSkill.TacticalChallengingShout]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.TacticalChallengingShout:
        return (widget.skillMap[BarbarianSkill.StrategicChallengingShout]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.StrategicGroundStomp:
        return (widget.skillMap[BarbarianSkill.TacticalGroundStomp]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.TacticalGroundStomp:
        return (widget.skillMap[BarbarianSkill.StrategicGroundStomp]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.StrategicIronSkin:
        return (widget.skillMap[BarbarianSkill.TacticalIronSkin]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.TacticalIronSkin:
        return (widget.skillMap[BarbarianSkill.StrategicIronSkin]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.StrategicRallyingCry:
        return (widget.skillMap[BarbarianSkill.TacticalRallyingCry]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.TacticalRallyingCry:
        return (widget.skillMap[BarbarianSkill.StrategicRallyingCry]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.MightyCharge:
        return (widget.skillMap[BarbarianSkill.PowerCharge]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.PowerCharge:
        return (widget.skillMap[BarbarianSkill.MightyCharge]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.MightyKick:
        return (widget
                    .skillMap[BarbarianSkill.PowerKick]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.PowerKick:
        return (widget
                    .skillMap[BarbarianSkill.MightyKick]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.MightyLeap:
        return (widget
                    .skillMap[BarbarianSkill.PowerLeap]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.PowerLeap:
        return (widget
                    .skillMap[BarbarianSkill.MightyLeap]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.MightyWarCry:
        return (widget.skillMap[BarbarianSkill.PowerWarCry]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.PowerWarCry:
        return (widget.skillMap[BarbarianSkill.MightyWarCry]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FightersDeathBlow:
        return (widget.skillMap[BarbarianSkill.WarriorsDeathBlow]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.WarriorsDeathBlow:
        return (widget.skillMap[BarbarianSkill.FightersDeathBlow]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FightersRupture:
        return (widget.skillMap[BarbarianSkill.WarriorsRupture]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.WarriorsRupture:
        return (widget.skillMap[BarbarianSkill.FightersRupture]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FightersSteelGrasp:
        return (widget.skillMap[BarbarianSkill.WarriorsSteelGrasp]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.WarriorsSteelGrasp:
        return (widget.skillMap[BarbarianSkill.FightersSteelGrasp]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FierceMaul:
        return (widget.skillMap[DruidSkill.WildMaul]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.WildMaul:
        return (widget.skillMap[DruidSkill.FierceMaul]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FierceClaw:
        return (widget.skillMap[DruidSkill.WildClaw]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.WildClaw:
        return (widget.skillMap[DruidSkill.FierceClaw]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FierceStormStrike:
        return (widget.skillMap[DruidSkill.WildStormStrike]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.WildStormStrike:
        return (widget.skillMap[DruidSkill.FierceStormStrike]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FierceWindShear:
        return (widget
                    .skillMap[DruidSkill.WildWindShear]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.WildWindShear:
        return (widget.skillMap[DruidSkill.FierceWindShear]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FierceEarthSpike:
        return (widget
                    .skillMap[DruidSkill.WildEarthSpike]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.WildEarthSpike:
        return (widget.skillMap[DruidSkill.FierceEarthSpike]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PrimalLightningStorm:
        return (widget.skillMap[DruidSkill.RagingLightningStorm]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.RagingLightningStorm:
        return (widget.skillMap[DruidSkill.PrimalLightningStorm]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PrimalTornado:
        return (widget
                    .skillMap[DruidSkill.RagingTornado]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.RagingTornado:
        return (widget
                    .skillMap[DruidSkill.PrimalTornado]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PrimalPulverize:
        return (widget.skillMap[DruidSkill.RagingPulverize]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.RagingPulverize:
        return (widget.skillMap[DruidSkill.PrimalPulverize]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PrimalShred:
        return (widget.skillMap[DruidSkill.RagingShred]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.RagingShred:
        return (widget.skillMap[DruidSkill.PrimalShred]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PrimalLandSlide:
        return (widget.skillMap[DruidSkill.RagingLandSlide]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.RagingLandSlide:
        return (widget.skillMap[DruidSkill.PrimalLandSlide]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.InnateEarthenBulwark:
        return (widget.skillMap[DruidSkill.PreservingEarthenBulwark]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PreservingEarthenBulwark:
        return (widget.skillMap[DruidSkill.InnateEarthenBulwark]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.InnateCycloneArmor:
        return (widget.skillMap[DruidSkill.PreservingCycloneArmor]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PreservingCycloneArmor:
        return (widget.skillMap[DruidSkill.InnateCycloneArmor]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.InnateBloodHowl:
        return (widget.skillMap[DruidSkill.PreservingBloodHowl]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PreservingBloodHowl:
        return (widget.skillMap[DruidSkill.InnateBloodHowl]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.InnateDebilitatingRoar:
        return (widget.skillMap[DruidSkill.PreservingDebilitatingRoar]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PreservingDebilitatingRoar:
        return (widget.skillMap[DruidSkill.InnateDebilitatingRoar]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.BrutalWolves:
        return (widget.skillMap[DruidSkill.FerociousWolves]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FerociousWolves:
        return (widget.skillMap[DruidSkill.BrutalWolves]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.BrutalRavens:
        return (widget.skillMap[DruidSkill.FerociousRavens]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FerociousRavens:
        return (widget.skillMap[DruidSkill.BrutalRavens]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.BrutalPoisonCreeper:
        return (widget.skillMap[DruidSkill.FerociousPoisonCreeper]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FerociousPoisonCreeper:
        return (widget.skillMap[DruidSkill.BrutalPoisonCreeper]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.NaturalBoulder:
        return (widget
                    .skillMap[DruidSkill.SavageBoulder]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.SavageBoulder:
        return (widget
                    .skillMap[DruidSkill.NaturalBoulder]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.NaturalTrample:
        return (widget
                    .skillMap[DruidSkill.SavageTrample]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.SavageTrample:
        return (widget
                    .skillMap[DruidSkill.NaturalTrample]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.NaturalHurricane:
        return (widget.skillMap[DruidSkill.SavageHurricane]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.SavageHurricane:
        return (widget.skillMap[DruidSkill.NaturalHurricane]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.NaturalRabies:
        return (widget.skillMap[DruidSkill.SavageRabies]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.SavageRabies:
        return (widget
                    .skillMap[DruidSkill.NaturalRabies]?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.AcolytesBoneSplinters:
        return (widget.skillMap[NecromancerSkill.InitiatesBoneSplinters]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.InitiatesBoneSplinters:
        return (widget.skillMap[NecromancerSkill.AcolytesBoneSplinters]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.AcolytesDecompose:
        return (widget.skillMap[NecromancerSkill.InitiatesDecompose]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.InitiatesDecompose:
        return (widget.skillMap[NecromancerSkill.AcolytesDecompose]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.AcolytesHemorrhage:
        return (widget.skillMap[NecromancerSkill.InitiatesHemorrhage]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.InitiatesHemorrhage:
        return (widget.skillMap[NecromancerSkill.AcolytesHemorrhage]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.AcolytesReap:
        return (widget.skillMap[NecromancerSkill.InitiatesReap]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.InitiatesReap:
        return (widget.skillMap[NecromancerSkill.AcolytesReap]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.ParanormalBlight:
        return (widget.skillMap[NecromancerSkill.SupernaturalBlight]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.SupernaturalBlight:
        return (widget.skillMap[NecromancerSkill.ParanormalBlight]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.ParanormalBloodLance:
        return (widget.skillMap[NecromancerSkill.SupernaturalBloodLance]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.SupernaturalBloodLance:
        return (widget.skillMap[NecromancerSkill.ParanormalBloodLance]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.ParanormalBloodSurge:
        return (widget.skillMap[NecromancerSkill.SupernaturalBloodSurge]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.SupernaturalBloodSurge:
        return (widget.skillMap[NecromancerSkill.ParanormalBloodSurge]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.ParanormalBoneSpear:
        return (widget.skillMap[NecromancerSkill.SupernaturalBoneSpear]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.SupernaturalBoneSpear:
        return (widget.skillMap[NecromancerSkill.ParanormalBoneSpear]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.ParanormalSever:
        return (widget.skillMap[NecromancerSkill.SupernaturalSever]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.SupernaturalSever:
        return (widget.skillMap[NecromancerSkill.ParanormalSever]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.DreadfulBloodMist:
        return (widget.skillMap[NecromancerSkill.GhastlyBloodMist]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.GhastlyBloodMist:
        return (widget.skillMap[NecromancerSkill.DreadfulBloodMist]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.DreadfulBonePrison:
        return (widget.skillMap[NecromancerSkill.GhastlyBonePrison]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.GhastlyBonePrison:
        return (widget.skillMap[NecromancerSkill.DreadfulBonePrison]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.BlightedCorpseExplosion:
        return (widget.skillMap[NecromancerSkill.PlaguedCorpseExplosion]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.PlaguedCorpseExplosion:
        return (widget.skillMap[NecromancerSkill.BlightedCorpseExplosion]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.AbhorrentDecrepify:
        return (widget.skillMap[NecromancerSkill.HorridDecrepify]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.HorridDecrepify:
        return (widget.skillMap[NecromancerSkill.AbhorrentDecrepify]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.AbhorrentIronMaiden:
        return (widget.skillMap[NecromancerSkill.HorridIronMaiden]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.HorridIronMaiden:
        return (widget.skillMap[NecromancerSkill.AbhorrentIronMaiden]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.DreadfulBoneSpirit:
        return (widget.skillMap[NecromancerSkill.GhastlyBoneSpirit]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.GhastlyBoneSpirit:
        return (widget.skillMap[NecromancerSkill.DreadfulBoneSpirit]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.BlightedCorpseTendrils:
        return (widget.skillMap[NecromancerSkill.PlaguedCorpseTendrils]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.PlaguedCorpseTendrils:
        return (widget.skillMap[NecromancerSkill.BlightedCorpseTendrils]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.FundamentalBladeShift:
        return (widget.skillMap[RogueSkill.PrimaryBladeShift]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.PrimaryBladeShift:
        return (widget.skillMap[RogueSkill.FundamentalBladeShift]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.FundamentalForcefulArrow:
        return (widget.skillMap[RogueSkill.PrimaryForcefulArrow]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.PrimaryForcefulArrow:
        return (widget.skillMap[RogueSkill.FundamentalForcefulArrow]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.FundamentalHeartseeker:
        return (widget.skillMap[RogueSkill.PrimaryHeartseeker]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.PrimaryHeartseeker:
        return (widget.skillMap[RogueSkill.FundamentalHeartseeker]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.FundamentalInvigoratingStrike:
        return (widget.skillMap[RogueSkill.PrimaryInvigoratingStrike]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.PrimaryInvigoratingStrike:
        return (widget.skillMap[RogueSkill.FundamentalInvigoratingStrike]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.FundamentalPuncture:
        return (widget.skillMap[RogueSkill.PrimaryPuncture]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.PrimaryPuncture:
        return (widget.skillMap[RogueSkill.FundamentalPuncture]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.AdvancedBarrage:
        return (widget.skillMap[RogueSkill.ImprovedBarrage]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.ImprovedBarrage:
        return (widget.skillMap[RogueSkill.AdvancedBarrage]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.AdvancedFlurry:
        return (widget
                    .skillMap[RogueSkill.ImprovedFlurry]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.ImprovedFlurry:
        return (widget
                    .skillMap[RogueSkill.AdvancedFlurry]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.AdvancedPenetratingShot:
        return (widget.skillMap[RogueSkill.ImprovedPenetratingShot]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.ImprovedPenetratingShot:
        return (widget.skillMap[RogueSkill.AdvancedPenetratingShot]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.AdvancedRapidFire:
        return (widget.skillMap[RogueSkill.ImprovedRapidFire]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.ImprovedRapidFire:
        return (widget.skillMap[RogueSkill.AdvancedRapidFire]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.AdvancedTwistingBlades:
        return (widget.skillMap[RogueSkill.ImprovedTwistingBlades]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.ImprovedTwistingBlades:
        return (widget.skillMap[RogueSkill.AdvancedTwistingBlades]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.DisciplinedCaltrops:
        return (widget.skillMap[RogueSkill.MethodicalCaltrops]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.MethodicalCaltrops:
        return (widget.skillMap[RogueSkill.DisciplinedCaltrops]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.DisciplinedDash:
        return (widget
                    .skillMap[RogueSkill.MethodicalDash]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.MethodicalDash:
        return (widget.skillMap[RogueSkill.DisciplinedDash]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.DisciplinedShadowStep:
        return (widget.skillMap[RogueSkill.MethodicalShadowStep]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.MethodicalShadowStep:
        return (widget.skillMap[RogueSkill.DisciplinedShadowStep]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.CounteringConcealment:
        return (widget.skillMap[RogueSkill.SubvertingConcealment]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.SubvertingConcealment:
        return (widget.skillMap[RogueSkill.CounteringConcealment]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.CounteringDarkShroud:
        return (widget.skillMap[RogueSkill.SubvertingDarkShroud]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.SubvertingDarkShroud:
        return (widget.skillMap[RogueSkill.CounteringDarkShroud]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.CounteringPoisonTrap:
        return (widget.skillMap[RogueSkill.SubvertingPoisonTrap]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.SubvertingPoisonTrap:
        return (widget.skillMap[RogueSkill.CounteringPoisonTrap]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.CounteringSmokeGrenade:
        return (widget.skillMap[RogueSkill.SubvertingSmokeGrenade]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.SubvertingSmokeGrenade:
        return (widget.skillMap[RogueSkill.CounteringSmokeGrenade]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.BlendedColdImbuement:
        return (widget.skillMap[RogueSkill.MixedColdImbuement]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.MixedColdImbuement:
        return (widget.skillMap[RogueSkill.BlendedColdImbuement]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.BlendedPoisonImbuement:
        return (widget.skillMap[RogueSkill.MixedPoisonImbuement]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.MixedPoisonImbuement:
        return (widget.skillMap[RogueSkill.BlendedPoisonImbuement]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.BlendedShadowImbuement:
        return (widget.skillMap[RogueSkill.MixedShadowImbuement]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.MixedShadowImbuement:
        return (widget.skillMap[RogueSkill.BlendedShadowImbuement]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.FlickeringSpark:
        return (widget.skillMap[SorcererSkill.GlintingSpark]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GlintingSpark:
        return (widget.skillMap[SorcererSkill.FlickeringSpark]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.FlickeringFrostBolt:
        return (widget.skillMap[SorcererSkill.GlintingFrostBolt]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GlintingFrostBolt:
        return (widget.skillMap[SorcererSkill.FlickeringFrostBolt]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.FlickeringFireBolt:
        return (widget.skillMap[SorcererSkill.GlintingFireBolt]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GlintingFireBolt:
        return (widget.skillMap[SorcererSkill.FlickeringFireBolt]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.FlickeringArcLash:
        return (widget.skillMap[SorcererSkill.GlintingArcLash]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GlintingArcLash:
        return (widget.skillMap[SorcererSkill.FlickeringArcLash]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveChainLightning:
        return (widget.skillMap[SorcererSkill.GreaterChainLightning]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterChainLightning:
        return (widget.skillMap[SorcererSkill.DestructiveChainLightning]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveChargedBolts:
        return (widget.skillMap[SorcererSkill.GreaterChargedBolts]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterChargedBolts:
        return (widget.skillMap[SorcererSkill.DestructiveChargedBolts]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveFireball:
        return (widget.skillMap[SorcererSkill.GreaterFireball]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterFireball:
        return (widget.skillMap[SorcererSkill.DestructiveFireball]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveFrozenOrb:
        return (widget.skillMap[SorcererSkill.GreaterFrozenOrb]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterFrozenOrb:
        return (widget.skillMap[SorcererSkill.DestructiveFrozenOrb]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveIncinerate:
        return (widget.skillMap[SorcererSkill.GreaterIncinerate]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterIncinerate:
        return (widget.skillMap[SorcererSkill.DestructiveIncinerate]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveIceShards:
        return (widget.skillMap[SorcererSkill.GreaterIceShards]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterIceShards:
        return (widget.skillMap[SorcererSkill.DestructiveIceShards]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MysticalFlameShield:
        return (widget.skillMap[SorcererSkill.ShimmeringFlameShield]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.ShimmeringFlameShield:
        return (widget.skillMap[SorcererSkill.MysticalFlameShield]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MysticalIceArmor:
        return (widget.skillMap[SorcererSkill.ShimmeringIceArmor]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.ShimmeringIceArmor:
        return (widget.skillMap[SorcererSkill.MysticalIceArmor]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MysticalTeleport:
        return (widget.skillMap[SorcererSkill.ShimmeringTeleport]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.ShimmeringTeleport:
        return (widget.skillMap[SorcererSkill.MysticalTeleport]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MysticalFrostNova:
        return (widget.skillMap[SorcererSkill.ShimmeringFrostNova]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.ShimmeringFrostNova:
        return (widget.skillMap[SorcererSkill.MysticalFrostNova]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.InvokedHydra:
        return (widget.skillMap[SorcererSkill.SummonedHydra]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.SummonedHydra:
        return (widget.skillMap[SorcererSkill.InvokedHydra]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.InvokedIceBlades:
        return (widget.skillMap[SorcererSkill.SummonedIceBlades]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.SummonedIceBlades:
        return (widget.skillMap[SorcererSkill.InvokedIceBlades]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.InvokedLightningSpear:
        return (widget.skillMap[SorcererSkill.SummonedLightningSpear]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.SummonedLightningSpear:
        return (widget.skillMap[SorcererSkill.InvokedLightningSpear]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MagesBlizzard:
        return (widget.skillMap[SorcererSkill.WizardsBlizzard]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.WizardsBlizzard:
        return (widget.skillMap[SorcererSkill.MagesBlizzard]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MagesFirewall:
        return (widget.skillMap[SorcererSkill.WizardsFirewall]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.WizardsFirewall:
        return (widget.skillMap[SorcererSkill.MagesFirewall]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MagesMeteor:
        return (widget.skillMap[SorcererSkill.WizardsMeteor]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.WizardsMeteor:
        return (widget
                    .skillMap[SorcererSkill.MagesMeteor]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MagesBallLightning:
        return (widget.skillMap[SorcererSkill.WizardsBallLightning]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.WizardsBallLightning:
        return (widget.skillMap[SorcererSkill.MagesBallLightning]
                    ?.assignedSkillPoints ??
                0) ==
            0;

      /* Ultimate */
      case BarbarianSkill.CallOfTheAncients:
        return (widget.skillMap[BarbarianSkill.IronMaelstrom]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[BarbarianSkill.WrathOfTheBerserker]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case BarbarianSkill.IronMaelstrom:
        return (widget.skillMap[BarbarianSkill.CallOfTheAncients]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[BarbarianSkill.WrathOfTheBerserker]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case BarbarianSkill.WrathOfTheBerserker:
        return (widget.skillMap[BarbarianSkill.CallOfTheAncients]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[BarbarianSkill.IronMaelstrom]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.GrizzlyRage:
        return (widget.skillMap[DruidSkill.Petrify]?.assignedSkillPoints ?? 0) +
                (widget.skillMap[DruidSkill.Lacerate]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.Cataclysm]?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.Petrify:
        return (widget.skillMap[DruidSkill.GrizzlyRage]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.Lacerate]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.Cataclysm]?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.Lacerate:
        return (widget.skillMap[DruidSkill.GrizzlyRage]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.Petrify]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.Cataclysm]?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.Cataclysm:
        return (widget.skillMap[DruidSkill.GrizzlyRage]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.Petrify]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.Lacerate]?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.ArmyOfTheDead:
        return (widget.skillMap[NecromancerSkill.BloodWave]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[NecromancerSkill.BoneStorm]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.BloodWave:
        return (widget.skillMap[NecromancerSkill.ArmyOfTheDead]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[NecromancerSkill.BoneStorm]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.BoneStorm:
        return (widget.skillMap[NecromancerSkill.ArmyOfTheDead]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[NecromancerSkill.BloodWave]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case RogueSkill.DeathTrap:
        return (widget.skillMap[RogueSkill.RainOfArrows]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[RogueSkill.ShadowClone]?.assignedSkillPoints ??
                    0) ==
            0;
      case RogueSkill.RainOfArrows:
        return (widget.skillMap[RogueSkill.DeathTrap]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[RogueSkill.ShadowClone]?.assignedSkillPoints ??
                    0) ==
            0;
      case RogueSkill.ShadowClone:
        return (widget.skillMap[RogueSkill.DeathTrap]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[RogueSkill.RainOfArrows]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case SorcererSkill.DeepFreeze:
        return (widget.skillMap[SorcererSkill.Inferno]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.UnstableCurrents]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case SorcererSkill.Inferno:
        return (widget.skillMap[SorcererSkill.DeepFreeze]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.UnstableCurrents]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case SorcererSkill.UnstableCurrents:
        return (widget.skillMap[SorcererSkill.DeepFreeze]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.Inferno]?.assignedSkillPoints ??
                    0) ==
            0;

      /* Key Passive */
      case BarbarianSkill.Unconstrained:
        return (widget.skillMap[BarbarianSkill.WalkingArsenal]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[BarbarianSkill.UnbridledRage]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[BarbarianSkill.GushingWounds]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case BarbarianSkill.WalkingArsenal:
        return (widget.skillMap[BarbarianSkill.Unconstrained]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[BarbarianSkill.UnbridledRage]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[BarbarianSkill.GushingWounds]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case BarbarianSkill.UnbridledRage:
        return (widget.skillMap[BarbarianSkill.Unconstrained]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[BarbarianSkill.WalkingArsenal]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[BarbarianSkill.GushingWounds]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case BarbarianSkill.GushingWounds:
        return (widget.skillMap[BarbarianSkill.Unconstrained]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[BarbarianSkill.WalkingArsenal]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[BarbarianSkill.UnbridledRage]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.NaturesFury:
        return (widget.skillMap[DruidSkill.EarthenMight]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.LupineFerocity]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.BestialRampage]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.PerfectStorm]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.UrsineStrength]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.EarthenMight:
        return (widget.skillMap[DruidSkill.NaturesFury]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.LupineFerocity]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.BestialRampage]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.PerfectStorm]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.UrsineStrength]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.LupineFerocity:
        return (widget.skillMap[DruidSkill.NaturesFury]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.EarthenMight]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.BestialRampage]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.PerfectStorm]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.UrsineStrength]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.BestialRampage:
        return (widget.skillMap[DruidSkill.NaturesFury]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.EarthenMight]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.LupineFerocity]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.PerfectStorm]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.UrsineStrength]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.PerfectStorm:
        return (widget.skillMap[DruidSkill.NaturesFury]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.EarthenMight]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.LupineFerocity]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.BestialRampage]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.UrsineStrength]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.UrsineStrength:
        return (widget.skillMap[DruidSkill.NaturesFury]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.EarthenMight]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.LupineFerocity]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.BestialRampage]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[DruidSkill.PerfectStorm]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.OssifiedEssence:
        return (widget.skillMap[NecromancerSkill.RathmasVigor]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[NecromancerSkill.Shadowblight]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[NecromancerSkill.KalansEdict]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.RathmasVigor:
        return (widget.skillMap[NecromancerSkill.OssifiedEssence]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[NecromancerSkill.Shadowblight]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[NecromancerSkill.KalansEdict]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.Shadowblight:
        return (widget.skillMap[NecromancerSkill.OssifiedEssence]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[NecromancerSkill.RathmasVigor]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[NecromancerSkill.KalansEdict]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.KalansEdict:
        return (widget.skillMap[NecromancerSkill.OssifiedEssence]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[NecromancerSkill.RathmasVigor]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[NecromancerSkill.Shadowblight]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case RogueSkill.Momentum:
        return (widget.skillMap[RogueSkill.CloseQuartersCombat]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[RogueSkill.Precision]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[RogueSkill.Victimize]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[RogueSkill.Exposure]?.assignedSkillPoints ??
                    0) ==
            0;
      case RogueSkill.CloseQuartersCombat:
        return (widget.skillMap[RogueSkill.Momentum]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[RogueSkill.Precision]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[RogueSkill.Victimize]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[RogueSkill.Exposure]?.assignedSkillPoints ??
                    0) ==
            0;
      case RogueSkill.Precision:
        return (widget.skillMap[RogueSkill.Momentum]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[RogueSkill.CloseQuartersCombat]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[RogueSkill.Victimize]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[RogueSkill.Exposure]?.assignedSkillPoints ??
                    0) ==
            0;
      case RogueSkill.Victimize:
        return (widget.skillMap[RogueSkill.Momentum]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[RogueSkill.CloseQuartersCombat]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[RogueSkill.Precision]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[RogueSkill.Exposure]?.assignedSkillPoints ??
                    0) ==
            0;
      case RogueSkill.Exposure:
        return (widget.skillMap[RogueSkill.Momentum]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[RogueSkill.CloseQuartersCombat]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[RogueSkill.Precision]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[RogueSkill.Victimize]?.assignedSkillPoints ??
                    0) ==
            0;
      case SorcererSkill.Avalanche:
        return (widget.skillMap[SorcererSkill.Shatter]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.OverflowingEnergy]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.VyrsMastery]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.EsusFerocity]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.Combustion]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case SorcererSkill.Shatter:
        return (widget.skillMap[SorcererSkill.Avalanche]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.OverflowingEnergy]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.VyrsMastery]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.EsusFerocity]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.Combustion]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case SorcererSkill.OverflowingEnergy:
        return (widget.skillMap[SorcererSkill.Avalanche]?.assignedSkillPoints ??
                    0) +
                (widget
                        .skillMap[SorcererSkill.Shatter]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.VyrsMastery]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.EsusFerocity]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.Combustion]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case SorcererSkill.VyrsMastery:
        return (widget.skillMap[SorcererSkill.Avalanche]?.assignedSkillPoints ??
                    0) +
                (widget
                        .skillMap[SorcererSkill.Shatter]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.OverflowingEnergy]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.EsusFerocity]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.Combustion]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case SorcererSkill.EsusFerocity:
        return (widget.skillMap[SorcererSkill.Avalanche]?.assignedSkillPoints ??
                    0) +
                (widget
                        .skillMap[SorcererSkill.Shatter]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.OverflowingEnergy]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.VyrsMastery]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.Combustion]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case SorcererSkill.Combustion:
        return (widget.skillMap[SorcererSkill.Avalanche]?.assignedSkillPoints ??
                    0) +
                (widget
                        .skillMap[SorcererSkill.Shatter]?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.OverflowingEnergy]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.VyrsMastery]
                        ?.assignedSkillPoints ??
                    0) +
                (widget.skillMap[SorcererSkill.EsusFerocity]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      default:
        return true;
    }
  }

  bool get _parentsThresholdIsMet {
    switch (widget.skillTree.element) {
      case BarbarianSkill.ExposeVulnerability:
        return (widget.skillMap[BarbarianSkill.NoMercy]?.assignedSkillPoints ??
                    0) >
                0 ||
            (widget.skillMap[BarbarianSkill.SlayingStrike]
                        ?.assignedSkillPoints ??
                    0) >
                0;
      case BarbarianSkill.BruteForce:
        return (widget.skillMap[BarbarianSkill.HeavyHanded]
                        ?.assignedSkillPoints ??
                    0) >
                0 ||
            (widget.skillMap[BarbarianSkill.Wallop]?.assignedSkillPoints ?? 0) >
                0;
      case DruidSkill.BadOmen:
        return (widget.skillMap[DruidSkill.ChargedAtmosphere]
                        ?.assignedSkillPoints ??
                    0) >
                0 ||
            (widget.skillMap[DruidSkill.EndlessTempest]?.assignedSkillPoints ??
                    0) >
                0;
      case DruidSkill.Unrestrained:
        return (widget.skillMap[DruidSkill.ThickHide]?.assignedSkillPoints ??
                    0) >
                0 ||
            (widget.skillMap[DruidSkill.NaturesResolve]?.assignedSkillPoints ??
                    0) >
                0;
      case DruidSkill.Resonance:
        return (widget.skillMap[DruidSkill.NaturalDisaster]
                        ?.assignedSkillPoints ??
                    0) >
                0 ||
            (widget.skillMap[DruidSkill.CircleOfLife]?.assignedSkillPoints ??
                    0) >
                0;
      case NecromancerSkill.TidesOfBlood:
        return (widget.skillMap[NecromancerSkill.Transfusion]
                        ?.assignedSkillPoints ??
                    0) >
                0 ||
            (widget.skillMap[NecromancerSkill.CoalescedBlood]
                        ?.assignedSkillPoints ??
                    0) >
                0;
      case NecromancerSkill.Evulsion:
        return (widget.skillMap[NecromancerSkill.CompoundFracture]
                        ?.assignedSkillPoints ??
                    0) >
                0 ||
            (widget.skillMap[NecromancerSkill.RapidOssification]
                        ?.assignedSkillPoints ??
                    0) >
                0;
      case NecromancerSkill.Terror:
        return (widget.skillMap[NecromancerSkill.Gloom]?.assignedSkillPoints ??
                    0) >
                0 ||
            (widget.skillMap[NecromancerSkill.CripplingDarkness]
                        ?.assignedSkillPoints ??
                    0) >
                0;
      case RogueSkill.TrickAttacks:
        return (widget.skillMap[RogueSkill.Concussive]?.assignedSkillPoints ??
                    0) >
                0 ||
            (widget.skillMap[RogueSkill.RapidGambits]?.assignedSkillPoints ??
                    0) >
                0;
      case SorcererSkill.FrigidBreeze:
        return (widget.skillMap[SorcererSkill.Hoarfrost]?.assignedSkillPoints ??
                    0) >
                0 ||
            (widget.skillMap[SorcererSkill.IcyTouch]?.assignedSkillPoints ??
                    0) >
                0;
      case SorcererSkill.Warmth:
        return (widget.skillMap[SorcererSkill.EndlessPyre]
                        ?.assignedSkillPoints ??
                    0) >
                0 ||
            (widget.skillMap[SorcererSkill.Soulfire]?.assignedSkillPoints ??
                    0) >
                0;
      case SorcererSkill.Convulsions:
        return (widget.skillMap[SorcererSkill.Conduction]
                        ?.assignedSkillPoints ??
                    0) >
                0 ||
            (widget.skillMap[SorcererSkill.Electrocution]
                        ?.assignedSkillPoints ??
                    0) >
                0;
      default:
        if (_isNotCluster(widget.parent)) {
          return (widget.skillMap[widget.parent]?.assignedSkillPoints ?? 0) > 0;
        } else {
          return true;
        }
    }
  }

  int get _maxSkillReduction {
    if ((widget.skillMap[widget.skillTree.element]?.assignedSkillPoints ?? 0) ==
        0) {
      return 0;
    } else if (widget.skillTree.children.fold(
            0,
            (b, a) =>
                b +
                a.fold(
                    0,
                    (d, c) =>
                        d + (widget.skillMap[c]?.assignedSkillPoints ?? 0))) ==
        0) {
      return min(
          widget.skillMap[widget.skillTree.element]?.assignedSkillPoints ?? 0,
          widget.maxClusterReduction);
    } else {
      return min(
          (widget.skillMap[widget.skillTree.element]?.assignedSkillPoints ??
                  0) -
              1,
          widget.maxClusterReduction);
    }
  }

  bool get _isIncrementable =>
      widget.isClusterUnlocked &&
      (widget.skillMap[widget.skillTree.element]?.assignedSkillPoints ?? 0) <
          _maxAssignedOf(widget.skillTree.element) &&
      _parentsThresholdIsMet &&
      _isUnique;

  Color get _foregroundColor => _isIncrementable ||
          (widget.skillMap[widget.skillTree.element]?.assignedSkillPoints ??
                  0) >
              0
      ? Theme.of(context).primaryColor
      : Theme.of(context).disabledColor;

  @override
  Widget build(BuildContext context) {
    Widget title = TextButton(
      child: Text(
        EnumUtils.enumToNameWithSpaces(widget.skillTree.element),
        style: TextStyle(
          color: _foregroundColor,
        ),
      ),
      onPressed: () => showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, setState) {
            List<String> description;
            List<Widget> info;
            Enum skill = widget.skillTree.element;
            int level = widget.skillMap[skill]?.assignedSkillPoints ?? 0;
            if (skill is BarbarianSkill) {
              description = Barbarian.descriptionOf(skill, level);
            } else if (widget.skillTree.element is DruidSkill) {
              description = Druid.descriptionOf(skill as DruidSkill, level);
            } else if (widget.skillTree.element is NecromancerSkill) {
              description =
                  Necromancer.descriptionOf(skill as NecromancerSkill, level);
            } else if (widget.skillTree.element is RogueSkill) {
              description = Rogue.descriptionOf(skill as RogueSkill, level);
            } else if (widget.skillTree.element is SorcererSkill) {
              description =
                  Sorcerer.descriptionOf(skill as SorcererSkill, level);
            } else {
              description = [];
            }
            info = [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: null,
                        child: Text(
                          EnumUtils.enumToNameWithSpaces(skill),
                          style: TextStyle(
                            color: _foregroundColor,
                          ),
                        ),
                      ),
                    ),
                    trailing: AllocationWidget(
                      skill,
                      level: level,
                      maxAssignedLevel: _maxAssignedOf(skill),
                      onPressed: () {
                        if (_isIncrementable) {
                          setState(() {
                            widget.callback(skill, 1);
                          });
                        }
                      },
                      onLongPress: () {
                        if (_maxSkillReduction > 0) {
                          setState(() {
                            widget.callback(skill, -_maxSkillReduction);
                          });
                        }
                      },
                      color: _foregroundColor,
                    ),
                  ),
                  const Divider(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: description.fold([], (b, a) {
                  b.add(const SizedBox(height: 16));
                  b.add(Text(a));
                  return b;
                }),
              ),
              const SizedBox(height: 16),
            ];
            return Dialog(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: info,
                ),
              ),
            );
          },
        ),
      ),
    );
    Widget trailing = AllocationWidget(widget.skillTree.element,
        level:
            widget.skillMap[widget.skillTree.element]?.assignedSkillPoints ?? 0,
        maxAssignedLevel: _maxAssignedOf(widget.skillTree.element),
        onPressed: () {
      if (_isIncrementable) {
        widget.callback(widget.skillTree.element, 1);
      }
    }, onLongPress: () {
      if (_maxSkillReduction > 0) {
        widget.callback(widget.skillTree.element, -_maxSkillReduction);
      }
    }, color: _foregroundColor);
    return widget.skillTree.children.isEmpty
        ? ListTile(
            shape: const Border(),
            leading: const Icon(null),
            title: Align(
              alignment: Alignment.centerLeft,
              child: title,
            ),
            trailing: trailing,
          )
        : ExpansionTile(
            title: Align(
              alignment: Alignment.centerLeft,
              child: title,
            ),
            textColor: _foregroundColor,
            collapsedTextColor: _foregroundColor,
            shape: const Border(),
            collapsedShape: const Border(),
            onExpansionChanged: (value) {
              setState(() {
                _isExpanded = value;
              });
            },
            leading: AnimatedRotation(
              turns: _isExpanded ? -0.25 : 0,
              duration: const Duration(milliseconds: 200),
              child: Icon(
                Icons.expand_more,
                color: _foregroundColor,
              ),
            ),
            trailing: trailing,
            children: widget.skillTree.children
                .map(
                  (child) => SkillWidget(
                    parent: widget.skillTree.element,
                    isClusterUnlocked: widget.isClusterUnlocked,
                    maxClusterReduction: widget.maxClusterReduction,
                    skillTree: child,
                    skillMap: widget.skillMap,
                    callback: widget.callback,
                  ),
                )
                .toList(growable: false),
          );
  }
}
