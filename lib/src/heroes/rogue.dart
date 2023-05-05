import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/rogue_cluster.dart';
import 'package:d4_utils/src/enums/rogue_skill.dart';
import 'package:d4_utils/src/enums/hero.dart';
import 'package:d4_utils/src/enums/skill_type.dart';

abstract class Rogue {
  static Tree<Enum> _skillTree(Enum e, List<Tree<Enum>> children) =>
      Tree(element: e, children: children);

  static List<Tree<Enum>> get _childless => const [];

  static RogueCluster clusterOf(RogueSkill rogueSkill) {
    switch (rogueSkill) {
      case RogueSkill.BladeShift:
      case RogueSkill.EnhancedBladeShift:
      case RogueSkill.FundamentalBladeShift:
      case RogueSkill.PrimaryBladeShift:
      case RogueSkill.ForcefulArrow:
      case RogueSkill.EnhancedForcefulArrow:
      case RogueSkill.FundamentalForcefulArrow:
      case RogueSkill.PrimaryForcefulArrow:
      case RogueSkill.Heartseeker:
      case RogueSkill.EnhancedHeartseeker:
      case RogueSkill.FundamentalHeartseeker:
      case RogueSkill.PrimaryHeartseeker:
      case RogueSkill.InvigoratingStrike:
      case RogueSkill.EnhancedInvigoratingStrike:
      case RogueSkill.FundamentalInvigoratingStrike:
      case RogueSkill.PrimaryInvigoratingStrike:
      case RogueSkill.Puncture:
      case RogueSkill.EnhancedPuncture:
      case RogueSkill.FundamentalPuncture:
      case RogueSkill.PrimaryPuncture:
        return RogueCluster.Basic;
      case RogueSkill.Barrage:
      case RogueSkill.EnhancedBarrage:
      case RogueSkill.AdvancedBarrage:
      case RogueSkill.ImprovedBarrage:
      case RogueSkill.Flurry:
      case RogueSkill.EnhancedFlurry:
      case RogueSkill.AdvancedFlurry:
      case RogueSkill.ImprovedFlurry:
      case RogueSkill.PenetratingShot:
      case RogueSkill.EnhancedPenetratingShot:
      case RogueSkill.AdvancedPenetratingShot:
      case RogueSkill.ImprovedPenetratingShot:
      case RogueSkill.RapidFire:
      case RogueSkill.EnhancedRapidFire:
      case RogueSkill.AdvancedRapidFire:
      case RogueSkill.ImprovedRapidFire:
      case RogueSkill.TwistingBlades:
      case RogueSkill.EnhancedTwistingBlades:
      case RogueSkill.AdvancedTwistingBlades:
      case RogueSkill.ImprovedTwistingBlades:
      case RogueSkill.Sturdy:
      case RogueSkill.SiphoningStrikes:
      case RogueSkill.StutterStep:
        return RogueCluster.Core;
      case RogueSkill.Caltrops:
      case RogueSkill.EnhancedCaltrops:
      case RogueSkill.DisciplinedCaltrops:
      case RogueSkill.MethodicalCaltrops:
      case RogueSkill.Dash:
      case RogueSkill.EnhancedDash:
      case RogueSkill.DisciplinedDash:
      case RogueSkill.MethodicalDash:
      case RogueSkill.ShadowStep:
      case RogueSkill.EnhancedShadowStep:
      case RogueSkill.DisciplinedShadowStep:
      case RogueSkill.MethodicalShadowStep:
      case RogueSkill.Concussive:
      case RogueSkill.RapidGambits:
      case RogueSkill.TrickAttacks:
      case RogueSkill.Rugged:
      case RogueSkill.ReactiveDefense:
      case RogueSkill.WeaponMastery:
        return RogueCluster.Agility;
      case RogueSkill.Concealment:
      case RogueSkill.EnhancedConcealment:
      case RogueSkill.CounteringConcealment:
      case RogueSkill.SubvertingConcealment:
      case RogueSkill.DarkShroud:
      case RogueSkill.EnhancedDarkShroud:
      case RogueSkill.CounteringDarkShroud:
      case RogueSkill.SubvertingDarkShroud:
      case RogueSkill.PoisonTrap:
      case RogueSkill.EnhancedPoisonTrap:
      case RogueSkill.CounteringPoisonTrap:
      case RogueSkill.SubvertingPoisonTrap:
      case RogueSkill.SmokeGrenade:
      case RogueSkill.EnhancedSmokeGrenade:
      case RogueSkill.CounteringSmokeGrenade:
      case RogueSkill.SubvertingSmokeGrenade:
      case RogueSkill.Exploit:
      case RogueSkill.Malice:
      case RogueSkill.Agile:
      case RogueSkill.MendingObscurity:
        return RogueCluster.Subterfuge;
      case RogueSkill.ColdImbuement:
      case RogueSkill.EnhancedColdImbuement:
      case RogueSkill.BlendedColdImbuement:
      case RogueSkill.MixedColdImbuement:
      case RogueSkill.PoisonImbuement:
      case RogueSkill.EnhancedPoisonImbuement:
      case RogueSkill.BlendedPoisonImbuement:
      case RogueSkill.MixedPoisonImbuement:
      case RogueSkill.ShadowImbuement:
      case RogueSkill.EnhancedShadowImbuement:
      case RogueSkill.BlendedShadowImbuement:
      case RogueSkill.MixedShadowImbuement:
      case RogueSkill.DeadlyVenom:
      case RogueSkill.DebilitatingToxins:
      case RogueSkill.AlchemicalAdvantage:
      case RogueSkill.ShadowCrash:
      case RogueSkill.ConsumingShadows:
      case RogueSkill.FrigidFinesse:
      case RogueSkill.ChillingWeight:
      case RogueSkill.PrecisionImbuement:
        return RogueCluster.Imbuement;
      case RogueSkill.DeathTrap:
      case RogueSkill.PrimeDeathTrap:
      case RogueSkill.SupremeDeathTrap:
      case RogueSkill.RainOfArrows:
      case RogueSkill.PrimeRainOfArrows:
      case RogueSkill.SupremeRainOfArrows:
      case RogueSkill.ShadowClone:
      case RogueSkill.PrimeShadowClone:
      case RogueSkill.SupremeShadowClone:
      case RogueSkill.Innervation:
      case RogueSkill.AlchemistsFortune:
      case RogueSkill.SecondWind:
      case RogueSkill.AdrenalineRush:
      case RogueSkill.Haste:
      case RogueSkill.Impetus:
      case RogueSkill.TrapMastery:
      case RogueSkill.Aftermath:
        return RogueCluster.Ultimate;
      case RogueSkill.Momentum:
      case RogueSkill.CloseQuartersCombat:
      case RogueSkill.Precision:
      case RogueSkill.Victimize:
      case RogueSkill.Exposure:
        return RogueCluster.KeyPassive;
      default:
        assert(false, 'case $rogueSkill missing');
        return RogueCluster.Basic;
    }
  }

