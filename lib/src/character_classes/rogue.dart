import 'package:d4_utils/src/data_structures/pair.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/rogue_cluster.dart';
import 'package:d4_utils/src/enums/rogue_skill.dart';
import 'package:d4_utils/src/enums/character_class.dart';

abstract class Rogue {
  static Tree<Pair<Enum, int>> _tree(
          Enum e, List<Tree<Pair<Enum, int>>> children) =>
      Tree(element: Pair(e, 0), children: children);

  static List<Tree<Pair<Enum, int>>> get _childless => const [];

  /* Basic */
  static Tree<Pair<Enum, int>> get bladeShift => _tree(
        RogueSkill.BladeShift,
        [
          _tree(
            RogueSkill.EnhancedBladeShift,
            [
              _tree(RogueSkill.FundamentalBladeShift, _childless),
              _tree(RogueSkill.PrimaryBladeShift, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get forcefulArrow => _tree(
        RogueSkill.ForcefulArrow,
        [
          _tree(
            RogueSkill.EnhancedForcefulArrow,
            [
              _tree(RogueSkill.FundamentalForcefulArrow, _childless),
              _tree(RogueSkill.PrimaryForcefulArrow, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get heartseeker => _tree(
        RogueSkill.Heartseeker,
        [
          _tree(
            RogueSkill.EnhancedHeartseeker,
            [
              _tree(RogueSkill.FundamentalHeartseeker, _childless),
              _tree(RogueSkill.PrimaryHeartseeker, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get invigoratingStrike => _tree(
        RogueSkill.InvigoratingStrike,
        [
          _tree(
            RogueSkill.EnhancedInvigoratingStrike,
            [
              _tree(RogueSkill.FundamentalInvigoratingStrike, _childless),
              _tree(RogueSkill.PrimaryInvigoratingStrike, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get puncture => _tree(
        RogueSkill.Puncture,
        [
          _tree(
            RogueSkill.EnhancedPuncture,
            [
              _tree(RogueSkill.FundamentalPuncture, _childless),
              _tree(RogueSkill.PrimaryPuncture, _childless),
            ],
          ),
        ],
      );

  /* Core */
  static Tree<Pair<Enum, int>> get barrage => _tree(
        RogueSkill.Barrage,
        [
          _tree(
            RogueSkill.EnhancedBarrage,
            [
              _tree(RogueSkill.AdvancedBarrage, _childless),
              _tree(RogueSkill.ImprovedBarrage, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get flurry => _tree(
        RogueSkill.Flurry,
        [
          _tree(
            RogueSkill.EnhancedFlurry,
            [
              _tree(RogueSkill.AdvancedFlurry, _childless),
              _tree(RogueSkill.ImprovedFlurry, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get penetratingShot => _tree(
        RogueSkill.PenetratingShot,
        [
          _tree(
            RogueSkill.EnhancedPenetratingShot,
            [
              _tree(RogueSkill.AdvancedPenetratingShot, _childless),
              _tree(RogueSkill.ImprovedPenetratingShot, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get rapidFire => _tree(
        RogueSkill.RapidFire,
        [
          _tree(
            RogueSkill.EnhancedRapidFire,
            [
              _tree(RogueSkill.AdvancedRapidFire, _childless),
              _tree(RogueSkill.ImprovedRapidFire, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get twistingBlades => _tree(
        RogueSkill.TwistingBlades,
        [
          _tree(
            RogueSkill.EnhancedTwistingBlades,
            [
              _tree(RogueSkill.AdvancedTwistingBlades, _childless),
              _tree(RogueSkill.ImprovedTwistingBlades, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get sturdy => _tree(
        RogueSkill.Sturdy,
        [
          _tree(RogueSkill.SiphoningStrikes, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get stutterStep =>
      _tree(RogueSkill.StutterStep, _childless);

  /* Agility */
  static Tree<Pair<Enum, int>> get caltrops => _tree(
        RogueSkill.Caltrops,
        [
          _tree(
            RogueSkill.EnhancedCaltrops,
            [
              _tree(RogueSkill.DisciplinedCaltrops, _childless),
              _tree(RogueSkill.MethodicalCaltrops, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get dash => _tree(
        RogueSkill.Dash,
        [
          _tree(
            RogueSkill.EnhancedDash,
            [
              _tree(RogueSkill.DisciplinedDash, _childless),
              _tree(RogueSkill.MethodicalDash, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get shadowStep => _tree(
        RogueSkill.ShadowStep,
        [
          _tree(
            RogueSkill.EnhancedShadowStep,
            [
              _tree(RogueSkill.DisciplinedShadowStep, _childless),
              _tree(RogueSkill.MethodicalShadowStep, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get concussive => _tree(
        RogueSkill.Concussive,
        [
          // TODO: this one has two parents (see below)
          _tree(RogueSkill.TrickAttacks, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get rapidGambits => _tree(
        RogueSkill.RapidGambits,
        [
          // TODO: this one has two parents (see above)
          _tree(RogueSkill.TrickAttacks, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get rugged => _tree(
        RogueSkill.Rugged,
        [
          _tree(RogueSkill.ReactiveDefense, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get weaponMastery =>
      _tree(RogueSkill.WeaponMastery, _childless);

  /* Subterfuge */
  static Tree<Pair<Enum, int>> get concealment => _tree(
        RogueSkill.Concealment,
        [
          _tree(
            RogueSkill.EnhancedConcealment,
            [
              _tree(RogueSkill.CounteringConcealment, _childless),
              _tree(RogueSkill.SubvertingConcealment, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get darkShroud => _tree(
        RogueSkill.DarkShroud,
        [
          _tree(
            RogueSkill.EnhancedDarkShroud,
            [
              _tree(RogueSkill.CounteringDarkShroud, _childless),
              _tree(RogueSkill.SubvertingDarkShroud, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get poisonTrap => _tree(
        RogueSkill.PoisonTrap,
        [
          _tree(
            RogueSkill.EnhancedPoisonTrap,
            [
              _tree(RogueSkill.CounteringPoisonTrap, _childless),
              _tree(RogueSkill.SubvertingPoisonTrap, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get smokeGrenade => _tree(
        RogueSkill.SmokeGrenade,
        [
          _tree(
            RogueSkill.EnhancedSmokeGrenade,
            [
              _tree(RogueSkill.CounteringSmokeGrenade, _childless),
              _tree(RogueSkill.SubvertingSmokeGrenade, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get exploit => _tree(
        RogueSkill.Exploit,
        [
          _tree(RogueSkill.Malice, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get agile => _tree(
        RogueSkill.Agile,
        [
          _tree(RogueSkill.MendingObscurity, _childless),
        ],
      );

  /* Imbuement */
  static Tree<Pair<Enum, int>> get coldImbuement => _tree(
        RogueSkill.ColdImbuement,
        [
          _tree(
            RogueSkill.EnhancedColdImbuement,
            [
              _tree(RogueSkill.BlendedColdImbuement, _childless),
              _tree(RogueSkill.MixedColdImbuement, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get poisonImbuement => _tree(
        RogueSkill.PoisonImbuement,
        [
          _tree(
            RogueSkill.EnhancedPoisonImbuement,
            [
              _tree(RogueSkill.BlendedPoisonImbuement, _childless),
              _tree(RogueSkill.MixedPoisonImbuement, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get shadowImbuement => _tree(
        RogueSkill.ShadowImbuement,
        [
          _tree(
            RogueSkill.EnhancedShadowImbuement,
            [
              _tree(RogueSkill.BlendedShadowImbuement, _childless),
              _tree(RogueSkill.MixedShadowImbuement, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get deadlyVenom => _tree(
        RogueSkill.DeadlyVenom,
        [
          _tree(RogueSkill.DebilitatingToxins, _childless),
          _tree(RogueSkill.AlchemicalAdvantage, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get shadowCrash => _tree(
        RogueSkill.ShadowCrash,
        [
          _tree(RogueSkill.ConsumingShadows, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get frigidFinesse => _tree(
        RogueSkill.FrigidFinesse,
        [
          _tree(RogueSkill.ChillingWeight, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get precisionImbuement =>
      _tree(RogueSkill.PrecisionImbuement, _childless);

  /* Ultimate */
  static Tree<Pair<Enum, int>> get deathTrap => _tree(
        RogueSkill.DeathTrap,
        [
          _tree(
            RogueSkill.PrimeDeathTrap,
            [
              _tree(RogueSkill.SupremeDeathTrap, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get rainOfArrows => _tree(
        RogueSkill.RainOfArrows,
        [
          _tree(
            RogueSkill.PrimeRainOfArrows,
            [
              _tree(RogueSkill.SupremeRainOfArrows, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get shadowClone => _tree(
        RogueSkill.ShadowClone,
        [
          _tree(
            RogueSkill.PrimeShadowClone,
            [
              _tree(RogueSkill.SupremeShadowClone, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get innervation => _tree(
        RogueSkill.Innervation,
        [
          _tree(RogueSkill.AlchemistsFortune, _childless),
          _tree(RogueSkill.SecondWind, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get adrenalineRush => _tree(
        RogueSkill.AdrenalineRush,
        [
          _tree(RogueSkill.Haste, _childless),
          _tree(RogueSkill.Impetus, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get trapMastery =>
      _tree(RogueSkill.TrapMastery, _childless);

  static Tree<Pair<Enum, int>> get aftermath =>
      _tree(RogueSkill.Aftermath, _childless);

  /* Key Passive */
  static Tree<Pair<Enum, int>> get momentum =>
      _tree(RogueSkill.Momentum, _childless);

  static Tree<Pair<Enum, int>> get closeQuartersCombat =>
      _tree(RogueSkill.CloseQuartersCombat, _childless);

  static Tree<Pair<Enum, int>> get precision =>
      _tree(RogueSkill.Precision, _childless);

  static Tree<Pair<Enum, int>> get victimize =>
      _tree(RogueSkill.Victimize, _childless);

  static Tree<Pair<Enum, int>> get exposure =>
      _tree(RogueSkill.Exposure, _childless);

  static Tree<Pair<Enum, int>> get basic => _tree(
        RogueCluster.Basic,
        [
          bladeShift,
          forcefulArrow,
          heartseeker,
          invigoratingStrike,
          puncture,
        ],
      );

  static Tree<Pair<Enum, int>> get core => _tree(
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

  static Tree<Pair<Enum, int>> get agility => _tree(
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

  static Tree<Pair<Enum, int>> get subterfuge => _tree(
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

  static Tree<Pair<Enum, int>> get imbuement => _tree(
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

  static Tree<Pair<Enum, int>> get ultimate => _tree(
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

  static Tree<Pair<Enum, int>> get keyPassive => _tree(
        RogueCluster.KeyPassive,
        [
          momentum,
          closeQuartersCombat,
          precision,
          victimize,
          exposure,
        ],
      );

  static Tree<Pair<Enum, int>> get rogue => _tree(
        CharacterClass.Rogue,
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
