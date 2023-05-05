import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/druid_cluster.dart';
import 'package:d4_utils/src/enums/druid_skill.dart';
import 'package:d4_utils/src/enums/hero.dart';
import 'package:d4_utils/src/enums/skill_type.dart';

abstract class Druid {
  static Tree<Enum> _skillTree(Enum e, List<Tree<Enum>> children) =>
      Tree(element: e, children: children);

  static List<Tree<Enum>> get _childless => const [];

  static DruidCluster clusterOf(DruidSkill druidSkill) {
    switch (druidSkill) {
      case DruidSkill.Maul:
      case DruidSkill.EnhancedMaul:
      case DruidSkill.FierceMaul:
      case DruidSkill.WildMaul:
      case DruidSkill.Claw:
      case DruidSkill.EnhancedClaw:
      case DruidSkill.FierceClaw:
      case DruidSkill.WildClaw:
      case DruidSkill.StormStrike:
      case DruidSkill.EnhancedStormStrike:
      case DruidSkill.FierceStormStrike:
      case DruidSkill.WildStormStrike:
      case DruidSkill.WindShear:
      case DruidSkill.EnhancedWindShear:
      case DruidSkill.FierceWindShear:
      case DruidSkill.WildWindShear:
      case DruidSkill.EarthSpike:
      case DruidSkill.EnhancedEarthSpike:
      case DruidSkill.FierceEarthSpike:
      case DruidSkill.WildEarthSpike:
        return DruidCluster.Basic;
      case DruidSkill.LightningStorm:
      case DruidSkill.EnhancedLightningStorm:
      case DruidSkill.PrimalLightningStorm:
      case DruidSkill.RagingLightningStorm:
      case DruidSkill.Tornado:
      case DruidSkill.EnhancedTornado:
      case DruidSkill.PrimalTornado:
      case DruidSkill.RagingTornado:
      case DruidSkill.Pulverize:
      case DruidSkill.EnhancedPulverize:
      case DruidSkill.PrimalPulverize:
      case DruidSkill.RagingPulverize:
      case DruidSkill.Shred:
      case DruidSkill.EnhancedShred:
      case DruidSkill.PrimalShred:
      case DruidSkill.RagingShred:
      case DruidSkill.LandSlide:
      case DruidSkill.EnhancedLandSlide:
      case DruidSkill.PrimalLandSlide:
      case DruidSkill.RagingLandSlide:
      case DruidSkill.HeartOfTheWild:
      case DruidSkill.WildImpulses:
      case DruidSkill.Abundance:
      case DruidSkill.PredatoryInstinct:
      case DruidSkill.DigitigradeGait:
      case DruidSkill.IronFur:
        return DruidCluster.Core;
      case DruidSkill.EarthenBulwark:
      case DruidSkill.EnhancedEarthenBulwark:
      case DruidSkill.InnateEarthenBulwark:
      case DruidSkill.PreservingEarthenBulwark:
      case DruidSkill.CycloneArmor:
      case DruidSkill.EnhancedCycloneArmor:
      case DruidSkill.InnateCycloneArmor:
      case DruidSkill.PreservingCycloneArmor:
      case DruidSkill.BloodHowl:
      case DruidSkill.EnhancedBloodHowl:
      case DruidSkill.InnateBloodHowl:
      case DruidSkill.PreservingBloodHowl:
      case DruidSkill.DebilitatingRoar:
      case DruidSkill.EnhancedDebilitatingRoar:
      case DruidSkill.InnateDebilitatingRoar:
      case DruidSkill.PreservingDebilitatingRoar:
      case DruidSkill.AncestralFortitude:
      case DruidSkill.Vigilance:
        return DruidCluster.Defensive;
      case DruidSkill.Wolves:
      case DruidSkill.EnhancedWolves:
      case DruidSkill.BrutalWolves:
      case DruidSkill.FerociousWolves:
      case DruidSkill.Ravens:
      case DruidSkill.EnhancedRavens:
      case DruidSkill.BrutalRavens:
      case DruidSkill.FerociousRavens:
      case DruidSkill.VineCreeper:
      case DruidSkill.EnhancedVineCreeper:
      case DruidSkill.BrutalVineCreeper:
      case DruidSkill.FerociousVineCreeper:
      case DruidSkill.NaturesReach:
      case DruidSkill.CallOfTheWild:
      case DruidSkill.Clarity:
        return DruidCluster.Companion;
      case DruidSkill.Boulder:
      case DruidSkill.EnhancedBoulder:
      case DruidSkill.NaturalBoulder:
      case DruidSkill.SavageBoulder:
      case DruidSkill.Trample:
      case DruidSkill.EnhancedTrample:
      case DruidSkill.NaturalTrample:
      case DruidSkill.SavageTrample:
      case DruidSkill.Hurricane:
      case DruidSkill.EnhancedHurricane:
      case DruidSkill.NaturalHurricane:
      case DruidSkill.SavageHurricane:
      case DruidSkill.Rabies:
      case DruidSkill.EnhancedRabies:
      case DruidSkill.NaturalRabies:
      case DruidSkill.SavageRabies:
      case DruidSkill.CrushingEarth:
      case DruidSkill.Safeguard:
      case DruidSkill.StoneGuard:
      case DruidSkill.Neurotoxin:
      case DruidSkill.ToxicClaws:
      case DruidSkill.Envenom:
      case DruidSkill.Mending:
      case DruidSkill.Provocation:
      case DruidSkill.ElementalExposure:
      case DruidSkill.ChargedAtmosphere:
      case DruidSkill.EndlessTempest:
      case DruidSkill.BadOmen:
      case DruidSkill.ElectricShock:
        return DruidCluster.Wrath;
      case DruidSkill.GrizzlyRage:
      case DruidSkill.PrimeGrizzlyRage:
      case DruidSkill.SupremeGrizzlyRage:
      case DruidSkill.Petrify:
      case DruidSkill.PrimePetrify:
      case DruidSkill.SupremePetrify:
      case DruidSkill.Lacerate:
      case DruidSkill.PrimeLacerate:
      case DruidSkill.SupremeLacerate:
      case DruidSkill.Cataclysm:
      case DruidSkill.PrimeCataclysm:
      case DruidSkill.SupremeCataclysm:
      case DruidSkill.QuickShift:
      case DruidSkill.NaturalFortitude:
      case DruidSkill.HeightenedSenses:
      case DruidSkill.DefensivePosture:
      case DruidSkill.ThickHide:
      case DruidSkill.NaturesResolve:
      case DruidSkill.Unrestrained:
      case DruidSkill.Defiance:
      case DruidSkill.NaturalDisaster:
      case DruidSkill.CircleOfLife:
      case DruidSkill.Resonance:
        return DruidCluster.Ultimate;
      case DruidSkill.NaturesFury:
      case DruidSkill.EarthenMight:
      case DruidSkill.LupineFerocity:
      case DruidSkill.BestialRampage:
      case DruidSkill.PerfectStorm:
      case DruidSkill.UrsineStrength:
        return DruidCluster.KeyPassive;
      default:
        assert(false, 'case $druidSkill missing');
        return DruidCluster.Basic;
    }
  }