  static SkillType skillTypeOf(RogueSkill rogueSkill) {
    switch (rogueSkill) {
      case RogueSkill.BladeShift:
      case RogueSkill.ForcefulArrow:
      case RogueSkill.Heartseeker:
      case RogueSkill.InvigoratingStrike:
      case RogueSkill.Puncture:
      case RogueSkill.Barrage:
      case RogueSkill.Flurry:
      case RogueSkill.PenetratingShot:
      case RogueSkill.RapidFire:
      case RogueSkill.TwistingBlades:
      case RogueSkill.Caltrops:
      case RogueSkill.Dash:
      case RogueSkill.ShadowStep:
        return SkillType.Active;
      case RogueSkill.EnhancedBladeShift:
      case RogueSkill.EnhancedForcefulArrow:
      case RogueSkill.EnhancedHeartseeker:
      case RogueSkill.EnhancedInvigoratingStrike:
      case RogueSkill.EnhancedPuncture:
      case RogueSkill.EnhancedBarrage:
      case RogueSkill.EnhancedFlurry:
      case RogueSkill.EnhancedPenetratingShot:
      case RogueSkill.EnhancedRapidFire:
      case RogueSkill.EnhancedTwistingBlades:
      case RogueSkill.EnhancedCaltrops:
      case RogueSkill.EnhancedDash:
      case RogueSkill.EnhancedShadowStep:
      case RogueSkill.EnhancedConcealment:
      case RogueSkill.EnhancedDarkShroud:
      case RogueSkill.EnhancedPoisonTrap:
      case RogueSkill.EnhancedSmokeGrenade:
      case RogueSkill.EnhancedColdImbuement:
      case RogueSkill.EnhancedPoisonImbuement:
      case RogueSkill.EnhancedShadowImbuement:
      case RogueSkill.PrimeDeathTrap:
      case RogueSkill.PrimeRainOfArrows:
      case RogueSkill.PrimeShadowClone:
        return SkillType.Enhancement;
      case RogueSkill.FundamentalBladeShift:
      case RogueSkill.PrimaryBladeShift:
      case RogueSkill.FundamentalForcefulArrow:
      case RogueSkill.PrimaryForcefulArrow:
      case RogueSkill.FundamentalHeartseeker:
      case RogueSkill.PrimaryHeartseeker:
      case RogueSkill.FundamentalInvigoratingStrike:
      case RogueSkill.PrimaryInvigoratingStrike:
      case RogueSkill.FundamentalPuncture:
      case RogueSkill.PrimaryPuncture:
      case RogueSkill.AdvancedBarrage:
      case RogueSkill.ImprovedBarrage:
      case RogueSkill.AdvancedFlurry:
      case RogueSkill.ImprovedFlurry:
      case RogueSkill.AdvancedPenetratingShot:
      case RogueSkill.ImprovedPenetratingShot:
      case RogueSkill.AdvancedRapidFire:
      case RogueSkill.ImprovedRapidFire:
      case RogueSkill.AdvancedTwistingBlades:
      case RogueSkill.ImprovedTwistingBlades:
      case RogueSkill.DisciplinedCaltrops:
      case RogueSkill.MethodicalCaltrops:
      case RogueSkill.DisciplinedDash:
      case RogueSkill.MethodicalDash:
      case RogueSkill.DisciplinedShadowStep:
      case RogueSkill.MethodicalShadowStep:
      case RogueSkill.CounteringConcealment:
      case RogueSkill.SubvertingConcealment:
      case RogueSkill.CounteringDarkShroud:
      case RogueSkill.SubvertingDarkShroud:
      case RogueSkill.CounteringPoisonTrap:
      case RogueSkill.SubvertingPoisonTrap:
      case RogueSkill.CounteringSmokeGrenade:
      case RogueSkill.SubvertingSmokeGrenade:
      case RogueSkill.BlendedColdImbuement:
      case RogueSkill.MixedColdImbuement:
      case RogueSkill.BlendedPoisonImbuement:
      case RogueSkill.MixedPoisonImbuement:
      case RogueSkill.BlendedShadowImbuement:
      case RogueSkill.MixedShadowImbuement:
      case RogueSkill.SupremeDeathTrap:
      case RogueSkill.SupremeRainOfArrows:
      case RogueSkill.SupremeShadowClone:
        return SkillType.Upgrade;
      case RogueSkill.Sturdy:
      case RogueSkill.SiphoningStrikes:
      case RogueSkill.StutterStep:
      case RogueSkill.Concussive:
      case RogueSkill.RapidGambits:
      case RogueSkill.TrickAttacks:
      case RogueSkill.Rugged:
      case RogueSkill.Concealment:
      case RogueSkill.DarkShroud:
      case RogueSkill.PoisonTrap:
      case RogueSkill.SmokeGrenade:
      case RogueSkill.ColdImbuement:
      case RogueSkill.PoisonImbuement:
      case RogueSkill.ShadowImbuement:
      case RogueSkill.DeathTrap:
      case RogueSkill.RainOfArrows:
      case RogueSkill.ShadowClone:
      case RogueSkill.ReactiveDefense:
      case RogueSkill.WeaponMastery:
      case RogueSkill.Exploit:
      case RogueSkill.Malice:
      case RogueSkill.Agile:
      case RogueSkill.MendingObscurity:
      case RogueSkill.DeadlyVenom:
      case RogueSkill.DebilitatingToxins:
      case RogueSkill.AlchemicalAdvantage:
      case RogueSkill.ShadowCrash:
      case RogueSkill.ConsumingShadows:
      case RogueSkill.FrigidFinesse:
      case RogueSkill.ChillingWeight:
      case RogueSkill.PrecisionImbuement:
      case RogueSkill.Innervation:
      case RogueSkill.AlchemistsFortune:
      case RogueSkill.SecondWind:
      case RogueSkill.AdrenalineRush:
      case RogueSkill.Haste:
      case RogueSkill.Impetus:
      case RogueSkill.TrapMastery:
      case RogueSkill.Aftermath:
      case RogueSkill.Momentum:
      case RogueSkill.CloseQuartersCombat:
      case RogueSkill.Precision:
      case RogueSkill.Victimize:
      case RogueSkill.Exposure:
        return SkillType.Passive;
    }
  }

