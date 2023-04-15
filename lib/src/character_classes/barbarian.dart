import 'package:d4_utils/src/data_structures/pair.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/barbarian_cluster.dart';
import 'package:d4_utils/src/enums/barbarian_skill.dart';
import 'package:d4_utils/src/enums/character_class.dart';

abstract class Barbarian {
  static Tree<Pair<Enum, int>> _tree(
          Enum e, List<Tree<Pair<Enum, int>>> children) =>
      Tree(element: Pair(e, 0), children: children);

  static List<Tree<Pair<Enum, int>>> get _childless => const [];

  static Tree<Pair<Enum, int>> get bash => _tree(
        BarbarianSkill.Bash,
        [
          _tree(
            BarbarianSkill.EnhancedBash,
            [
              _tree(BarbarianSkill.BattleBash, _childless),
              _tree(BarbarianSkill.CombatBash, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get flay => _tree(
        BarbarianSkill.Flay,
        [
          _tree(
            BarbarianSkill.EnhancedFlay,
            [
              _tree(BarbarianSkill.BattleFlay, _childless),
              _tree(BarbarianSkill.CombatFlay, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get frenzy => _tree(
        BarbarianSkill.Frenzy,
        [
          _tree(
            BarbarianSkill.EnhancedFrenzy,
            [
              _tree(BarbarianSkill.BattleFrenzy, _childless),
              _tree(BarbarianSkill.CombatFrenzy, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get lungingStrike => _tree(
        BarbarianSkill.LungingStrike,
        [
          _tree(
            BarbarianSkill.EnhancedLungingStrike,
            [
              _tree(BarbarianSkill.BattleLungingStrike, _childless),
              _tree(BarbarianSkill.CombatLungingStrike, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get doubleSwing => _tree(
        BarbarianSkill.DoubleSwing,
        [
          _tree(
            BarbarianSkill.EnhancedDoubleSwing,
            [
              _tree(BarbarianSkill.FuriousDoubleSwing, _childless),
              _tree(BarbarianSkill.ViolentDoubleSwing, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get hammerOfTheAncients => _tree(
        BarbarianSkill.HammerOfTheAncients,
        [
          _tree(
            BarbarianSkill.EnhancedHammerOfTheAncients,
            [
              _tree(BarbarianSkill.FuriousHammerOfTheAncients, _childless),
              _tree(BarbarianSkill.ViolentHammerOfTheAncients, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get rend => _tree(
        BarbarianSkill.Rend,
        [
          _tree(
            BarbarianSkill.EnhancedRend,
            [
              _tree(BarbarianSkill.FuriousRend, _childless),
              _tree(BarbarianSkill.ViolentRend, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get upheaval => _tree(
        BarbarianSkill.Upheaval,
        [
          _tree(
            BarbarianSkill.EnhancedUpheaval,
            [
              _tree(BarbarianSkill.FuriousUpheaval, _childless),
              _tree(BarbarianSkill.ViolentUpheaval, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get whirlwind => _tree(
        BarbarianSkill.Whirlwind,
        [
          _tree(
            BarbarianSkill.EnhancedWhirlwind,
            [
              _tree(BarbarianSkill.FuriousWhirlwind, _childless),
              _tree(BarbarianSkill.ViolentWhirlwind, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get pressurePoint =>
      _tree(BarbarianSkill.PressurePoint, _childless);

  static Tree<Pair<Enum, int>> get endlessFury =>
      _tree(BarbarianSkill.EndlessFury, _childless);

  static Tree<Pair<Enum, int>> get challengingShout => _tree(
        BarbarianSkill.ChallengingShout,
        [
          _tree(
            BarbarianSkill.EnhancedChallengingShout,
            [
              _tree(BarbarianSkill.StrategicChallengingShout, _childless),
              _tree(BarbarianSkill.TacticalChallengingShout, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get groundStomp => _tree(
        BarbarianSkill.GroundStomp,
        [
          _tree(
            BarbarianSkill.EnhancedGroundStomp,
            [
              _tree(BarbarianSkill.StrategicGroundStomp, _childless),
              _tree(BarbarianSkill.TacticalGroundStomp, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get ironSkin => _tree(
        BarbarianSkill.IronSkin,
        [
          _tree(
            BarbarianSkill.EnhancedIronSkin,
            [
              _tree(BarbarianSkill.StrategicIronSkin, _childless),
              _tree(BarbarianSkill.TacticalIronSkin, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get rallyingCry => _tree(
        BarbarianSkill.RallyingCry,
        [
          _tree(
            BarbarianSkill.EnhancedRallyingCry,
            [
              _tree(BarbarianSkill.StrategicRallyingCry, _childless),
              _tree(BarbarianSkill.TacticalRallyingCry, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get imposingPresence => _tree(
        BarbarianSkill.ImposingPresence,
        [
          _tree(BarbarianSkill.MartialVigor, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get outburst => _tree(
        BarbarianSkill.Outburst,
        [
          _tree(BarbarianSkill.ToughAsNails, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get charge => _tree(
        BarbarianSkill.Charge,
        [
          _tree(
            BarbarianSkill.EnhancedCharge,
            [
              _tree(BarbarianSkill.MightyCharge, _childless),
              _tree(BarbarianSkill.PowerCharge, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get kick => _tree(
        BarbarianSkill.Kick,
        [
          _tree(
            BarbarianSkill.EnhancedKick,
            [
              _tree(BarbarianSkill.MightyKick, _childless),
              _tree(BarbarianSkill.PowerKick, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get leap => _tree(
        BarbarianSkill.Leap,
        [
          _tree(
            BarbarianSkill.EnhancedLeap,
            [
              _tree(BarbarianSkill.MightyLeap, _childless),
              _tree(BarbarianSkill.PowerLeap, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get warCry => _tree(
        BarbarianSkill.WarCry,
        [
          _tree(
            BarbarianSkill.EnhancedWarCry,
            [
              _tree(BarbarianSkill.MightyWarCry, _childless),
              _tree(BarbarianSkill.PowerWarCry, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get boomingVoice => _tree(
        BarbarianSkill.BoomingVoice,
        [
          _tree(BarbarianSkill.RaidLeader, _childless),
          _tree(BarbarianSkill.GutturalYell, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get aggressiveResistance => _tree(
        BarbarianSkill.AggressiveResistance,
        [
          _tree(BarbarianSkill.BattleFervor, _childless),
          _tree(BarbarianSkill.ProlificFury, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get swiftness => _tree(
        BarbarianSkill.Swiftness,
        [
          _tree(BarbarianSkill.QuickImpulses, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get deathBlow => _tree(
        BarbarianSkill.DeathBlow,
        [
          _tree(
            BarbarianSkill.EnhancedDeathBlow,
            [
              _tree(BarbarianSkill.FightersDeathBlow, _childless),
              _tree(BarbarianSkill.WarriorsDeathBlow, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get rupture => _tree(
        BarbarianSkill.Rupture,
        [
          _tree(
            BarbarianSkill.EnhancedRupture,
            [
              _tree(BarbarianSkill.FightersRupture, _childless),
              _tree(BarbarianSkill.WarriorsRupture, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get steelGrasp => _tree(
        BarbarianSkill.SteelGrasp,
        [
          _tree(
            BarbarianSkill.EnhancedSteelGrasp,
            [
              _tree(BarbarianSkill.FightersSteelGrasp, _childless),
              _tree(BarbarianSkill.WarriorsSteelGrasp, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get pitFighter => _tree(
        BarbarianSkill.PitFighter,
        [
          _tree(
            BarbarianSkill.NoMercy,
            [
              // TODO: this one has two parents (see below)
              _tree(BarbarianSkill.ExposeVulnerability, _childless),
            ],
          ),
          _tree(
            BarbarianSkill.SlayingStrike,
            [
              // TODO: this one has two parents (see above)
              _tree(BarbarianSkill.ExposeVulnerability, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get thickSkin => _tree(
        BarbarianSkill.ThickSkin,
        [
          _tree(BarbarianSkill.DefensiveStance, _childless),
          _tree(BarbarianSkill.Counteroffensive, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get hamstring => _tree(
        BarbarianSkill.Hamstring,
        [
          _tree(BarbarianSkill.CutToTheBone, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get callOfTheAncients => _tree(
        BarbarianSkill.CallOfTheAncients,
        [
          _tree(
            BarbarianSkill.PrimeCallOfTheAncients,
            [
              _tree(BarbarianSkill.SupremeCallOfTheAncients, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get ironMaelstrom => _tree(
        BarbarianSkill.IronMaelstrom,
        [
          _tree(
            BarbarianSkill.PrimeIronMaelstrom,
            [
              _tree(BarbarianSkill.SupremeIronMaelstrom, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get wrathOfTheBerserker => _tree(
        BarbarianSkill.WrathOfTheBerserker,
        [
          _tree(
            BarbarianSkill.PrimeWrathOfTheBerserker,
            [
              _tree(BarbarianSkill.SupremeWrathOfTheBerserker, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get heavyHanded => _tree(
        BarbarianSkill.HeavyHanded,
        [
          // TODO: this one has two parents (see below)
          _tree(BarbarianSkill.BruteForce, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get wallop => _tree(
        BarbarianSkill.Wallop,
        [
          // TODO: this one has two parents (see above)
          _tree(BarbarianSkill.BruteForce, _childless),
          _tree(BarbarianSkill.Concussion, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get temperedFury => _tree(
        BarbarianSkill.TemperedFury,
        [
          _tree(BarbarianSkill.FuriousImpulse, _childless),
          _tree(BarbarianSkill.InvigoratingFury, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get duelist =>
      _tree(BarbarianSkill.Duelist, _childless);

  static Tree<Pair<Enum, int>> get unconstrained =>
      _tree(BarbarianSkill.Unconstrained, _childless);

  static Tree<Pair<Enum, int>> get walkingArsenal =>
      _tree(BarbarianSkill.WalkingArsenal, _childless);

  static Tree<Pair<Enum, int>> get unbridledRage =>
      _tree(BarbarianSkill.UnbridledRage, _childless);

  static Tree<Pair<Enum, int>> get gushingWounds =>
      _tree(BarbarianSkill.GushingWounds, _childless);

  static Tree<Pair<Enum, int>> get basic => _tree(
        BarbarianCluster.Basic,
        [
          bash,
          flay,
          frenzy,
          lungingStrike,
        ],
      );

  static Tree<Pair<Enum, int>> get core => _tree(
        BarbarianCluster.Core,
        [
          doubleSwing,
          hammerOfTheAncients,
          rend,
          upheaval,
          whirlwind,
        ],
      );

  static Tree<Pair<Enum, int>> get defensive => _tree(
        BarbarianCluster.Defensive,
        [
          challengingShout,
          groundStomp,
          ironSkin,
          rallyingCry,
          imposingPresence,
          outburst,
        ],
      );

  static Tree<Pair<Enum, int>> get brawling => _tree(
        BarbarianCluster.Brawling,
        [
          charge,
          kick,
          leap,
          warCry,
          boomingVoice,
          aggressiveResistance,
          swiftness,
        ],
      );

  static Tree<Pair<Enum, int>> get weaponMastery => _tree(
        BarbarianCluster.WeaponMastery,
        [
          deathBlow,
          rupture,
          steelGrasp,
          pitFighter,
          thickSkin,
          hamstring,
        ],
      );

  static Tree<Pair<Enum, int>> get ultimate => _tree(
        BarbarianCluster.Ultimate,
        [
          callOfTheAncients,
          ironMaelstrom,
          wrathOfTheBerserker,
          heavyHanded,
          wallop,
          temperedFury,
          duelist,
        ],
      );

  static Tree<Pair<Enum, int>> get keyPassive => _tree(
        BarbarianCluster.KeyPassive,
        [
          unconstrained,
          walkingArsenal,
          unbridledRage,
          gushingWounds,
        ],
      );

  static Tree<Pair<Enum, int>> get barbarian => _tree(
        CharacterClass.Barbarian,
        [
          basic,
          core,
          defensive,
          brawling,
          weaponMastery,
          ultimate,
          keyPassive,
        ],
      );
}