  static SkillType skillTypeOf(DruidSkill druidSkill) {
    switch (druidSkill) {
      case DruidSkill.Maul:
      case DruidSkill.Claw:
      case DruidSkill.StormStrike:
      case DruidSkill.WindShear:
      case DruidSkill.EarthSpike:
      case DruidSkill.LightningStorm:
      case DruidSkill.Tornado:
      case DruidSkill.Pulverize:
      case DruidSkill.Shred:
      case DruidSkill.LandSlide:
      case DruidSkill.EarthenBulwark:
      case DruidSkill.CycloneArmor:
      case DruidSkill.BloodHowl:
      case DruidSkill.DebilitatingRoar:
      case DruidSkill.Wolves:
      case DruidSkill.Ravens:
      case DruidSkill.VineCreeper:
      case DruidSkill.Boulder:
      case DruidSkill.Trample:
      case DruidSkill.Hurricane:
      case DruidSkill.Rabies:
      case DruidSkill.GrizzlyRage:
      case DruidSkill.Petrify:
      case DruidSkill.Lacerate:
      case DruidSkill.Cataclysm:
        return SkillType.Active;
      case DruidSkill.EnhancedMaul:
      case DruidSkill.EnhancedClaw:
      case DruidSkill.EnhancedStormStrike:
      case DruidSkill.EnhancedWindShear:
      case DruidSkill.EnhancedEarthSpike:
      case DruidSkill.EnhancedLightningStorm:
      case DruidSkill.EnhancedTornado:
      case DruidSkill.EnhancedPulverize:
      case DruidSkill.EnhancedShred:
      case DruidSkill.EnhancedLandSlide:
      case DruidSkill.EnhancedEarthenBulwark:
      case DruidSkill.EnhancedCycloneArmor:
      case DruidSkill.EnhancedBloodHowl:
      case DruidSkill.EnhancedDebilitatingRoar:
      case DruidSkill.EnhancedWolves:
      case DruidSkill.EnhancedRavens:
      case DruidSkill.EnhancedVineCreeper:
      case DruidSkill.EnhancedBoulder:
      case DruidSkill.EnhancedTrample:
      case DruidSkill.EnhancedHurricane:
      case DruidSkill.EnhancedRabies:
      case DruidSkill.PrimeGrizzlyRage:
      case DruidSkill.PrimePetrify:
      case DruidSkill.PrimeLacerate:
      case DruidSkill.PrimeCataclysm:
        return SkillType.Enhancement;
      case DruidSkill.FierceMaul:
      case DruidSkill.WildMaul:
      case DruidSkill.FierceClaw:
      case DruidSkill.WildClaw:
      case DruidSkill.FierceStormStrike:
      case DruidSkill.WildStormStrike:
      case DruidSkill.FierceWindShear:
      case DruidSkill.WildWindShear:
      case DruidSkill.FierceEarthSpike:
      case DruidSkill.WildEarthSpike:
      case DruidSkill.PrimalLightningStorm:
      case DruidSkill.RagingLightningStorm:
      case DruidSkill.PrimalTornado:
      case DruidSkill.RagingTornado:
      case DruidSkill.PrimalPulverize:
      case DruidSkill.RagingPulverize:
      case DruidSkill.PrimalShred:
      case DruidSkill.RagingShred:
      case DruidSkill.PrimalLandSlide:
      case DruidSkill.RagingLandSlide:
      case DruidSkill.InnateEarthenBulwark:
      case DruidSkill.PreservingEarthenBulwark:
      case DruidSkill.InnateCycloneArmor:
      case DruidSkill.PreservingCycloneArmor:
      case DruidSkill.InnateBloodHowl:
      case DruidSkill.PreservingBloodHowl:
      case DruidSkill.InnateDebilitatingRoar:
      case DruidSkill.PreservingDebilitatingRoar:
      case DruidSkill.BrutalWolves:
      case DruidSkill.FerociousWolves:
      case DruidSkill.BrutalRavens:
      case DruidSkill.FerociousRavens:
      case DruidSkill.BrutalVineCreeper:
      case DruidSkill.FerociousVineCreeper:
      case DruidSkill.NaturalBoulder:
      case DruidSkill.SavageBoulder:
      case DruidSkill.NaturalTrample:
      case DruidSkill.SavageTrample:
      case DruidSkill.NaturalHurricane:
      case DruidSkill.SavageHurricane:
      case DruidSkill.NaturalRabies:
      case DruidSkill.SavageRabies:
      case DruidSkill.SupremeGrizzlyRage:
      case DruidSkill.SupremePetrify:
      case DruidSkill.SupremeLacerate:
      case DruidSkill.SupremeCataclysm:
        return SkillType.Upgrade;
      case DruidSkill.HeartOfTheWild:
      case DruidSkill.WildImpulses:
      case DruidSkill.Abundance:
      case DruidSkill.PredatoryInstinct:
      case DruidSkill.DigitigradeGait:
      case DruidSkill.IronFur:
      case DruidSkill.AncestralFortitude:
      case DruidSkill.Vigilance:
      case DruidSkill.NaturesReach:
      case DruidSkill.CallOfTheWild:
      case DruidSkill.Clarity:
      case DruidSkill.CrushingEarth:
      case DruidSkill.Safeguard:
      case DruidSkill.StoneGuard:
      case DruidSkill.Neurotoxin:
      case DruidSkill.ToxicClaws:
      case DruidSkill.Envenom:
      case DruidSkill.Mending:
      case DruidSkill.Provocation:
      case DruidSkill.ElementalExposure:
      case DruidSkill.ChargedAtmosphere:
      case DruidSkill.EndlessTempest:
      case DruidSkill.BadOmen:
      case DruidSkill.ElectricShock:
      case DruidSkill.QuickShift:
      case DruidSkill.NaturalFortitude:
      case DruidSkill.HeightenedSenses:
      case DruidSkill.DefensivePosture:
      case DruidSkill.ThickHide:
      case DruidSkill.NaturesResolve:
      case DruidSkill.Unrestrained:
      case DruidSkill.Defiance:
      case DruidSkill.NaturalDisaster:
      case DruidSkill.CircleOfLife:
      case DruidSkill.Resonance:
      case DruidSkill.NaturesFury:
      case DruidSkill.EarthenMight:
      case DruidSkill.LupineFerocity:
      case DruidSkill.BestialRampage:
      case DruidSkill.PerfectStorm:
      case DruidSkill.UrsineStrength:
        return SkillType.Passive;
    }
  }

