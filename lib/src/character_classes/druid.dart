import 'package:d4_utils/src/data_structures/pair.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/druid_cluster.dart';
import 'package:d4_utils/src/enums/druid_skill.dart';
import 'package:d4_utils/src/enums/character_class.dart';

abstract class Druid {
  static Tree<Pair<Enum, int>> _tree(
          Enum e, List<Tree<Pair<Enum, int>>> children) =>
      Tree(element: Pair(e, 0), children: children);

  static List<Tree<Pair<Enum, int>>> get _childless => const [];

  static Tree<Pair<Enum, int>> get maul => _tree(
        DruidSkill.Maul,
        [
          _tree(
            DruidSkill.EnhancedMaul,
            [
              _tree(DruidSkill.FierceMaul, _childless),
              _tree(DruidSkill.WildMaul, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get claw => _tree(
        DruidSkill.Claw,
        [
          _tree(
            DruidSkill.EnhancedClaw,
            [
              _tree(DruidSkill.FierceClaw, _childless),
              _tree(DruidSkill.WildClaw, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get stormStrike => _tree(
        DruidSkill.StormStrike,
        [
          _tree(
            DruidSkill.EnhancedStormStrike,
            [
              _tree(DruidSkill.FierceStormStrike, _childless),
              _tree(DruidSkill.WildStormStrike, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get windShear => _tree(
        DruidSkill.WindShear,
        [
          _tree(
            DruidSkill.EnhancedWindShear,
            [
              _tree(DruidSkill.FierceWindShear, _childless),
              _tree(DruidSkill.WildWindShear, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get earthSpike => _tree(
        DruidSkill.EarthSpike,
        [
          _tree(
            DruidSkill.EnhancedEarthSpike,
            [
              _tree(DruidSkill.FierceEarthSpike, _childless),
              _tree(DruidSkill.WildEarthSpike, _childless),
            ],
          ),
        ],
      );

  /* Core */
  static Tree<Pair<Enum, int>> get lightningStorm => _tree(
        DruidSkill.LightningStorm,
        [
          _tree(
            DruidSkill.EnhancedLightningStorm,
            [
              _tree(DruidSkill.PrimalLightningStorm, _childless),
              _tree(DruidSkill.RagingLightningStorm, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get tornado => _tree(
        DruidSkill.Tornado,
        [
          _tree(
            DruidSkill.EnhancedTornado,
            [
              _tree(DruidSkill.PrimalTornado, _childless),
              _tree(DruidSkill.RagingTornado, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get pulverize => _tree(
        DruidSkill.Pulverize,
        [
          _tree(
            DruidSkill.EnhancedPulverize,
            [
              _tree(DruidSkill.PrimalPulverize, _childless),
              _tree(DruidSkill.RagingPulverize, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get shred => _tree(
        DruidSkill.Shred,
        [
          _tree(
            DruidSkill.EnhancedShred,
            [
              _tree(DruidSkill.PrimalShred, _childless),
              _tree(DruidSkill.RagingShred, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get landSlide => _tree(
        DruidSkill.LandSlide,
        [
          _tree(
            DruidSkill.EnhancedLandSlide,
            [
              _tree(DruidSkill.PrimalLandSlide, _childless),
              _tree(DruidSkill.RagingLandSlide, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get heartOfTheWild => _tree(
        DruidSkill.HeartOfTheWild,
        [
          _tree(DruidSkill.WildImpulses, _childless),
          _tree(DruidSkill.Abundance, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get predatoryInstinct => _tree(
        DruidSkill.PredatoryInstinct,
        [
          _tree(DruidSkill.DigitigradeGait, _childless),
          _tree(DruidSkill.IronFur, _childless),
        ],
      );

  /* Defensive */
  static Tree<Pair<Enum, int>> get earthenBulwark => _tree(
        DruidSkill.EarthenBulwark,
        [
          _tree(
            DruidSkill.EnhancedEarthenBulwark,
            [
              _tree(DruidSkill.InnateEarthenBulwark, _childless),
              _tree(DruidSkill.PreservingEarthenBulwark, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get cycloneArmor => _tree(
        DruidSkill.CycloneArmor,
        [
          _tree(
            DruidSkill.EnhancedCycloneArmor,
            [
              _tree(DruidSkill.InnateCycloneArmor, _childless),
              _tree(DruidSkill.PreservingCycloneArmor, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get bloodHowl => _tree(
        DruidSkill.BloodHowl,
        [
          _tree(
            DruidSkill.EnhancedBloodHowl,
            [
              _tree(DruidSkill.InnateBloodHowl, _childless),
              _tree(DruidSkill.PreservingBloodHowl, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get debilitatingRoar => _tree(
        DruidSkill.DebilitatingRoar,
        [
          _tree(
            DruidSkill.EnhancedDebilitatingRoar,
            [
              _tree(DruidSkill.InnateDebilitatingRoar, _childless),
              _tree(DruidSkill.PreservingDebilitatingRoar, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get ancestralFortitude => _tree(
        DruidSkill.AncestralFortitude,
        [
          _tree(DruidSkill.Vigilance, _childless),
        ],
      );

  /* Companion */
  static Tree<Pair<Enum, int>> get wolves => _tree(
        DruidSkill.Wolves,
        [
          _tree(
            DruidSkill.EnhancedWolves,
            [
              _tree(DruidSkill.BrutalWolves, _childless),
              _tree(DruidSkill.FerociousWolves, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get ravens => _tree(
        DruidSkill.Ravens,
        [
          _tree(
            DruidSkill.EnhancedRavens,
            [
              _tree(DruidSkill.BrutalRavens, _childless),
              _tree(DruidSkill.FerociousRavens, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get vineCreeper => _tree(
        DruidSkill.VineCreeper,
        [
          _tree(
            DruidSkill.EnhancedVineCreeper,
            [
              _tree(DruidSkill.BrutalVineCreeper, _childless),
              _tree(DruidSkill.FerociousVineCreeper, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get naturesReach =>
      _tree(DruidSkill.NaturesReach, _childless);

  static Tree<Pair<Enum, int>> get callOfTheWild =>
      _tree(DruidSkill.CallOfTheWild, _childless);

  static Tree<Pair<Enum, int>> get clarity =>
      _tree(DruidSkill.Clarity, _childless);

  /* Wrath */
  static Tree<Pair<Enum, int>> get boulder => _tree(
        DruidSkill.Boulder,
        [
          _tree(
            DruidSkill.EnhancedBoulder,
            [
              _tree(DruidSkill.NaturalBoulder, _childless),
              _tree(DruidSkill.SavageBoulder, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get trample => _tree(
        DruidSkill.Trample,
        [
          _tree(
            DruidSkill.EnhancedTrample,
            [
              _tree(DruidSkill.NaturalTrample, _childless),
              _tree(DruidSkill.SavageTrample, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get hurricane => _tree(
        DruidSkill.Hurricane,
        [
          _tree(
            DruidSkill.EnhancedHurricane,
            [
              _tree(DruidSkill.NaturalHurricane, _childless),
              _tree(DruidSkill.SavageHurricane, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get rabies => _tree(
        DruidSkill.Rabies,
        [
          _tree(
            DruidSkill.EnhancedRabies,
            [
              _tree(DruidSkill.NaturalRabies, _childless),
              _tree(DruidSkill.SavageRabies, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get crushingEarth => _tree(
        DruidSkill.CrushingEarth,
        [
          _tree(DruidSkill.Safeguard, _childless),
          _tree(DruidSkill.StoneGuard, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get neurotoxin => _tree(
        DruidSkill.Neurotoxin,
        [
          _tree(DruidSkill.ToxicClaws, _childless),
          _tree(DruidSkill.Envenom, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get mending => _tree(
        DruidSkill.Mending,
        [
          _tree(DruidSkill.Provocation, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get elementalExposure => _tree(
        DruidSkill.ElementalExposure,
        [
          _tree(
            DruidSkill.ChargedAtmosphere,
            [
              // TODO: this one has two parents (see below)
              _tree(DruidSkill.BadOmen, _childless),
              _tree(DruidSkill.ElectricShock, _childless),
            ],
          ),
          _tree(
            DruidSkill.EndlessTempest,
            [
              // TODO: this one has two parents (see above)
              _tree(DruidSkill.BadOmen, _childless),
            ],
          ),
        ],
      );

  /* Ultimate */
  static Tree<Pair<Enum, int>> get grizzlyRage => _tree(
        DruidSkill.GrizzlyRage,
        [
          _tree(
            DruidSkill.PrimeGrizzlyRage,
            [
              _tree(DruidSkill.SupremeGrizzlyRage, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get petrify => _tree(
        DruidSkill.Petrify,
        [
          _tree(
            DruidSkill.PrimePetrify,
            [
              _tree(DruidSkill.SupremePetrify, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get lacerate => _tree(
        DruidSkill.Lacerate,
        [
          _tree(
            DruidSkill.PrimeLacerate,
            [
              _tree(DruidSkill.SupremeLacerate, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get cataclysm => _tree(
        DruidSkill.Cataclysm,
        [
          _tree(
            DruidSkill.PrimeCataclysm,
            [
              _tree(DruidSkill.SupremeCataclysm, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get quickShift => _tree(
        DruidSkill.QuickShift,
        [
          _tree(DruidSkill.NaturalFortitude, _childless),
          _tree(DruidSkill.HeightenedSenses, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get defensivePosture => _tree(
        DruidSkill.DefensivePosture,
        [
          _tree(
            DruidSkill.ThickHide,
            [
              // TODO: this one has two parents (see below)
              _tree(DruidSkill.Unrestrained, _childless),
            ],
          ),
          _tree(
            DruidSkill.NaturesResolve,
            [
              // TODO: this one has two parents (see above)
              _tree(DruidSkill.Unrestrained, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get defiance => _tree(
        DruidSkill.Defiance,
        [
          _tree(
            DruidSkill.NaturalDisaster,
            [
              // TODO: this one has two parents (see below)
              _tree(DruidSkill.Resonance, _childless),
            ],
          ),
          _tree(DruidSkill.CircleOfLife, [
            // TODO: this one has two parents (see above)
            _tree(DruidSkill.Resonance, _childless),
          ]),
        ],
      );

  /* Key Passive */
  static Tree<Pair<Enum, int>> get naturesFury =>
      _tree(DruidSkill.NaturesFury, _childless);

  static Tree<Pair<Enum, int>> get earthenMight =>
      _tree(DruidSkill.EarthenMight, _childless);

  static Tree<Pair<Enum, int>> get lupineFerocity =>
      _tree(DruidSkill.LupineFerocity, _childless);

  static Tree<Pair<Enum, int>> get bestialRampage =>
      _tree(DruidSkill.BestialRampage, _childless);

  static Tree<Pair<Enum, int>> get perfectStorm =>
      _tree(DruidSkill.PerfectStorm, _childless);

  static Tree<Pair<Enum, int>> get ursineStrength =>
      _tree(DruidSkill.UrsineStrength, _childless);

  static Tree<Pair<Enum, int>> get basic => _tree(
        DruidCluster.Basic,
        [
          maul,
          claw,
          stormStrike,
          windShear,
          earthSpike,
        ],
      );

  static Tree<Pair<Enum, int>> get core => _tree(
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

  static Tree<Pair<Enum, int>> get defensive => _tree(
        DruidCluster.Defensive,
        [
          earthenBulwark,
          cycloneArmor,
          bloodHowl,
          debilitatingRoar,
          ancestralFortitude,
        ],
      );

  static Tree<Pair<Enum, int>> get companion => _tree(
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

  static Tree<Pair<Enum, int>> get wrath => _tree(
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

  static Tree<Pair<Enum, int>> get ultimate => _tree(
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

  static Tree<Pair<Enum, int>> get keyPassive => _tree(
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

  static Tree<Pair<Enum, int>> get druid => _tree(
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
