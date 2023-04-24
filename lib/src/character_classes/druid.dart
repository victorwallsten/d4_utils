import 'package:d4_utils/src/data_structures/skill.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/druid_cluster.dart';
import 'package:d4_utils/src/enums/druid_skill.dart';
import 'package:d4_utils/src/enums/character_class.dart';

abstract class Druid {
  static Tree<Skill> _skillTree(Enum e, List<Tree<Skill>> children) =>
      Tree(element: Skill(e), children: children);

  static List<Tree<Skill>> get _childless => const [];

  static Tree<Skill> get maul => _skillTree(
        DruidSkill.Maul,
        [
          _skillTree(
            DruidSkill.EnhancedMaul,
            [
              _skillTree(DruidSkill.FierceMaul, _childless),
              _skillTree(DruidSkill.WildMaul, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get claw => _skillTree(
        DruidSkill.Claw,
        [
          _skillTree(
            DruidSkill.EnhancedClaw,
            [
              _skillTree(DruidSkill.FierceClaw, _childless),
              _skillTree(DruidSkill.WildClaw, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get stormStrike => _skillTree(
        DruidSkill.StormStrike,
        [
          _skillTree(
            DruidSkill.EnhancedStormStrike,
            [
              _skillTree(DruidSkill.FierceStormStrike, _childless),
              _skillTree(DruidSkill.WildStormStrike, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get windShear => _skillTree(
        DruidSkill.WindShear,
        [
          _skillTree(
            DruidSkill.EnhancedWindShear,
            [
              _skillTree(DruidSkill.FierceWindShear, _childless),
              _skillTree(DruidSkill.WildWindShear, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get earthSpike => _skillTree(
        DruidSkill.EarthSpike,
        [
          _skillTree(
            DruidSkill.EnhancedEarthSpike,
            [
              _skillTree(DruidSkill.FierceEarthSpike, _childless),
              _skillTree(DruidSkill.WildEarthSpike, _childless),
            ],
          ),
        ],
      );

  /* Core */
  static Tree<Skill> get lightningStorm => _skillTree(
        DruidSkill.LightningStorm,
        [
          _skillTree(
            DruidSkill.EnhancedLightningStorm,
            [
              _skillTree(DruidSkill.PrimalLightningStorm, _childless),
              _skillTree(DruidSkill.RagingLightningStorm, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get tornado => _skillTree(
        DruidSkill.Tornado,
        [
          _skillTree(
            DruidSkill.EnhancedTornado,
            [
              _skillTree(DruidSkill.PrimalTornado, _childless),
              _skillTree(DruidSkill.RagingTornado, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get pulverize => _skillTree(
        DruidSkill.Pulverize,
        [
          _skillTree(
            DruidSkill.EnhancedPulverize,
            [
              _skillTree(DruidSkill.PrimalPulverize, _childless),
              _skillTree(DruidSkill.RagingPulverize, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get shred => _skillTree(
        DruidSkill.Shred,
        [
          _skillTree(
            DruidSkill.EnhancedShred,
            [
              _skillTree(DruidSkill.PrimalShred, _childless),
              _skillTree(DruidSkill.RagingShred, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get landSlide => _skillTree(
        DruidSkill.LandSlide,
        [
          _skillTree(
            DruidSkill.EnhancedLandSlide,
            [
              _skillTree(DruidSkill.PrimalLandSlide, _childless),
              _skillTree(DruidSkill.RagingLandSlide, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get heartOfTheWild => _skillTree(
        DruidSkill.HeartOfTheWild,
        [
          _skillTree(DruidSkill.WildImpulses, _childless),
          _skillTree(DruidSkill.Abundance, _childless),
        ],
      );

  static Tree<Skill> get predatoryInstinct => _skillTree(
        DruidSkill.PredatoryInstinct,
        [
          _skillTree(DruidSkill.DigitigradeGait, _childless),
          _skillTree(DruidSkill.IronFur, _childless),
        ],
      );

  /* Defensive */
  static Tree<Skill> get earthenBulwark => _skillTree(
        DruidSkill.EarthenBulwark,
        [
          _skillTree(
            DruidSkill.EnhancedEarthenBulwark,
            [
              _skillTree(DruidSkill.InnateEarthenBulwark, _childless),
              _skillTree(DruidSkill.PreservingEarthenBulwark, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get cycloneArmor => _skillTree(
        DruidSkill.CycloneArmor,
        [
          _skillTree(
            DruidSkill.EnhancedCycloneArmor,
            [
              _skillTree(DruidSkill.InnateCycloneArmor, _childless),
              _skillTree(DruidSkill.PreservingCycloneArmor, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get bloodHowl => _skillTree(
        DruidSkill.BloodHowl,
        [
          _skillTree(
            DruidSkill.EnhancedBloodHowl,
            [
              _skillTree(DruidSkill.InnateBloodHowl, _childless),
              _skillTree(DruidSkill.PreservingBloodHowl, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get debilitatingRoar => _skillTree(
        DruidSkill.DebilitatingRoar,
        [
          _skillTree(
            DruidSkill.EnhancedDebilitatingRoar,
            [
              _skillTree(DruidSkill.InnateDebilitatingRoar, _childless),
              _skillTree(DruidSkill.PreservingDebilitatingRoar, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get ancestralFortitude => _skillTree(
        DruidSkill.AncestralFortitude,
        [
          _skillTree(DruidSkill.Vigilance, _childless),
        ],
      );

  /* Companion */
  static Tree<Skill> get wolves => _skillTree(
        DruidSkill.Wolves,
        [
          _skillTree(
            DruidSkill.EnhancedWolves,
            [
              _skillTree(DruidSkill.BrutalWolves, _childless),
              _skillTree(DruidSkill.FerociousWolves, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get ravens => _skillTree(
        DruidSkill.Ravens,
        [
          _skillTree(
            DruidSkill.EnhancedRavens,
            [
              _skillTree(DruidSkill.BrutalRavens, _childless),
              _skillTree(DruidSkill.FerociousRavens, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get vineCreeper => _skillTree(
        DruidSkill.VineCreeper,
        [
          _skillTree(
            DruidSkill.EnhancedVineCreeper,
            [
              _skillTree(DruidSkill.BrutalVineCreeper, _childless),
              _skillTree(DruidSkill.FerociousVineCreeper, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get naturesReach =>
      _skillTree(DruidSkill.NaturesReach, _childless);

  static Tree<Skill> get callOfTheWild =>
      _skillTree(DruidSkill.CallOfTheWild, _childless);

  static Tree<Skill> get clarity => _skillTree(DruidSkill.Clarity, _childless);

  /* Wrath */
  static Tree<Skill> get boulder => _skillTree(
        DruidSkill.Boulder,
        [
          _skillTree(
            DruidSkill.EnhancedBoulder,
            [
              _skillTree(DruidSkill.NaturalBoulder, _childless),
              _skillTree(DruidSkill.SavageBoulder, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get trample => _skillTree(
        DruidSkill.Trample,
        [
          _skillTree(
            DruidSkill.EnhancedTrample,
            [
              _skillTree(DruidSkill.NaturalTrample, _childless),
              _skillTree(DruidSkill.SavageTrample, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get hurricane => _skillTree(
        DruidSkill.Hurricane,
        [
          _skillTree(
            DruidSkill.EnhancedHurricane,
            [
              _skillTree(DruidSkill.NaturalHurricane, _childless),
              _skillTree(DruidSkill.SavageHurricane, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get rabies => _skillTree(
        DruidSkill.Rabies,
        [
          _skillTree(
            DruidSkill.EnhancedRabies,
            [
              _skillTree(DruidSkill.NaturalRabies, _childless),
              _skillTree(DruidSkill.SavageRabies, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get crushingEarth => _skillTree(
        DruidSkill.CrushingEarth,
        [
          _skillTree(DruidSkill.Safeguard, _childless),
          _skillTree(DruidSkill.StoneGuard, _childless),
        ],
      );

  static Tree<Skill> get neurotoxin => _skillTree(
        DruidSkill.Neurotoxin,
        [
          _skillTree(DruidSkill.ToxicClaws, _childless),
          _skillTree(DruidSkill.Envenom, _childless),
        ],
      );

  static Tree<Skill> get mending => _skillTree(
        DruidSkill.Mending,
        [
          _skillTree(DruidSkill.Provocation, _childless),
        ],
      );

  static Tree<Skill> get elementalExposure => _skillTree(
        DruidSkill.ElementalExposure,
        [
          _skillTree(
            DruidSkill.ChargedAtmosphere,
            [
              // TODO: this one has two parents (see below)
              _skillTree(DruidSkill.BadOmen, _childless),
              _skillTree(DruidSkill.ElectricShock, _childless),
            ],
          ),
          _skillTree(
            DruidSkill.EndlessTempest,
            [
              // TODO: this one has two parents (see above)
              _skillTree(DruidSkill.BadOmen, _childless),
            ],
          ),
        ],
      );

  /* Ultimate */
  static Tree<Skill> get grizzlyRage => _skillTree(
        DruidSkill.GrizzlyRage,
        [
          _skillTree(
            DruidSkill.PrimeGrizzlyRage,
            [
              _skillTree(DruidSkill.SupremeGrizzlyRage, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get petrify => _skillTree(
        DruidSkill.Petrify,
        [
          _skillTree(
            DruidSkill.PrimePetrify,
            [
              _skillTree(DruidSkill.SupremePetrify, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get lacerate => _skillTree(
        DruidSkill.Lacerate,
        [
          _skillTree(
            DruidSkill.PrimeLacerate,
            [
              _skillTree(DruidSkill.SupremeLacerate, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get cataclysm => _skillTree(
        DruidSkill.Cataclysm,
        [
          _skillTree(
            DruidSkill.PrimeCataclysm,
            [
              _skillTree(DruidSkill.SupremeCataclysm, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get quickShift => _skillTree(
        DruidSkill.QuickShift,
        [
          _skillTree(DruidSkill.NaturalFortitude, _childless),
          _skillTree(DruidSkill.HeightenedSenses, _childless),
        ],
      );

  static Tree<Skill> get defensivePosture => _skillTree(
        DruidSkill.DefensivePosture,
        [
          _skillTree(
            DruidSkill.ThickHide,
            [
              // TODO: this one has two parents (see below)
              _skillTree(DruidSkill.Unrestrained, _childless),
            ],
          ),
          _skillTree(
            DruidSkill.NaturesResolve,
            [
              // TODO: this one has two parents (see above)
              _skillTree(DruidSkill.Unrestrained, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get defiance => _skillTree(
        DruidSkill.Defiance,
        [
          _skillTree(
            DruidSkill.NaturalDisaster,
            [
              // TODO: this one has two parents (see below)
              _skillTree(DruidSkill.Resonance, _childless),
            ],
          ),
          _skillTree(DruidSkill.CircleOfLife, [
            // TODO: this one has two parents (see above)
            _skillTree(DruidSkill.Resonance, _childless),
          ]),
        ],
      );

  /* Key Passive */
  static Tree<Skill> get naturesFury =>
      _skillTree(DruidSkill.NaturesFury, _childless);

  static Tree<Skill> get earthenMight =>
      _skillTree(DruidSkill.EarthenMight, _childless);

  static Tree<Skill> get lupineFerocity =>
      _skillTree(DruidSkill.LupineFerocity, _childless);

  static Tree<Skill> get bestialRampage =>
      _skillTree(DruidSkill.BestialRampage, _childless);

  static Tree<Skill> get perfectStorm =>
      _skillTree(DruidSkill.PerfectStorm, _childless);

  static Tree<Skill> get ursineStrength =>
      _skillTree(DruidSkill.UrsineStrength, _childless);

  static Tree<Skill> get basic => _skillTree(
        DruidCluster.Basic,
        [
          maul,
          claw,
          stormStrike,
          windShear,
          earthSpike,
        ],
      );

  static Tree<Skill> get core => _skillTree(
        DruidCluster.Core,
        [
          lightningStorm,
          tornado,
          pulverize,
          shred,
          landSlide,
          heartOfTheWild,
          predatoryInstinct,
        ],
      );

  static Tree<Skill> get defensive => _skillTree(
        DruidCluster.Defensive,
        [
          earthenBulwark,
          cycloneArmor,
          bloodHowl,
          debilitatingRoar,
          ancestralFortitude,
        ],
      );

  static Tree<Skill> get companion => _skillTree(
        DruidCluster.Companion,
        [
          wolves,
          ravens,
          vineCreeper,
          naturesReach,
          callOfTheWild,
          clarity,
        ],
      );

  static Tree<Skill> get wrath => _skillTree(
        DruidCluster.Wrath,
        [
          boulder,
          trample,
          hurricane,
          rabies,
          crushingEarth,
          neurotoxin,
          mending,
          elementalExposure,
        ],
      );

  static Tree<Skill> get ultimate => _skillTree(
        DruidCluster.Ultimate,
        [
          grizzlyRage,
          petrify,
          lacerate,
          cataclysm,
          quickShift,
          defensivePosture,
          defiance,
        ],
      );

  static Tree<Skill> get keyPassive => _skillTree(
        DruidCluster.KeyPassive,
        [
          naturesFury,
          earthenMight,
          lupineFerocity,
          bestialRampage,
          perfectStorm,
          ursineStrength,
        ],
      );

  static Tree<Skill> get druid => _skillTree(
        CharacterClass.Druid,
        [
          basic,
          core,
          defensive,
          companion,
          wrath,
          ultimate,
          keyPassive,
        ],
      );
}
