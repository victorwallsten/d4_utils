import 'package:d4_utils/src/data_structures/skill.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/necromancer_cluster.dart';
import 'package:d4_utils/src/enums/necromancer_skill.dart';
import 'package:d4_utils/src/enums/character_class.dart';
import 'package:d4_utils/src/enums/skill_type.dart';

abstract class Necromancer {
  static Tree<Skill> _skillTree(Enum e, List<Tree<Skill>> children) =>
      Tree(element: Skill(e), children: children);

  static List<Tree<Skill>> get _childless => const [];

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
        return SkillType.Passive;
      case NecromancerSkill.OssifiedEssence:
      case NecromancerSkill.RathmasVigor:
      case NecromancerSkill.Shadowblight:
      case NecromancerSkill.KalansEdict:
        return SkillType.KeyPassive;
    }
  }

  static Tree<Skill> get boneSplinters => _skillTree(
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

  static Tree<Skill> get decompose => _skillTree(
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

  static Tree<Skill> get hemorrhage => _skillTree(
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

  static Tree<Skill> get reap => _skillTree(
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

  static Tree<Skill> get blight => _skillTree(
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

  static Tree<Skill> get bloodLance => _skillTree(
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

  static Tree<Skill> get bloodSurge => _skillTree(
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

  static Tree<Skill> get boneSpear => _skillTree(
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

  static Tree<Skill> get sever => _skillTree(
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

  static Tree<Skill> get unlivingEnergy => _skillTree(
        NecromancerSkill.UnlivingEnergy,
        [
          _skillTree(NecromancerSkill.ImperfectlyBalanced, _childless),
        ],
      );

  static Tree<Skill> get hewedFlesh =>
      _skillTree(NecromancerSkill.HewedFlesh, _childless);

  static Tree<Skill> get bloodMist => _skillTree(
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

  static Tree<Skill> get bonePrison => _skillTree(
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

  static Tree<Skill> get corpseExplosion => _skillTree(
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

  static Tree<Skill> get grimHarvest => _skillTree(
        NecromancerSkill.GrimHarvest,
        [
          _skillTree(NecromancerSkill.FueledByDeath, _childless),
        ],
      );

  static Tree<Skill> get spikedArmor =>
      _skillTree(NecromancerSkill.SpikedArmor, _childless);

  static Tree<Skill> get skeletalWarriorMastery =>
      _skillTree(NecromancerSkill.SkeletalWarriorMastery, _childless);

  static Tree<Skill> get decrepify => _skillTree(
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

  static Tree<Skill> get ironMaiden => _skillTree(
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

  static Tree<Skill> get deathsEmbrace =>
      _skillTree(NecromancerSkill.DeathsEmbrace, _childless);

  static Tree<Skill> get deathsReach =>
      _skillTree(NecromancerSkill.DeathsReach, _childless);

  static Tree<Skill> get amplifyDamage =>
      _skillTree(NecromancerSkill.AmplifyDamage, _childless);

  static Tree<Skill> get skeletalMageMastery =>
      _skillTree(NecromancerSkill.SkeletalMageMastery, _childless);

  static Tree<Skill> get boneSpirit => _skillTree(
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

  static Tree<Skill> get corpseTendrils => _skillTree(
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

  static Tree<Skill> get gruesomeMending => _skillTree(
        NecromancerSkill.GruesomeMending,
        [
          _skillTree(
            NecromancerSkill.Transfusion,
            [
              // TODO: this one has two parents (see below)
              _skillTree(NecromancerSkill.TidesOfBlood, _childless),
            ],
          ),
          _skillTree(
            NecromancerSkill.CoalescedBlood,
            [
              // TODO: this one has two parents (see above)
              _skillTree(NecromancerSkill.TidesOfBlood, _childless),
              _skillTree(NecromancerSkill.DrainVitality, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get serration => _skillTree(
        NecromancerSkill.Serration,
        [
          _skillTree(
            NecromancerSkill.CompoundFracture,
            [
              // TODO: this one has two parents (see below)
              _skillTree(NecromancerSkill.Evulsion, _childless),
            ],
          ),
          _skillTree(
            NecromancerSkill.RapidOssification,
            [
              // TODO: this one has two parents (see above)
              _skillTree(NecromancerSkill.Evulsion, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get reapersPursuit => _skillTree(
        NecromancerSkill.ReapersPursuit,
        [
          _skillTree(
            NecromancerSkill.Gloom,
            [
              // TODO: this one has two parents (see below)
              _skillTree(NecromancerSkill.Terror, _childless),
            ],
          ),
          _skillTree(
            NecromancerSkill.CripplingDarkness,
            [
              // TODO: this one has two parents (see above)
              _skillTree(NecromancerSkill.Terror, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get necroticCarapace =>
      _skillTree(NecromancerSkill.NecroticCarapace, _childless);

  static Tree<Skill> get armyOfTheDead => _skillTree(
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

  static Tree<Skill> get bloodWave => _skillTree(
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

  static Tree<Skill> get boneStorm => _skillTree(
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

  static Tree<Skill> get standAlone => _skillTree(
        NecromancerSkill.StandAlone,
        [
          _skillTree(NecromancerSkill.MementoMori, _childless),
        ],
      );

  static Tree<Skill> get inspiringLeader => _skillTree(
        NecromancerSkill.InspiringLeader,
        [
          _skillTree(NecromancerSkill.HellbentCommander, _childless),
          _skillTree(NecromancerSkill.DeathsDefense, _childless),
        ],
      );

  static Tree<Skill> get bondedInEssence => _skillTree(
        NecromancerSkill.BondedInEssence,
        [
          _skillTree(NecromancerSkill.DeathsDefense, _childless),
        ],
      );

  static Tree<Skill> get golemMastery =>
      _skillTree(NecromancerSkill.GolemMastery, _childless);

  static Tree<Skill> get ossifiedEssence =>
      _skillTree(NecromancerSkill.OssifiedEssence, _childless);

  static Tree<Skill> get rathmasVigor =>
      _skillTree(NecromancerSkill.RathmasVigor, _childless);

  static Tree<Skill> get shadowblight =>
      _skillTree(NecromancerSkill.Shadowblight, _childless);

  static Tree<Skill> get kalansEdict =>
      _skillTree(NecromancerSkill.KalansEdict, _childless);

  static Tree<Skill> get basic => _skillTree(
        NecromancerCluster.Basic,
        [
          boneSplinters,
          decompose,
          hemorrhage,
          reap,
        ],
      );

  static Tree<Skill> get core => _skillTree(
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

  static Tree<Skill> get firstCorpseAndMacabre => _skillTree(
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

  static Tree<Skill> get curse => _skillTree(
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

  static Tree<Skill> get secondCorpseAndMacabre => _skillTree(
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

  static Tree<Skill> get ultimate => _skillTree(
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

  static Tree<Skill> get keyPassive => _skillTree(
        NecromancerCluster.KeyPassive,
        [
          ossifiedEssence,
          rathmasVigor,
          shadowblight,
          kalansEdict,
        ],
      );

  static Tree<Skill> get necromancer => _skillTree(
        CharacterClass.Necromancer,
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
