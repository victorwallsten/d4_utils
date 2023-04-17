import 'package:d4_utils/src/data_structures/pair.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/necromancer_cluster.dart';
import 'package:d4_utils/src/enums/necromancer_skill.dart';
import 'package:d4_utils/src/enums/character_class.dart';

abstract class Necromancer {
  static Tree<Pair<Enum, int>> _tree(
          Enum e, List<Tree<Pair<Enum, int>>> children) =>
      Tree(element: Pair(e, 0), children: children);

  static List<Tree<Pair<Enum, int>>> get _childless => const [];

  /* Basic */
  static Tree<Pair<Enum, int>> get boneSplinters => _tree(
        NecromancerSkill.BoneSplinters,
        [
          _tree(
            NecromancerSkill.EnhancedBoneSplinters,
            [
              _tree(NecromancerSkill.AcolytesBoneSplinters, _childless),
              _tree(NecromancerSkill.InitiatesBoneSplinters, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get decompose => _tree(
        NecromancerSkill.Decompose,
        [
          _tree(
            NecromancerSkill.EnhancedDecompose,
            [
              _tree(NecromancerSkill.AcolytesDecompose, _childless),
              _tree(NecromancerSkill.InitiatesDecompose, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get hemorrhage => _tree(
        NecromancerSkill.Hemorrhage,
        [
          _tree(
            NecromancerSkill.EnhancedHemorrhage,
            [
              _tree(NecromancerSkill.AcolytesHemorrhage, _childless),
              _tree(NecromancerSkill.InitiatesHemorrhage, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get reap => _tree(
        NecromancerSkill.Reap,
        [
          _tree(
            NecromancerSkill.EnhancedReap,
            [
              _tree(NecromancerSkill.AcolytesReap, _childless),
              _tree(NecromancerSkill.InitiatesReap, _childless),
            ],
          ),
        ],
      );

  /* Core */
  static Tree<Pair<Enum, int>> get blight => _tree(
        NecromancerSkill.Blight,
        [
          _tree(
            NecromancerSkill.EnhancedBlight,
            [
              _tree(NecromancerSkill.ParanormalBlight, _childless),
              _tree(NecromancerSkill.SupernaturalBlight, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get bloodLance => _tree(
        NecromancerSkill.BloodLance,
        [
          _tree(
            NecromancerSkill.EnhancedBloodLance,
            [
              _tree(NecromancerSkill.ParanormalBloodLance, _childless),
              _tree(NecromancerSkill.SupernaturalBloodLance, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get bloodSurge => _tree(
        NecromancerSkill.BloodSurge,
        [
          _tree(
            NecromancerSkill.EnhancedBloodSurge,
            [
              _tree(NecromancerSkill.ParanormalBloodSurge, _childless),
              _tree(NecromancerSkill.SupernaturalBloodSurge, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get boneSpear => _tree(
        NecromancerSkill.BoneSpear,
        [
          _tree(
            NecromancerSkill.EnhancedBoneSpear,
            [
              _tree(NecromancerSkill.ParanormalBoneSpear, _childless),
              _tree(NecromancerSkill.SupernaturalBoneSpear, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get sever => _tree(
        NecromancerSkill.Sever,
        [
          _tree(
            NecromancerSkill.EnhancedSever,
            [
              _tree(NecromancerSkill.ParanormalSever, _childless),
              _tree(NecromancerSkill.SupernaturalSever, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get unlivingEnergy => _tree(
        NecromancerSkill.UnlivingEnergy,
        [
          _tree(NecromancerSkill.ImperfectlyBalanced, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get hewedFlesh =>
      _tree(NecromancerSkill.HewedFlesh, _childless);

  /* First Corpse and Macabre */
  static Tree<Pair<Enum, int>> get bloodMist => _tree(
        NecromancerSkill.BloodMist,
        [
          _tree(
            NecromancerSkill.EnhancedBloodMist,
            [
              _tree(NecromancerSkill.DreadfulBloodMist, _childless),
              _tree(NecromancerSkill.GhastlyBloodMist, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get bonePrison => _tree(
        NecromancerSkill.BonePrison,
        [
          _tree(
            NecromancerSkill.EnhancedBonePrison,
            [
              _tree(NecromancerSkill.DreadfulBonePrison, _childless),
              _tree(NecromancerSkill.GhastlyBonePrison, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get corpseExplosion => _tree(
        NecromancerSkill.CorpseExplosion,
        [
          _tree(
            NecromancerSkill.EnhancedCorpseExplosion,
            [
              _tree(NecromancerSkill.BlightedCorpseExplosion, _childless),
              _tree(NecromancerSkill.PlaguedCorpseExplosion, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get grimHarvest => _tree(
        NecromancerSkill.GrimHarvest,
        [
          _tree(NecromancerSkill.FueledByDeath, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get spikedArmor =>
      _tree(NecromancerSkill.SpikedArmor, _childless);

  static Tree<Pair<Enum, int>> get skeletalWarriorMastery =>
      _tree(NecromancerSkill.SkeletalWarriorMastery, _childless);

  /* Curse */
  static Tree<Pair<Enum, int>> get decrepify => _tree(
        NecromancerSkill.Decrepify,
        [
          _tree(
            NecromancerSkill.EnhancedDecrepify,
            [
              _tree(NecromancerSkill.AbhorrentDecrepify, _childless),
              _tree(NecromancerSkill.HorridDecrepify, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get ironMaiden => _tree(
        NecromancerSkill.IronMaiden,
        [
          _tree(
            NecromancerSkill.EnhancedIronMaiden,
            [
              _tree(NecromancerSkill.AbhorrentIronMaiden, _childless),
              _tree(NecromancerSkill.HorridIronMaiden, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get deathsEmbrace =>
      _tree(NecromancerSkill.DeathsEmbrace, _childless);

  static Tree<Pair<Enum, int>> get deathsReach =>
      _tree(NecromancerSkill.DeathsReach, _childless);

  static Tree<Pair<Enum, int>> get amplifyDamage =>
      _tree(NecromancerSkill.AmplifyDamage, _childless);

  static Tree<Pair<Enum, int>> get skeletalMageMastery =>
      _tree(NecromancerSkill.SkeletalMageMastery, _childless);

  /* Second Corpse and Macabre */
  static Tree<Pair<Enum, int>> get boneSpirit => _tree(
        NecromancerSkill.BoneSpirit,
        [
          _tree(
            NecromancerSkill.EnhancedBoneSpirit,
            [
              _tree(NecromancerSkill.DreadfulBoneSpirit, _childless),
              _tree(NecromancerSkill.GhastlyBoneSpirit, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get corpseTendrils => _tree(
        NecromancerSkill.CorpseTendrils,
        [
          _tree(
            NecromancerSkill.EnhancedCorpseTendrils,
            [
              _tree(NecromancerSkill.BlightedCorpseTendrils, _childless),
              _tree(NecromancerSkill.PlaguedCorpseTendrils, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get gruesomeMending => _tree(
        NecromancerSkill.GruesomeMending,
        [
          _tree(
            NecromancerSkill.Transfusion,
            [
              // TODO: this one has two parents (see below)
              _tree(NecromancerSkill.TidesOfBlood, _childless),
            ],
          ),
          _tree(
            NecromancerSkill.CoalescedBlood,
            [
              // TODO: this one has two parents (see above)
              _tree(NecromancerSkill.TidesOfBlood, _childless),
              _tree(NecromancerSkill.DrainVitality, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get serration => _tree(
        NecromancerSkill.Serration,
        [
          _tree(
            NecromancerSkill.CompoundFracture,
            [
              // TODO: this one has two parents (see below)
              _tree(NecromancerSkill.Evulsion, _childless),
            ],
          ),
          _tree(
            NecromancerSkill.RapidOssification,
            [
              // TODO: this one has two parents (see above)
              _tree(NecromancerSkill.Evulsion, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get reapersPursuit => _tree(
        NecromancerSkill.ReapersPursuit,
        [
          _tree(
            NecromancerSkill.Gloom,
            [
              // TODO: this one has two parents (see below)
              _tree(NecromancerSkill.Terror, _childless),
            ],
          ),
          _tree(
            NecromancerSkill.CripplingDarkness,
            [
              // TODO: this one has two parents (see above)
              _tree(NecromancerSkill.Terror, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get necroticCarapace =>
      _tree(NecromancerSkill.NecroticCarapace, _childless);

  /* Ultimate */
  static Tree<Pair<Enum, int>> get armyOfTheDead => _tree(
        NecromancerSkill.ArmyOfTheDead,
        [
          _tree(
            NecromancerSkill.PrimeArmyOfTheDead,
            [
              _tree(NecromancerSkill.SupremeArmyOfTheDead, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get bloodWave => _tree(
        NecromancerSkill.BloodWave,
        [
          _tree(
            NecromancerSkill.PrimeBloodWave,
            [
              _tree(NecromancerSkill.SupremeBloodWave, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get boneStorm => _tree(
        NecromancerSkill.BoneStorm,
        [
          _tree(
            NecromancerSkill.PrimeBoneStorm,
            [
              _tree(NecromancerSkill.SupremeBoneStorm, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get standAlone => _tree(
        NecromancerSkill.StandAlone,
        [
          _tree(NecromancerSkill.MementoMori, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get inspiringLeader => _tree(
        NecromancerSkill.InspiringLeader,
        [
          _tree(NecromancerSkill.HellbentCommander, _childless),
          _tree(NecromancerSkill.DeathsDefense, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get bondedInEssence => _tree(
        NecromancerSkill.BondedInEssence,
        [
          _tree(NecromancerSkill.DeathsDefense, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get golemMastery =>
      _tree(NecromancerSkill.GolemMastery, _childless);

  /* Key Passive */
  static Tree<Pair<Enum, int>> get ossifiedEssence =>
      _tree(NecromancerSkill.OssifiedEssence, _childless);

  static Tree<Pair<Enum, int>> get rathmasVigor =>
      _tree(NecromancerSkill.RathmasVigor, _childless);

  static Tree<Pair<Enum, int>> get shadowblight =>
      _tree(NecromancerSkill.Shadowblight, _childless);

  static Tree<Pair<Enum, int>> get kalansEdict =>
      _tree(NecromancerSkill.KalansEdict, _childless);
}
