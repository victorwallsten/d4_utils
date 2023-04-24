import 'package:d4_utils/src/data_structures/skill.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/rogue_cluster.dart';
import 'package:d4_utils/src/enums/rogue_skill.dart';
import 'package:d4_utils/src/enums/character_class.dart';

abstract class Rogue {
  static Tree<Skill> _skillTree(Enum e, List<Tree<Skill>> children) =>
      Tree(element: Skill(e), children: children);

  static List<Tree<Skill>> get _childless => const [];

  /* Basic */
  static Tree<Skill> get bladeShift => _skillTree(
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

  static Tree<Skill> get forcefulArrow => _skillTree(
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

  static Tree<Skill> get heartseeker => _skillTree(
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

  static Tree<Skill> get invigoratingStrike => _skillTree(
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

  static Tree<Skill> get puncture => _skillTree(
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

  /* Core */
  static Tree<Skill> get barrage => _skillTree(
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

  static Tree<Skill> get flurry => _skillTree(
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

  static Tree<Skill> get penetratingShot => _skillTree(
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

  static Tree<Skill> get rapidFire => _skillTree(
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

  static Tree<Skill> get twistingBlades => _skillTree(
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

  static Tree<Skill> get sturdy => _skillTree(
        RogueSkill.Sturdy,
        [
          _skillTree(RogueSkill.SiphoningStrikes, _childless),
        ],
      );

  static Tree<Skill> get stutterStep =>
      _skillTree(RogueSkill.StutterStep, _childless);

  /* Agility */
  static Tree<Skill> get caltrops => _skillTree(
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

  static Tree<Skill> get dash => _skillTree(
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

  static Tree<Skill> get shadowStep => _skillTree(
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

  static Tree<Skill> get concussive => _skillTree(
        RogueSkill.Concussive,
        [
          // TODO: this one has two parents (see below)
          _skillTree(RogueSkill.TrickAttacks, _childless),
        ],
      );

  static Tree<Skill> get rapidGambits => _skillTree(
        RogueSkill.RapidGambits,
        [
          // TODO: this one has two parents (see above)
          _skillTree(RogueSkill.TrickAttacks, _childless),
        ],
      );

  static Tree<Skill> get rugged => _skillTree(
        RogueSkill.Rugged,
        [
          _skillTree(RogueSkill.ReactiveDefense, _childless),
        ],
      );

  static Tree<Skill> get weaponMastery =>
      _skillTree(RogueSkill.WeaponMastery, _childless);

  /* Subterfuge */
  static Tree<Skill> get concealment => _skillTree(
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

  static Tree<Skill> get darkShroud => _skillTree(
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

  static Tree<Skill> get poisonTrap => _skillTree(
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

  static Tree<Skill> get smokeGrenade => _skillTree(
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

  static Tree<Skill> get exploit => _skillTree(
        RogueSkill.Exploit,
        [
          _skillTree(RogueSkill.Malice, _childless),
        ],
      );

  static Tree<Skill> get agile => _skillTree(
        RogueSkill.Agile,
        [
          _skillTree(RogueSkill.MendingObscurity, _childless),
        ],
      );

  /* Imbuement */
  static Tree<Skill> get coldImbuement => _skillTree(
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

  static Tree<Skill> get poisonImbuement => _skillTree(
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

  static Tree<Skill> get shadowImbuement => _skillTree(
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

  static Tree<Skill> get deadlyVenom => _skillTree(
        RogueSkill.DeadlyVenom,
        [
          _skillTree(RogueSkill.DebilitatingToxins, _childless),
          _skillTree(RogueSkill.AlchemicalAdvantage, _childless),
        ],
      );

  static Tree<Skill> get shadowCrash => _skillTree(
        RogueSkill.ShadowCrash,
        [
          _skillTree(RogueSkill.ConsumingShadows, _childless),
        ],
      );

  static Tree<Skill> get frigidFinesse => _skillTree(
        RogueSkill.FrigidFinesse,
        [
          _skillTree(RogueSkill.ChillingWeight, _childless),
        ],
      );

  static Tree<Skill> get precisionImbuement =>
      _skillTree(RogueSkill.PrecisionImbuement, _childless);

  /* Ultimate */
  static Tree<Skill> get deathTrap => _skillTree(
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

  static Tree<Skill> get rainOfArrows => _skillTree(
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

  static Tree<Skill> get shadowClone => _skillTree(
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

  static Tree<Skill> get innervation => _skillTree(
        RogueSkill.Innervation,
        [
          _skillTree(RogueSkill.AlchemistsFortune, _childless),
          _skillTree(RogueSkill.SecondWind, _childless),
        ],
      );

  static Tree<Skill> get adrenalineRush => _skillTree(
        RogueSkill.AdrenalineRush,
        [
          _skillTree(RogueSkill.Haste, _childless),
          _skillTree(RogueSkill.Impetus, _childless),
        ],
      );

  static Tree<Skill> get trapMastery =>
      _skillTree(RogueSkill.TrapMastery, _childless);

  static Tree<Skill> get aftermath =>
      _skillTree(RogueSkill.Aftermath, _childless);

  /* Key Passive */
  static Tree<Skill> get momentum =>
      _skillTree(RogueSkill.Momentum, _childless);

  static Tree<Skill> get closeQuartersCombat =>
      _skillTree(RogueSkill.CloseQuartersCombat, _childless);

  static Tree<Skill> get precision =>
      _skillTree(RogueSkill.Precision, _childless);

  static Tree<Skill> get victimize =>
      _skillTree(RogueSkill.Victimize, _childless);

  static Tree<Skill> get exposure =>
      _skillTree(RogueSkill.Exposure, _childless);

  static Tree<Skill> get basic => _skillTree(
        RogueCluster.Basic,
        [
          bladeShift,
          forcefulArrow,
          heartseeker,
          invigoratingStrike,
          puncture,
        ],
      );

  static Tree<Skill> get core => _skillTree(
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

  static Tree<Skill> get agility => _skillTree(
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

  static Tree<Skill> get subterfuge => _skillTree(
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

  static Tree<Skill> get imbuement => _skillTree(
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

  static Tree<Skill> get ultimate => _skillTree(
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

  static Tree<Skill> get keyPassive => _skillTree(
        RogueCluster.KeyPassive,
        [
          momentum,
          closeQuartersCombat,
          precision,
          victimize,
          exposure,
        ],
      );

  static Tree<Skill> get rogue => _skillTree(
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