  static Tree<Enum> get maul => _skillTree(
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

  static Tree<Enum> get claw => _skillTree(
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

  static Tree<Enum> get stormStrike => _skillTree(
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

  static Tree<Enum> get windShear => _skillTree(
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

  static Tree<Enum> get earthSpike => _skillTree(
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

  static Tree<Enum> get lightningStorm => _skillTree(
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

  static Tree<Enum> get tornado => _skillTree(
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

  static Tree<Enum> get pulverize => _skillTree(
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

  static Tree<Enum> get shred => _skillTree(
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

  static Tree<Enum> get landSlide => _skillTree(
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

  static Tree<Enum> get heartOfTheWild => _skillTree(
        DruidSkill.HeartOfTheWild,
        [
          _skillTree(DruidSkill.WildImpulses, _childless),
          _skillTree(DruidSkill.Abundance, _childless),
        ],
      );

  static Tree<Enum> get predatoryInstinct => _skillTree(
        DruidSkill.PredatoryInstinct,
        [
          _skillTree(DruidSkill.DigitigradeGait, _childless),
          _skillTree(DruidSkill.IronFur, _childless),
        ],
      );

  static Tree<Enum> get earthenBulwark => _skillTree(
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

  static Tree<Enum> get cycloneArmor => _skillTree(
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

  static Tree<Enum> get bloodHowl => _skillTree(
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

  static Tree<Enum> get debilitatingRoar => _skillTree(
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

  static Tree<Enum> get ancestralFortitude => _skillTree(
        DruidSkill.AncestralFortitude,
        [
          _skillTree(DruidSkill.Vigilance, _childless),
        ],
      );

  static Tree<Enum> get wolves => _skillTree(
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

  static Tree<Enum> get ravens => _skillTree(
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

  static Tree<Enum> get vineCreeper => _skillTree(
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

  static Tree<Enum> get naturesReach =>
      _skillTree(DruidSkill.NaturesReach, _childless);

  static Tree<Enum> get callOfTheWild =>
      _skillTree(DruidSkill.CallOfTheWild, _childless);

  static Tree<Enum> get clarity => _skillTree(DruidSkill.Clarity, _childless);

  static Tree<Enum> get boulder => _skillTree(
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

  static Tree<Enum> get trample => _skillTree(
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

  static Tree<Enum> get hurricane => _skillTree(
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

  static Tree<Enum> get rabies => _skillTree(
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

  static Tree<Enum> get crushingEarth => _skillTree(
        DruidSkill.CrushingEarth,
        [
          _skillTree(DruidSkill.Safeguard, _childless),
          _skillTree(DruidSkill.StoneGuard, _childless),
        ],
      );

  static Tree<Enum> get neurotoxin => _skillTree(
        DruidSkill.Neurotoxin,
        [
          _skillTree(DruidSkill.ToxicClaws, _childless),
          _skillTree(DruidSkill.Envenom, _childless),
        ],
      );

  static Tree<Enum> get mending => _skillTree(
        DruidSkill.Mending,
        [
          _skillTree(DruidSkill.Provocation, _childless),
        ],
      );

  static Tree<Enum> get elementalExposure => _skillTree(
        DruidSkill.ElementalExposure,
        [
          _skillTree(
            DruidSkill.ChargedAtmosphere,
            [
              _skillTree(DruidSkill.BadOmen, _childless),
              _skillTree(DruidSkill.ElectricShock, _childless),
            ],
          ),
          _skillTree(
            DruidSkill.EndlessTempest,
            [
              _skillTree(DruidSkill.BadOmen, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get grizzlyRage => _skillTree(
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

  static Tree<Enum> get petrify => _skillTree(
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

  static Tree<Enum> get lacerate => _skillTree(
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

  static Tree<Enum> get cataclysm => _skillTree(
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

  static Tree<Enum> get quickShift => _skillTree(
        DruidSkill.QuickShift,
        [
          _skillTree(DruidSkill.NaturalFortitude, _childless),
          _skillTree(DruidSkill.HeightenedSenses, _childless),
        ],
      );

  static Tree<Enum> get defensivePosture => _skillTree(
        DruidSkill.DefensivePosture,
        [
          _skillTree(
            DruidSkill.ThickHide,
            [
              _skillTree(DruidSkill.Unrestrained, _childless),
            ],
          ),
          _skillTree(
            DruidSkill.NaturesResolve,
            [
              _skillTree(DruidSkill.Unrestrained, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get defiance => _skillTree(
        DruidSkill.Defiance,
        [
          _skillTree(
            DruidSkill.NaturalDisaster,
            [
              _skillTree(DruidSkill.Resonance, _childless),
            ],
          ),
          _skillTree(
            DruidSkill.CircleOfLife,
            [
              _skillTree(DruidSkill.Resonance, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get naturesFury =>
      _skillTree(DruidSkill.NaturesFury, _childless);

  static Tree<Enum> get earthenMight =>
      _skillTree(DruidSkill.EarthenMight, _childless);

  static Tree<Enum> get lupineFerocity =>
      _skillTree(DruidSkill.LupineFerocity, _childless);

  static Tree<Enum> get bestialRampage =>
      _skillTree(DruidSkill.BestialRampage, _childless);

  static Tree<Enum> get perfectStorm =>
      _skillTree(DruidSkill.PerfectStorm, _childless);

  static Tree<Enum> get ursineStrength =>
      _skillTree(DruidSkill.UrsineStrength, _childless);

  static Tree<Enum> get basic => _skillTree(
        DruidCluster.Basic,
        [
          maul,
          claw,
          stormStrike,
          windShear,
          earthSpike,
        ],
      );

  static Tree<Enum> get core => _skillTree(
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

  static Tree<Enum> get defensive => _skillTree(
        DruidCluster.Defensive,
        [
          earthenBulwark,
          cycloneArmor,
          bloodHowl,
          debilitatingRoar,
          ancestralFortitude,
        ],
      );

  static Tree<Enum> get companion => _skillTree(
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

  static Tree<Enum> get wrath => _skillTree(
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

  static Tree<Enum> get ultimate => _skillTree(
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

  static Tree<Enum> get keyPassive => _skillTree(
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

  static Tree<Enum> get druid => _skillTree(
        Hero.Druid,
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