  static Tree<Enum> get bladeShift => _skillTree(
        RogueSkill.BladeShift,
        [
          _skillTree(
            RogueSkill.EnhancedBladeShift,
            [
              _skillTree(RogueSkill.FundamentalBladeShift, _childless),
              _skillTree(RogueSkill.PrimaryBladeShift, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get forcefulArrow => _skillTree(
        RogueSkill.ForcefulArrow,
        [
          _skillTree(
            RogueSkill.EnhancedForcefulArrow,
            [
              _skillTree(RogueSkill.FundamentalForcefulArrow, _childless),
              _skillTree(RogueSkill.PrimaryForcefulArrow, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get heartseeker => _skillTree(
        RogueSkill.Heartseeker,
        [
          _skillTree(
            RogueSkill.EnhancedHeartseeker,
            [
              _skillTree(RogueSkill.FundamentalHeartseeker, _childless),
              _skillTree(RogueSkill.PrimaryHeartseeker, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get invigoratingStrike => _skillTree(
        RogueSkill.InvigoratingStrike,
        [
          _skillTree(
            RogueSkill.EnhancedInvigoratingStrike,
            [
              _skillTree(RogueSkill.FundamentalInvigoratingStrike, _childless),
              _skillTree(RogueSkill.PrimaryInvigoratingStrike, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get puncture => _skillTree(
        RogueSkill.Puncture,
        [
          _skillTree(
            RogueSkill.EnhancedPuncture,
            [
              _skillTree(RogueSkill.FundamentalPuncture, _childless),
              _skillTree(RogueSkill.PrimaryPuncture, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get barrage => _skillTree(
        RogueSkill.Barrage,
        [
          _skillTree(
            RogueSkill.EnhancedBarrage,
            [
              _skillTree(RogueSkill.AdvancedBarrage, _childless),
              _skillTree(RogueSkill.ImprovedBarrage, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get flurry => _skillTree(
        RogueSkill.Flurry,
        [
          _skillTree(
            RogueSkill.EnhancedFlurry,
            [
              _skillTree(RogueSkill.AdvancedFlurry, _childless),
              _skillTree(RogueSkill.ImprovedFlurry, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get penetratingShot => _skillTree(
        RogueSkill.PenetratingShot,
        [
          _skillTree(
            RogueSkill.EnhancedPenetratingShot,
            [
              _skillTree(RogueSkill.AdvancedPenetratingShot, _childless),
              _skillTree(RogueSkill.ImprovedPenetratingShot, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get rapidFire => _skillTree(
        RogueSkill.RapidFire,
        [
          _skillTree(
            RogueSkill.EnhancedRapidFire,
            [
              _skillTree(RogueSkill.AdvancedRapidFire, _childless),
              _skillTree(RogueSkill.ImprovedRapidFire, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get twistingBlades => _skillTree(
        RogueSkill.TwistingBlades,
        [
          _skillTree(
            RogueSkill.EnhancedTwistingBlades,
            [
              _skillTree(RogueSkill.AdvancedTwistingBlades, _childless),
              _skillTree(RogueSkill.ImprovedTwistingBlades, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get sturdy => _skillTree(
        RogueSkill.Sturdy,
        [
          _skillTree(RogueSkill.SiphoningStrikes, _childless),
        ],
      );

  static Tree<Enum> get stutterStep =>
      _skillTree(RogueSkill.StutterStep, _childless);

  static Tree<Enum> get caltrops => _skillTree(
        RogueSkill.Caltrops,
        [
          _skillTree(
            RogueSkill.EnhancedCaltrops,
            [
              _skillTree(RogueSkill.DisciplinedCaltrops, _childless),
              _skillTree(RogueSkill.MethodicalCaltrops, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get dash => _skillTree(
        RogueSkill.Dash,
        [
          _skillTree(
            RogueSkill.EnhancedDash,
            [
              _skillTree(RogueSkill.DisciplinedDash, _childless),
              _skillTree(RogueSkill.MethodicalDash, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get shadowStep => _skillTree(
        RogueSkill.ShadowStep,
        [
          _skillTree(
            RogueSkill.EnhancedShadowStep,
            [
              _skillTree(RogueSkill.DisciplinedShadowStep, _childless),
              _skillTree(RogueSkill.MethodicalShadowStep, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get concussive => _skillTree(
        RogueSkill.Concussive,
        [
          _skillTree(RogueSkill.TrickAttacks, _childless),
        ],
      );

  static Tree<Enum> get rapidGambits => _skillTree(
        RogueSkill.RapidGambits,
        [
          _skillTree(RogueSkill.TrickAttacks, _childless),
        ],
      );

  static Tree<Enum> get rugged => _skillTree(
        RogueSkill.Rugged,
        [
          _skillTree(RogueSkill.ReactiveDefense, _childless),
        ],
      );

  static Tree<Enum> get weaponMastery =>
      _skillTree(RogueSkill.WeaponMastery, _childless);

  static Tree<Enum> get concealment => _skillTree(
        RogueSkill.Concealment,
        [
          _skillTree(
            RogueSkill.EnhancedConcealment,
            [
              _skillTree(RogueSkill.CounteringConcealment, _childless),
              _skillTree(RogueSkill.SubvertingConcealment, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get darkShroud => _skillTree(
        RogueSkill.DarkShroud,
        [
          _skillTree(
            RogueSkill.EnhancedDarkShroud,
            [
              _skillTree(RogueSkill.CounteringDarkShroud, _childless),
              _skillTree(RogueSkill.SubvertingDarkShroud, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get poisonTrap => _skillTree(
        RogueSkill.PoisonTrap,
        [
          _skillTree(
            RogueSkill.EnhancedPoisonTrap,
            [
              _skillTree(RogueSkill.CounteringPoisonTrap, _childless),
              _skillTree(RogueSkill.SubvertingPoisonTrap, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get smokeGrenade => _skillTree(
        RogueSkill.SmokeGrenade,
        [
          _skillTree(
            RogueSkill.EnhancedSmokeGrenade,
            [
              _skillTree(RogueSkill.CounteringSmokeGrenade, _childless),
              _skillTree(RogueSkill.SubvertingSmokeGrenade, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get exploit => _skillTree(
        RogueSkill.Exploit,
        [
          _skillTree(RogueSkill.Malice, _childless),
        ],
      );

  static Tree<Enum> get agile => _skillTree(
        RogueSkill.Agile,
        [
          _skillTree(RogueSkill.MendingObscurity, _childless),
        ],
      );

  static Tree<Enum> get coldImbuement => _skillTree(
        RogueSkill.ColdImbuement,
        [
          _skillTree(
            RogueSkill.EnhancedColdImbuement,
            [
              _skillTree(RogueSkill.BlendedColdImbuement, _childless),
              _skillTree(RogueSkill.MixedColdImbuement, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get poisonImbuement => _skillTree(
        RogueSkill.PoisonImbuement,
        [
          _skillTree(
            RogueSkill.EnhancedPoisonImbuement,
            [
              _skillTree(RogueSkill.BlendedPoisonImbuement, _childless),
              _skillTree(RogueSkill.MixedPoisonImbuement, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get shadowImbuement => _skillTree(
        RogueSkill.ShadowImbuement,
        [
          _skillTree(
            RogueSkill.EnhancedShadowImbuement,
            [
              _skillTree(RogueSkill.BlendedShadowImbuement, _childless),
              _skillTree(RogueSkill.MixedShadowImbuement, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get deadlyVenom => _skillTree(
        RogueSkill.DeadlyVenom,
        [
          _skillTree(RogueSkill.DebilitatingToxins, _childless),
          _skillTree(RogueSkill.AlchemicalAdvantage, _childless),
        ],
      );

  static Tree<Enum> get shadowCrash => _skillTree(
        RogueSkill.ShadowCrash,
        [
          _skillTree(RogueSkill.ConsumingShadows, _childless),
        ],
      );

  static Tree<Enum> get frigidFinesse => _skillTree(
        RogueSkill.FrigidFinesse,
        [
          _skillTree(RogueSkill.ChillingWeight, _childless),
        ],
      );

  static Tree<Enum> get precisionImbuement =>
      _skillTree(RogueSkill.PrecisionImbuement, _childless);

  static Tree<Enum> get deathTrap => _skillTree(
        RogueSkill.DeathTrap,
        [
          _skillTree(
            RogueSkill.PrimeDeathTrap,
            [
              _skillTree(RogueSkill.SupremeDeathTrap, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get rainOfArrows => _skillTree(
        RogueSkill.RainOfArrows,
        [
          _skillTree(
            RogueSkill.PrimeRainOfArrows,
            [
              _skillTree(RogueSkill.SupremeRainOfArrows, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get shadowClone => _skillTree(
        RogueSkill.ShadowClone,
        [
          _skillTree(
            RogueSkill.PrimeShadowClone,
            [
              _skillTree(RogueSkill.SupremeShadowClone, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get innervation => _skillTree(
        RogueSkill.Innervation,
        [
          _skillTree(RogueSkill.AlchemistsFortune, _childless),
          _skillTree(RogueSkill.SecondWind, _childless),
        ],
      );

  static Tree<Enum> get adrenalineRush => _skillTree(
        RogueSkill.AdrenalineRush,
        [
          _skillTree(RogueSkill.Haste, _childless),
          _skillTree(RogueSkill.Impetus, _childless),
        ],
      );

  static Tree<Enum> get trapMastery =>
      _skillTree(RogueSkill.TrapMastery, _childless);

  static Tree<Enum> get aftermath =>
      _skillTree(RogueSkill.Aftermath, _childless);

  static Tree<Enum> get momentum => _skillTree(RogueSkill.Momentum, _childless);

  static Tree<Enum> get closeQuartersCombat =>
      _skillTree(RogueSkill.CloseQuartersCombat, _childless);

  static Tree<Enum> get precision =>
      _skillTree(RogueSkill.Precision, _childless);

  static Tree<Enum> get victimize =>
      _skillTree(RogueSkill.Victimize, _childless);

  static Tree<Enum> get exposure => _skillTree(RogueSkill.Exposure, _childless);

  static Tree<Enum> get basic => _skillTree(
        RogueCluster.Basic,
        [
          bladeShift,
          forcefulArrow,
          heartseeker,
          invigoratingStrike,
          puncture,
        ],
      );

  static Tree<Enum> get core => _skillTree(
        RogueCluster.Core,
        [
          barrage,
          flurry,
          penetratingShot,
          rapidFire,
          twistingBlades,
          sturdy,
          stutterStep,
        ],
      );

  static Tree<Enum> get agility => _skillTree(
        RogueCluster.Agility,
        [
          caltrops,
          dash,
          shadowStep,
          concussive,
          rugged,
          weaponMastery,
        ],
      );

  static Tree<Enum> get subterfuge => _skillTree(
        RogueCluster.Subterfuge,
        [
          concealment,
          darkShroud,
          poisonTrap,
          smokeGrenade,
          exploit,
          agile,
        ],
      );

  static Tree<Enum> get imbuement => _skillTree(
        RogueCluster.Imbuement,
        [
          coldImbuement,
          poisonImbuement,
          shadowImbuement,
          deadlyVenom,
          shadowCrash,
          frigidFinesse,
          precisionImbuement,
        ],
      );

  static Tree<Enum> get ultimate => _skillTree(
        RogueCluster.Ultimate,
        [
          deathTrap,
          rainOfArrows,
          shadowClone,
          innervation,
          adrenalineRush,
          trapMastery,
          aftermath,
        ],
      );

  static Tree<Enum> get keyPassive => _skillTree(
        RogueCluster.KeyPassive,
        [
          momentum,
          closeQuartersCombat,
          precision,
          victimize,
          exposure,
        ],
      );

  static Tree<Enum> get rogue => _skillTree(
        Hero.Rogue,
        [
          basic,
          core,
          agility,
          subterfuge,
          imbuement,
          ultimate,
          keyPassive,
        ],
      );
}
