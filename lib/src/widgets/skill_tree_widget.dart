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

class SkillTreeWidget extends StatefulWidget {
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

  @override
  State<SkillTreeWidget> createState() => _SkillTreeWidgetState();
}

class _SkillTreeWidgetState extends State<SkillTreeWidget> {
  Tree<Enum> _skill = Tree(element: BarbarianSkill.Bash);
  Map<Enum, Skill> _skills = {};

  @override
  void initState() {
    _skill = widget.skill;
    _skills = widget.skills;
    super.initState();
  }

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
    switch (_skill.element) {
      /* Upgrade */
      case BarbarianSkill.BattleBash:
        return (_skills[BarbarianSkill.CombatBash]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.CombatBash:
        return (_skills[BarbarianSkill.BattleBash]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.BattleFlay:
        return (_skills[BarbarianSkill.CombatFlay]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.CombatFlay:
        return (_skills[BarbarianSkill.BattleFlay]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.BattleFrenzy:
        return (_skills[BarbarianSkill.CombatFrenzy]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.CombatFrenzy:
        return (_skills[BarbarianSkill.BattleFrenzy]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.BattleLungingStrike:
        return (_skills[BarbarianSkill.CombatLungingStrike]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.CombatLungingStrike:
        return (_skills[BarbarianSkill.BattleLungingStrike]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FuriousDoubleSwing:
        return (_skills[BarbarianSkill.ViolentDoubleSwing]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.ViolentDoubleSwing:
        return (_skills[BarbarianSkill.FuriousDoubleSwing]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FuriousHammerOfTheAncients:
        return (_skills[BarbarianSkill.ViolentHammerOfTheAncients]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.ViolentHammerOfTheAncients:
        return (_skills[BarbarianSkill.FuriousHammerOfTheAncients]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FuriousRend:
        return (_skills[BarbarianSkill.ViolentRend]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.ViolentRend:
        return (_skills[BarbarianSkill.FuriousRend]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FuriousUpheaval:
        return (_skills[BarbarianSkill.ViolentUpheaval]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.ViolentUpheaval:
        return (_skills[BarbarianSkill.FuriousUpheaval]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FuriousWhirlwind:
        return (_skills[BarbarianSkill.ViolentWhirlwind]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.ViolentWhirlwind:
        return (_skills[BarbarianSkill.FuriousWhirlwind]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.StrategicChallengingShout:
        return (_skills[BarbarianSkill.TacticalChallengingShout]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.TacticalChallengingShout:
        return (_skills[BarbarianSkill.StrategicChallengingShout]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.StrategicGroundStomp:
        return (_skills[BarbarianSkill.TacticalGroundStomp]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.TacticalGroundStomp:
        return (_skills[BarbarianSkill.StrategicGroundStomp]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.StrategicIronSkin:
        return (_skills[BarbarianSkill.TacticalIronSkin]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.TacticalIronSkin:
        return (_skills[BarbarianSkill.StrategicIronSkin]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.StrategicRallyingCry:
        return (_skills[BarbarianSkill.TacticalRallyingCry]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.TacticalRallyingCry:
        return (_skills[BarbarianSkill.StrategicRallyingCry]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.MightyCharge:
        return (_skills[BarbarianSkill.PowerCharge]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.PowerCharge:
        return (_skills[BarbarianSkill.MightyCharge]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.MightyKick:
        return (_skills[BarbarianSkill.PowerKick]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.PowerKick:
        return (_skills[BarbarianSkill.MightyKick]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.MightyLeap:
        return (_skills[BarbarianSkill.PowerLeap]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.PowerLeap:
        return (_skills[BarbarianSkill.MightyLeap]?.assignedSkillPoints ?? 0) ==
            0;
      case BarbarianSkill.MightyWarCry:
        return (_skills[BarbarianSkill.PowerWarCry]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.PowerWarCry:
        return (_skills[BarbarianSkill.MightyWarCry]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FightersDeathBlow:
        return (_skills[BarbarianSkill.WarriorsDeathBlow]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.WarriorsDeathBlow:
        return (_skills[BarbarianSkill.FightersDeathBlow]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FightersRupture:
        return (_skills[BarbarianSkill.WarriorsRupture]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.WarriorsRupture:
        return (_skills[BarbarianSkill.FightersRupture]?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.FightersSteelGrasp:
        return (_skills[BarbarianSkill.WarriorsSteelGrasp]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case BarbarianSkill.WarriorsSteelGrasp:
        return (_skills[BarbarianSkill.FightersSteelGrasp]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FierceMaul:
        return (_skills[DruidSkill.WildMaul]?.assignedSkillPoints ?? 0) == 0;
      case DruidSkill.WildMaul:
        return (_skills[DruidSkill.FierceMaul]?.assignedSkillPoints ?? 0) == 0;
      case DruidSkill.FierceClaw:
        return (_skills[DruidSkill.WildClaw]?.assignedSkillPoints ?? 0) == 0;
      case DruidSkill.WildClaw:
        return (_skills[DruidSkill.FierceClaw]?.assignedSkillPoints ?? 0) == 0;
      case DruidSkill.FierceStormStrike:
        return (_skills[DruidSkill.WildStormStrike]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.WildStormStrike:
        return (_skills[DruidSkill.FierceStormStrike]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FierceWindShear:
        return (_skills[DruidSkill.WildWindShear]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.WildWindShear:
        return (_skills[DruidSkill.FierceWindShear]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FierceEarthSpike:
        return (_skills[DruidSkill.WildEarthSpike]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.WildEarthSpike:
        return (_skills[DruidSkill.FierceEarthSpike]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PrimalLightningStorm:
        return (_skills[DruidSkill.RagingLightningStorm]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.RagingLightningStorm:
        return (_skills[DruidSkill.PrimalLightningStorm]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PrimalTornado:
        return (_skills[DruidSkill.RagingTornado]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.RagingTornado:
        return (_skills[DruidSkill.PrimalTornado]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.PrimalPulverize:
        return (_skills[DruidSkill.RagingPulverize]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.RagingPulverize:
        return (_skills[DruidSkill.PrimalPulverize]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PrimalShred:
        return (_skills[DruidSkill.RagingShred]?.assignedSkillPoints ?? 0) == 0;
      case DruidSkill.RagingShred:
        return (_skills[DruidSkill.PrimalShred]?.assignedSkillPoints ?? 0) == 0;
      case DruidSkill.PrimalLandSlide:
        return (_skills[DruidSkill.RagingLandSlide]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.RagingLandSlide:
        return (_skills[DruidSkill.PrimalLandSlide]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.InnateEarthenBulwark:
        return (_skills[DruidSkill.PreservingEarthenBulwark]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PreservingEarthenBulwark:
        return (_skills[DruidSkill.InnateEarthenBulwark]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.InnateCycloneArmor:
        return (_skills[DruidSkill.PreservingCycloneArmor]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PreservingCycloneArmor:
        return (_skills[DruidSkill.InnateCycloneArmor]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.InnateBloodHowl:
        return (_skills[DruidSkill.PreservingBloodHowl]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PreservingBloodHowl:
        return (_skills[DruidSkill.InnateBloodHowl]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.InnateDebilitatingRoar:
        return (_skills[DruidSkill.PreservingDebilitatingRoar]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.PreservingDebilitatingRoar:
        return (_skills[DruidSkill.InnateDebilitatingRoar]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.BrutalWolves:
        return (_skills[DruidSkill.FerociousWolves]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FerociousWolves:
        return (_skills[DruidSkill.BrutalWolves]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.BrutalRavens:
        return (_skills[DruidSkill.FerociousRavens]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FerociousRavens:
        return (_skills[DruidSkill.BrutalRavens]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.BrutalVineCreeper:
        return (_skills[DruidSkill.FerociousVineCreeper]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.FerociousVineCreeper:
        return (_skills[DruidSkill.BrutalVineCreeper]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.NaturalBoulder:
        return (_skills[DruidSkill.SavageBoulder]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.SavageBoulder:
        return (_skills[DruidSkill.NaturalBoulder]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.NaturalTrample:
        return (_skills[DruidSkill.SavageTrample]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.SavageTrample:
        return (_skills[DruidSkill.NaturalTrample]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.NaturalHurricane:
        return (_skills[DruidSkill.SavageHurricane]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.SavageHurricane:
        return (_skills[DruidSkill.NaturalHurricane]?.assignedSkillPoints ??
                0) ==
            0;
      case DruidSkill.NaturalRabies:
        return (_skills[DruidSkill.SavageRabies]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.SavageRabies:
        return (_skills[DruidSkill.NaturalRabies]?.assignedSkillPoints ?? 0) ==
            0;
      case NecromancerSkill.AcolytesBoneSplinters:
        return (_skills[NecromancerSkill.InitiatesBoneSplinters]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.InitiatesBoneSplinters:
        return (_skills[NecromancerSkill.AcolytesBoneSplinters]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.AcolytesDecompose:
        return (_skills[NecromancerSkill.InitiatesDecompose]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.InitiatesDecompose:
        return (_skills[NecromancerSkill.AcolytesDecompose]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.AcolytesHemorrhage:
        return (_skills[NecromancerSkill.InitiatesHemorrhage]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.InitiatesHemorrhage:
        return (_skills[NecromancerSkill.AcolytesHemorrhage]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.AcolytesReap:
        return (_skills[NecromancerSkill.InitiatesReap]?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.InitiatesReap:
        return (_skills[NecromancerSkill.AcolytesReap]?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.ParanormalBlight:
        return (_skills[NecromancerSkill.SupernaturalBlight]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.SupernaturalBlight:
        return (_skills[NecromancerSkill.ParanormalBlight]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.ParanormalBloodLance:
        return (_skills[NecromancerSkill.SupernaturalBloodLance]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.SupernaturalBloodLance:
        return (_skills[NecromancerSkill.ParanormalBloodLance]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.ParanormalBloodSurge:
        return (_skills[NecromancerSkill.SupernaturalBloodSurge]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.SupernaturalBloodSurge:
        return (_skills[NecromancerSkill.ParanormalBloodSurge]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.ParanormalBoneSpear:
        return (_skills[NecromancerSkill.SupernaturalBoneSpear]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.SupernaturalBoneSpear:
        return (_skills[NecromancerSkill.ParanormalBoneSpear]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.ParanormalSever:
        return (_skills[NecromancerSkill.SupernaturalSever]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.SupernaturalSever:
        return (_skills[NecromancerSkill.ParanormalSever]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.DreadfulBloodMist:
        return (_skills[NecromancerSkill.GhastlyBloodMist]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.GhastlyBloodMist:
        return (_skills[NecromancerSkill.DreadfulBloodMist]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.DreadfulBonePrison:
        return (_skills[NecromancerSkill.GhastlyBonePrison]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.GhastlyBonePrison:
        return (_skills[NecromancerSkill.DreadfulBonePrison]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.BlightedCorpseExplosion:
        return (_skills[NecromancerSkill.PlaguedCorpseExplosion]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.PlaguedCorpseExplosion:
        return (_skills[NecromancerSkill.BlightedCorpseExplosion]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.AbhorrentDecrepify:
        return (_skills[NecromancerSkill.HorridDecrepify]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.HorridDecrepify:
        return (_skills[NecromancerSkill.AbhorrentDecrepify]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.AbhorrentIronMaiden:
        return (_skills[NecromancerSkill.HorridIronMaiden]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.HorridIronMaiden:
        return (_skills[NecromancerSkill.AbhorrentIronMaiden]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.DreadfulBoneSpirit:
        return (_skills[NecromancerSkill.GhastlyBoneSpirit]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.GhastlyBoneSpirit:
        return (_skills[NecromancerSkill.DreadfulBoneSpirit]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.BlightedCorpseTendrils:
        return (_skills[NecromancerSkill.PlaguedCorpseTendrils]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case NecromancerSkill.PlaguedCorpseTendrils:
        return (_skills[NecromancerSkill.BlightedCorpseTendrils]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.FundamentalBladeShift:
        return (_skills[RogueSkill.PrimaryBladeShift]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.PrimaryBladeShift:
        return (_skills[RogueSkill.FundamentalBladeShift]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.FundamentalForcefulArrow:
        return (_skills[RogueSkill.PrimaryForcefulArrow]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.PrimaryForcefulArrow:
        return (_skills[RogueSkill.FundamentalForcefulArrow]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.FundamentalHeartseeker:
        return (_skills[RogueSkill.PrimaryHeartseeker]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.PrimaryHeartseeker:
        return (_skills[RogueSkill.FundamentalHeartseeker]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.FundamentalInvigoratingStrike:
        return (_skills[RogueSkill.PrimaryInvigoratingStrike]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.PrimaryInvigoratingStrike:
        return (_skills[RogueSkill.FundamentalInvigoratingStrike]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.FundamentalPuncture:
        return (_skills[RogueSkill.PrimaryPuncture]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.PrimaryPuncture:
        return (_skills[RogueSkill.FundamentalPuncture]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.AdvancedBarrage:
        return (_skills[RogueSkill.ImprovedBarrage]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.ImprovedBarrage:
        return (_skills[RogueSkill.AdvancedBarrage]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.AdvancedFlurry:
        return (_skills[RogueSkill.ImprovedFlurry]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.ImprovedFlurry:
        return (_skills[RogueSkill.AdvancedFlurry]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.AdvancedPenetratingShot:
        return (_skills[RogueSkill.ImprovedPenetratingShot]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.ImprovedPenetratingShot:
        return (_skills[RogueSkill.AdvancedPenetratingShot]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.AdvancedRapidFire:
        return (_skills[RogueSkill.ImprovedRapidFire]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.ImprovedRapidFire:
        return (_skills[RogueSkill.AdvancedRapidFire]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.AdvancedTwistingBlades:
        return (_skills[RogueSkill.ImprovedTwistingBlades]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.ImprovedTwistingBlades:
        return (_skills[RogueSkill.AdvancedTwistingBlades]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.DisciplinedCaltrops:
        return (_skills[RogueSkill.MethodicalCaltrops]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.MethodicalCaltrops:
        return (_skills[RogueSkill.DisciplinedCaltrops]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.DisciplinedDash:
        return (_skills[RogueSkill.MethodicalDash]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.MethodicalDash:
        return (_skills[RogueSkill.DisciplinedDash]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.DisciplinedShadowStep:
        return (_skills[RogueSkill.MethodicalShadowStep]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.MethodicalShadowStep:
        return (_skills[RogueSkill.DisciplinedShadowStep]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.CounteringConcealment:
        return (_skills[RogueSkill.SubvertingConcealment]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.SubvertingConcealment:
        return (_skills[RogueSkill.CounteringConcealment]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.CounteringDarkShroud:
        return (_skills[RogueSkill.SubvertingDarkShroud]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.SubvertingDarkShroud:
        return (_skills[RogueSkill.CounteringDarkShroud]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.CounteringPoisonTrap:
        return (_skills[RogueSkill.SubvertingPoisonTrap]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.SubvertingPoisonTrap:
        return (_skills[RogueSkill.CounteringPoisonTrap]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.CounteringSmokeGrenade:
        return (_skills[RogueSkill.SubvertingSmokeGrenade]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.SubvertingSmokeGrenade:
        return (_skills[RogueSkill.CounteringSmokeGrenade]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.BlendedColdImbuement:
        return (_skills[RogueSkill.MixedColdImbuement]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.MixedColdImbuement:
        return (_skills[RogueSkill.BlendedColdImbuement]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.BlendedPoisonImbuement:
        return (_skills[RogueSkill.MixedPoisonImbuement]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.MixedPoisonImbuement:
        return (_skills[RogueSkill.BlendedPoisonImbuement]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.BlendedShadowImbuement:
        return (_skills[RogueSkill.MixedShadowImbuement]?.assignedSkillPoints ??
                0) ==
            0;
      case RogueSkill.MixedShadowImbuement:
        return (_skills[RogueSkill.BlendedShadowImbuement]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.FlickeringSpark:
        return (_skills[SorcererSkill.GlintingSpark]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GlintingSpark:
        return (_skills[SorcererSkill.FlickeringSpark]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.FlickeringFrostBolt:
        return (_skills[SorcererSkill.GlintingFrostBolt]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GlintingFrostBolt:
        return (_skills[SorcererSkill.FlickeringFrostBolt]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.FlickeringFireBolt:
        return (_skills[SorcererSkill.GlintingFireBolt]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GlintingFireBolt:
        return (_skills[SorcererSkill.FlickeringFireBolt]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.FlickeringArcLash:
        return (_skills[SorcererSkill.GlintingArcLash]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GlintingArcLash:
        return (_skills[SorcererSkill.FlickeringArcLash]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveChainLightning:
        return (_skills[SorcererSkill.GreaterChainLightning]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterChainLightning:
        return (_skills[SorcererSkill.DestructiveChainLightning]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveChargedBolts:
        return (_skills[SorcererSkill.GreaterChargedBolts]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterChargedBolts:
        return (_skills[SorcererSkill.DestructiveChargedBolts]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveFireball:
        return (_skills[SorcererSkill.GreaterFireball]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterFireball:
        return (_skills[SorcererSkill.DestructiveFireball]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveFrozenOrb:
        return (_skills[SorcererSkill.GreaterFrozenOrb]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterFrozenOrb:
        return (_skills[SorcererSkill.DestructiveFrozenOrb]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveIncinerate:
        return (_skills[SorcererSkill.GreaterIncinerate]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterIncinerate:
        return (_skills[SorcererSkill.DestructiveIncinerate]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.DestructiveIceShards:
        return (_skills[SorcererSkill.GreaterIceShards]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.GreaterIceShards:
        return (_skills[SorcererSkill.DestructiveIceShards]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MysticalFlameShield:
        return (_skills[SorcererSkill.ShimmeringFlameShield]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.ShimmeringFlameShield:
        return (_skills[SorcererSkill.MysticalFlameShield]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MysticalIceArmor:
        return (_skills[SorcererSkill.ShimmeringIceArmor]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.ShimmeringIceArmor:
        return (_skills[SorcererSkill.MysticalIceArmor]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MysticalTeleport:
        return (_skills[SorcererSkill.ShimmeringTeleport]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.ShimmeringTeleport:
        return (_skills[SorcererSkill.MysticalTeleport]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MysticalFrostNova:
        return (_skills[SorcererSkill.ShimmeringFrostNova]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.ShimmeringFrostNova:
        return (_skills[SorcererSkill.MysticalFrostNova]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.InvokedHydra:
        return (_skills[SorcererSkill.SummonedHydra]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.SummonedHydra:
        return (_skills[SorcererSkill.InvokedHydra]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.InvokedIceBlades:
        return (_skills[SorcererSkill.SummonedIceBlades]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.SummonedIceBlades:
        return (_skills[SorcererSkill.InvokedIceBlades]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.InvokedLightningSpear:
        return (_skills[SorcererSkill.SummonedLightningSpear]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.SummonedLightningSpear:
        return (_skills[SorcererSkill.InvokedLightningSpear]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MagesBlizzard:
        return (_skills[SorcererSkill.WizardsBlizzard]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.WizardsBlizzard:
        return (_skills[SorcererSkill.MagesBlizzard]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MagesFirewall:
        return (_skills[SorcererSkill.WizardsFirewall]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.WizardsFirewall:
        return (_skills[SorcererSkill.MagesFirewall]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.MagesMeteor:
        return (_skills[SorcererSkill.WizardsMeteor]?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.WizardsMeteor:
        return (_skills[SorcererSkill.MagesMeteor]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.MagesBallLightning:
        return (_skills[SorcererSkill.WizardsBallLightning]
                    ?.assignedSkillPoints ??
                0) ==
            0;
      case SorcererSkill.WizardsBallLightning:
        return (_skills[SorcererSkill.MagesBallLightning]
                    ?.assignedSkillPoints ??
                0) ==
            0;

      /* Ultimate */
      case BarbarianSkill.CallOfTheAncients:
        return (_skills[BarbarianSkill.IronMaelstrom]?.assignedSkillPoints ??
                    0) +
                (_skills[BarbarianSkill.WrathOfTheBerserker]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case BarbarianSkill.IronMaelstrom:
        return (_skills[BarbarianSkill.CallOfTheAncients]
                        ?.assignedSkillPoints ??
                    0) +
                (_skills[BarbarianSkill.WrathOfTheBerserker]
                        ?.assignedSkillPoints ??
                    0) ==
            0;
      case BarbarianSkill.WrathOfTheBerserker:
        return (_skills[BarbarianSkill.CallOfTheAncients]
                        ?.assignedSkillPoints ??
                    0) +
                (_skills[BarbarianSkill.IronMaelstrom]?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.GrizzlyRage:
        return (_skills[DruidSkill.Petrify]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.Lacerate]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.Cataclysm]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.Petrify:
        return (_skills[DruidSkill.GrizzlyRage]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.Lacerate]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.Cataclysm]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.Lacerate:
        return (_skills[DruidSkill.GrizzlyRage]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.Petrify]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.Cataclysm]?.assignedSkillPoints ?? 0) ==
            0;
      case DruidSkill.Cataclysm:
        return (_skills[DruidSkill.GrizzlyRage]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.Petrify]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.Lacerate]?.assignedSkillPoints ?? 0) ==
            0;
      case NecromancerSkill.ArmyOfTheDead:
        return (_skills[NecromancerSkill.BloodWave]?.assignedSkillPoints ?? 0) +
                (_skills[NecromancerSkill.BoneStorm]?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.BloodWave:
        return (_skills[NecromancerSkill.ArmyOfTheDead]?.assignedSkillPoints ??
                    0) +
                (_skills[NecromancerSkill.BoneStorm]?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.BoneStorm:
        return (_skills[NecromancerSkill.ArmyOfTheDead]?.assignedSkillPoints ??
                    0) +
                (_skills[NecromancerSkill.BloodWave]?.assignedSkillPoints ??
                    0) ==
            0;
      case RogueSkill.DeathTrap:
        return (_skills[RogueSkill.RainOfArrows]?.assignedSkillPoints ?? 0) +
                (_skills[RogueSkill.ShadowClone]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.RainOfArrows:
        return (_skills[RogueSkill.DeathTrap]?.assignedSkillPoints ?? 0) +
                (_skills[RogueSkill.ShadowClone]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.ShadowClone:
        return (_skills[RogueSkill.DeathTrap]?.assignedSkillPoints ?? 0) +
                (_skills[RogueSkill.RainOfArrows]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.DeepFreeze:
        return (_skills[SorcererSkill.Inferno]?.assignedSkillPoints ?? 0) +
                (_skills[SorcererSkill.UnstableCurrents]?.assignedSkillPoints ??
                    0) ==
            0;
      case SorcererSkill.Inferno:
        return (_skills[SorcererSkill.DeepFreeze]?.assignedSkillPoints ?? 0) +
                (_skills[SorcererSkill.UnstableCurrents]?.assignedSkillPoints ??
                    0) ==
            0;
      case SorcererSkill.UnstableCurrents:
        return (_skills[SorcererSkill.DeepFreeze]?.assignedSkillPoints ?? 0) +
                (_skills[SorcererSkill.Inferno]?.assignedSkillPoints ?? 0) ==
            0;

      /* Key Passive */
      case BarbarianSkill.Unconstrained:
        return (_skills[
                            BarbarianSkill.WalkingArsenal]
                        ?.assignedSkillPoints ??
                    0) +
                (_skills[BarbarianSkill.UnbridledRage]?.assignedSkillPoints ??
                    0) +
                (_skills[BarbarianSkill.GushingWounds]?.assignedSkillPoints ??
                    0) ==
            0;
      case BarbarianSkill.WalkingArsenal:
        return (_skills[BarbarianSkill.Unconstrained]?.assignedSkillPoints ??
                    0) +
                (_skills[BarbarianSkill.UnbridledRage]?.assignedSkillPoints ??
                    0) +
                (_skills[BarbarianSkill.GushingWounds]?.assignedSkillPoints ??
                    0) ==
            0;
      case BarbarianSkill.UnbridledRage:
        return (_skills[BarbarianSkill.Unconstrained]?.assignedSkillPoints ??
                    0) +
                (_skills[BarbarianSkill.WalkingArsenal]?.assignedSkillPoints ??
                    0) +
                (_skills[BarbarianSkill.GushingWounds]?.assignedSkillPoints ??
                    0) ==
            0;
      case BarbarianSkill.GushingWounds:
        return (_skills[BarbarianSkill.Unconstrained]?.assignedSkillPoints ??
                    0) +
                (_skills[BarbarianSkill.WalkingArsenal]?.assignedSkillPoints ??
                    0) +
                (_skills[BarbarianSkill.UnbridledRage]?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.NaturesFury:
        return (_skills[DruidSkill.EarthenMight]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.LupineFerocity]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.BestialRampage]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.PerfectStorm]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.UrsineStrength]?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.EarthenMight:
        return (_skills[DruidSkill.NaturesFury]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.LupineFerocity]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.BestialRampage]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.PerfectStorm]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.UrsineStrength]?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.LupineFerocity:
        return (_skills[DruidSkill.NaturesFury]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.EarthenMight]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.BestialRampage]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.PerfectStorm]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.UrsineStrength]?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.BestialRampage:
        return (_skills[DruidSkill.NaturesFury]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.EarthenMight]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.LupineFerocity]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.PerfectStorm]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.UrsineStrength]?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.PerfectStorm:
        return (_skills[DruidSkill.NaturesFury]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.EarthenMight]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.LupineFerocity]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.BestialRampage]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.UrsineStrength]?.assignedSkillPoints ??
                    0) ==
            0;
      case DruidSkill.UrsineStrength:
        return (_skills[DruidSkill.NaturesFury]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.EarthenMight]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.LupineFerocity]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.BestialRampage]?.assignedSkillPoints ?? 0) +
                (_skills[DruidSkill.PerfectStorm]?.assignedSkillPoints ?? 0) ==
            0;
      case NecromancerSkill.OssifiedEssence:
        return (_skills[NecromancerSkill.RathmasVigor]?.assignedSkillPoints ??
                    0) +
                (_skills[NecromancerSkill.Shadowblight]?.assignedSkillPoints ??
                    0) +
                (_skills[NecromancerSkill.KalansEdict]?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.RathmasVigor:
        return (_skills[NecromancerSkill.OssifiedEssence]
                        ?.assignedSkillPoints ??
                    0) +
                (_skills[NecromancerSkill.Shadowblight]?.assignedSkillPoints ??
                    0) +
                (_skills[NecromancerSkill.KalansEdict]?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.Shadowblight:
        return (_skills[NecromancerSkill.OssifiedEssence]
                        ?.assignedSkillPoints ??
                    0) +
                (_skills[NecromancerSkill.RathmasVigor]?.assignedSkillPoints ??
                    0) +
                (_skills[NecromancerSkill.KalansEdict]?.assignedSkillPoints ??
                    0) ==
            0;
      case NecromancerSkill.KalansEdict:
        return (_skills[NecromancerSkill.OssifiedEssence]
                        ?.assignedSkillPoints ??
                    0) +
                (_skills[NecromancerSkill.RathmasVigor]?.assignedSkillPoints ??
                    0) +
                (_skills[NecromancerSkill.Shadowblight]?.assignedSkillPoints ??
                    0) ==
            0;
      case RogueSkill.Momentum:
        return (_skills[RogueSkill.CloseQuartersCombat]?.assignedSkillPoints ??
                    0) +
                (_skills[RogueSkill.Precision]?.assignedSkillPoints ?? 0) +
                (_skills[RogueSkill.Victimize]?.assignedSkillPoints ?? 0) +
                (_skills[RogueSkill.Exposure]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.CloseQuartersCombat:
        return (_skills[RogueSkill.Momentum]?.assignedSkillPoints ?? 0) +
                (_skills[RogueSkill.Precision]?.assignedSkillPoints ?? 0) +
                (_skills[RogueSkill.Victimize]?.assignedSkillPoints ?? 0) +
                (_skills[RogueSkill.Exposure]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.Precision:
        return (_skills[RogueSkill.Momentum]?.assignedSkillPoints ?? 0) +
                (_skills[RogueSkill.CloseQuartersCombat]?.assignedSkillPoints ??
                    0) +
                (_skills[RogueSkill.Victimize]?.assignedSkillPoints ?? 0) +
                (_skills[RogueSkill.Exposure]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.Victimize:
        return (_skills[RogueSkill.Momentum]?.assignedSkillPoints ?? 0) +
                (_skills[RogueSkill.CloseQuartersCombat]?.assignedSkillPoints ??
                    0) +
                (_skills[RogueSkill.Precision]?.assignedSkillPoints ?? 0) +
                (_skills[RogueSkill.Exposure]?.assignedSkillPoints ?? 0) ==
            0;
      case RogueSkill.Exposure:
        return (_skills[RogueSkill.Momentum]?.assignedSkillPoints ?? 0) +
                (_skills[RogueSkill.CloseQuartersCombat]?.assignedSkillPoints ??
                    0) +
                (_skills[RogueSkill.Precision]?.assignedSkillPoints ?? 0) +
                (_skills[RogueSkill.Victimize]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.Avalanche:
        return (_skills[SorcererSkill.Shatter]?.assignedSkillPoints ?? 0) +
                (_skills[
                            SorcererSkill.OverflowingEnergy]
                        ?.assignedSkillPoints ??
                    0) +
                (_skills[SorcererSkill.VyrsMastery]?.assignedSkillPoints ?? 0) +
                (_skills[SorcererSkill.EsusFerocity]?.assignedSkillPoints ??
                    0) +
                (_skills[SorcererSkill.Combustion]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.Shatter:
        return (_skills[SorcererSkill.Avalanche]?.assignedSkillPoints ?? 0) +
                (_skills[
                            SorcererSkill.OverflowingEnergy]
                        ?.assignedSkillPoints ??
                    0) +
                (_skills[SorcererSkill.VyrsMastery]?.assignedSkillPoints ?? 0) +
                (_skills[SorcererSkill.EsusFerocity]?.assignedSkillPoints ??
                    0) +
                (_skills[SorcererSkill.Combustion]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.OverflowingEnergy:
        return (_skills[SorcererSkill.Avalanche]?.assignedSkillPoints ?? 0) +
                (_skills[SorcererSkill.Shatter]?.assignedSkillPoints ?? 0) +
                (_skills[SorcererSkill.VyrsMastery]?.assignedSkillPoints ?? 0) +
                (_skills[SorcererSkill.EsusFerocity]?.assignedSkillPoints ??
                    0) +
                (_skills[SorcererSkill.Combustion]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.VyrsMastery:
        return (_skills[SorcererSkill.Avalanche]?.assignedSkillPoints ?? 0) +
                (_skills[SorcererSkill.Shatter]?.assignedSkillPoints ?? 0) +
                (_skills[
                            SorcererSkill.OverflowingEnergy]
                        ?.assignedSkillPoints ??
                    0) +
                (_skills[SorcererSkill.EsusFerocity]?.assignedSkillPoints ??
                    0) +
                (_skills[SorcererSkill.Combustion]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.EsusFerocity:
        return (_skills[SorcererSkill.Avalanche]?.assignedSkillPoints ?? 0) +
                (_skills[SorcererSkill.Shatter]?.assignedSkillPoints ?? 0) +
                (_skills[SorcererSkill.OverflowingEnergy]
                        ?.assignedSkillPoints ??
                    0) +
                (_skills[SorcererSkill.VyrsMastery]?.assignedSkillPoints ?? 0) +
                (_skills[SorcererSkill.Combustion]?.assignedSkillPoints ?? 0) ==
            0;
      case SorcererSkill.Combustion:
        return (_skills[SorcererSkill.Avalanche]?.assignedSkillPoints ?? 0) +
                (_skills[SorcererSkill.Shatter]?.assignedSkillPoints ?? 0) +
                (_skills[SorcererSkill.OverflowingEnergy]
                        ?.assignedSkillPoints ??
                    0) +
                (_skills[SorcererSkill.VyrsMastery]?.assignedSkillPoints ?? 0) +
                (_skills[SorcererSkill.EsusFerocity]?.assignedSkillPoints ??
                    0) ==
            0;
      default:
        return true;
    }
  }

  bool get _parentsThresholdIsMet {
    switch (_skill.element) {
      case BarbarianSkill.ExposeVulnerability:
        return (_skills[BarbarianSkill.NoMercy]?.assignedSkillPoints ?? 0) >
                0 ||
            (_skills[BarbarianSkill.SlayingStrike]?.assignedSkillPoints ?? 0) >
                0;
      case BarbarianSkill.BruteForce:
        return (_skills[BarbarianSkill.HeavyHanded]?.assignedSkillPoints ?? 0) >
                0 ||
            (_skills[BarbarianSkill.Wallop]?.assignedSkillPoints ?? 0) > 0;
      case DruidSkill.BadOmen:
        return (_skills[DruidSkill.ChargedAtmosphere]?.assignedSkillPoints ??
                    0) >
                0 ||
            (_skills[DruidSkill.EndlessTempest]?.assignedSkillPoints ?? 0) > 0;
      case DruidSkill.Unrestrained:
        return (_skills[DruidSkill.ThickHide]?.assignedSkillPoints ?? 0) > 0 ||
            (_skills[DruidSkill.NaturesResolve]?.assignedSkillPoints ?? 0) > 0;
      case DruidSkill.Resonance:
        return (_skills[DruidSkill.NaturalDisaster]?.assignedSkillPoints ?? 0) >
                0 ||
            (_skills[DruidSkill.CircleOfLife]?.assignedSkillPoints ?? 0) > 0;
      case NecromancerSkill.TidesOfBlood:
        return (_skills[NecromancerSkill.Transfusion]?.assignedSkillPoints ??
                    0) >
                0 ||
            (_skills[NecromancerSkill.CoalescedBlood]?.assignedSkillPoints ??
                    0) >
                0;
      case NecromancerSkill.Evulsion:
        return (_skills[NecromancerSkill.CompoundFracture]
                        ?.assignedSkillPoints ??
                    0) >
                0 ||
            (_skills[NecromancerSkill.RapidOssification]?.assignedSkillPoints ??
                    0) >
                0;
      case NecromancerSkill.Terror:
        return (_skills[NecromancerSkill.Gloom]?.assignedSkillPoints ?? 0) >
                0 ||
            (_skills[NecromancerSkill.CripplingDarkness]?.assignedSkillPoints ??
                    0) >
                0;
      case RogueSkill.TrickAttacks:
        return (_skills[RogueSkill.Concussive]?.assignedSkillPoints ?? 0) > 0 ||
            (_skills[RogueSkill.RapidGambits]?.assignedSkillPoints ?? 0) > 0;
      case SorcererSkill.FrigidBreeze:
        return (_skills[SorcererSkill.Hoarfrost]?.assignedSkillPoints ?? 0) >
                0 ||
            (_skills[SorcererSkill.IcyTouch]?.assignedSkillPoints ?? 0) > 0;
      case SorcererSkill.Warmth:
        return (_skills[SorcererSkill.EndlessPyre]?.assignedSkillPoints ?? 0) >
                0 ||
            (_skills[SorcererSkill.Soulfire]?.assignedSkillPoints ?? 0) > 0;
      case SorcererSkill.Convulsions:
        return (_skills[SorcererSkill.Conduction]?.assignedSkillPoints ?? 0) >
                0 ||
            (_skills[SorcererSkill.Electrocution]?.assignedSkillPoints ?? 0) >
                0;
      default:
        if (_isNotCluster(widget.parent)) {
          return (_skills[widget.parent]?.assignedSkillPoints ?? 0) > 0;
        } else {
          return true;
        }
    }
  }

  bool get _isDecrementable =>
      widget.isClusterDecrementable &&
      ((_skills[_skill.element]?.assignedSkillPoints ?? 0) > 1 ||
          (_skills[_skill.element]?.assignedSkillPoints ?? 0) == 1 &&
              _skill.children.fold(
                      0,
                      (b, a) =>
                          b +
                          a.fold(
                              0,
                              (d, c) =>
                                  d +
                                  (_skills[c]?.assignedSkillPoints ?? 0))) ==
                  0);

  bool get _isIncrementable =>
      widget.isClusterUnlocked &&
      (_skills[_skill.element]?.assignedSkillPoints ?? 0) <
          _maxAssignedOf(_skill.element) &&
      _parentsThresholdIsMet &&
      _isUnique;

  @override
  Widget build(BuildContext context) => ExpansionTile(
        shape: Theme.of(context).expansionTileTheme.shape,
        childrenPadding: Theme.of(context).expansionTileTheme.childrenPadding,
        title: Text(EnumUtils.enumToNameWithSpaces(_skill.element)),
        trailing: SkillWidget(
          _skill.element,
          level: _skills[_skill.element]?.assignedSkillPoints ?? 0,
          onMinusPressed: () {
            if (_isDecrementable) {
              setState(() {
                widget.decrementCallback(_skill.element);
              });
            }
          },
          onPlusPressed: () {
            if (_isIncrementable) {
              setState(() {
                widget.incrementCallback(_skill.element);
              });
            }
          },
        ),
        children: _skill.children
            .map(
              (child) => SkillTreeWidget(
                parent: _skill.element,
                isClusterUnlocked: widget.isClusterUnlocked,
                isClusterDecrementable: widget.isClusterDecrementable,
                skill: child,
                skills: _skills,
                incrementCallback: widget.incrementCallback,
                decrementCallback: widget.decrementCallback,
              ),
            )
            .toList(growable: false),
      );
}
